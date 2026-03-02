"""
Progress tracker for the Legie decompilation project.

Generates a comprehensive report of function-level matching status
by running the asm differ across all Unit1 functions.

Usage:
    python progress.py                  # terminal report
    python progress.py --report         # also write analysis/progress_report.txt
    python progress.py --unit Unit1     # filter to specific unit (default)
    python progress.py --all-units      # include all units, not just Unit1
"""

import sys
import json
import argparse
from pathlib import Path
from datetime import datetime

BASE = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(BASE / "tools"))

from asm_differ import (
    load_original_asm, parse_map_file, find_code_section_rva,
    disassemble_function, normalize_recompiled, diff_instructions,
    scan_source_annotations, resolve_function_query, get_next_func_va,
    ORIGINAL_ASM, MAP_FILE, RECOMP_EXE,
)

try:
    import pefile
except ImportError:
    print("ERROR: pip install pefile")
    sys.exit(1)


def run_progress(unit_filter=None, all_units=False):
    """Run the differ on all functions and collect results."""
    orig_data = load_original_asm()

    if all_units:
        target_funcs = orig_data
    else:
        unit = unit_filter or "Unit1"
        target_funcs = [f for f in orig_data if f["unit"] == unit]

    if not MAP_FILE.exists():
        print(f"ERROR: {MAP_FILE} not found. Run build.py first.")
        sys.exit(1)
    if not RECOMP_EXE.exists():
        print(f"ERROR: {RECOMP_EXE} not found. Run build.py first.")
        sys.exit(1)

    map_publics, image_base = parse_map_file(MAP_FILE)
    pe_data = RECOMP_EXE.read_bytes()
    pe = pefile.PE(data=pe_data)
    image_base = pe.OPTIONAL_HEADER.ImageBase
    src_annotations = scan_source_annotations()

    results = []

    for func in target_funcs:
        orig_func, recomp_name, recomp_va = resolve_function_query(
            func["address"], orig_data, map_publics, src_annotations
        )

        entry = {
            "name": func["name"],
            "address": func["address"],
            "unit": func["unit"],
            "orig_instrs": func["instruction_count"],
            "recomp_name": None,
            "match_count": 0,
            "total_count": func["instruction_count"],
            "status": "NOT_FOUND",
        }

        if orig_func and recomp_name and recomp_va and pe_data:
            next_va = get_next_func_va(recomp_name, map_publics)
            recomp_instrs = disassemble_function(pe_data, pe, recomp_va, next_va, image_base)
            recomp_instrs = normalize_recompiled(recomp_instrs, map_publics, recomp_va)
            diff = diff_instructions(orig_func["instructions"], recomp_instrs)

            mc = sum(1 for s, _, _ in diff if s == "match")
            tc = len(diff)
            pct = (mc / tc * 100) if tc else 0

            entry["recomp_name"] = recomp_name
            entry["match_count"] = mc
            entry["total_count"] = tc

            if pct == 100:
                entry["status"] = "MATCH"
            elif pct >= 80:
                entry["status"] = "CLOSE"
            elif mc > 0:
                entry["status"] = "PARTIAL"
            else:
                entry["status"] = "DIFFER"

        results.append(entry)

    return results


def print_report(results, write_file=False):
    """Print and optionally save the progress report."""
    total_match = sum(r["match_count"] for r in results)
    total_instr = sum(r["total_count"] for r in results)
    overall_pct = (total_match / total_instr * 100) if total_instr else 0

    matched = sum(1 for r in results if r["status"] == "MATCH")
    close = sum(1 for r in results if r["status"] == "CLOSE")
    partial = sum(1 for r in results if r["status"] == "PARTIAL")
    differ = sum(1 for r in results if r["status"] == "DIFFER")
    not_found = sum(1 for r in results if r["status"] == "NOT_FOUND")

    lines = []
    lines.append("=" * 90)
    lines.append(f" LEGIE DECOMPILATION PROGRESS")
    lines.append(f" Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("=" * 90)
    lines.append("")
    lines.append(f" Functions: {len(results)} total")
    lines.append(f"   MATCH:     {matched:4d}  (100% instruction match)")
    lines.append(f"   CLOSE:     {close:4d}  (>=80% match)")
    lines.append(f"   PARTIAL:   {partial:4d}  (some matches)")
    lines.append(f"   DIFFER:    {differ:4d}  (0% match, in recompiled)")
    lines.append(f"   NOT_FOUND: {not_found:4d}  (not in recompiled binary)")
    lines.append("")
    lines.append(f" Instructions: {total_match}/{total_instr} ({overall_pct:.1f}%)")
    lines.append("")
    lines.append(f" {'STATUS':<10s} {'FUNCTION':<40s} {'RECOMP NAME':<30s} {'MATCH':>10s}  {'PCT':>6s}")
    lines.append(f" {'-'*8}   {'-'*40} {'-'*30} {'-'*10}  {'-'*6}")

    for r in sorted(results, key=lambda x: (-x["match_count"] / max(x["total_count"], 1), x["name"])):
        pct = (r["match_count"] / r["total_count"] * 100) if r["total_count"] else 0
        rn = r["recomp_name"] or ""
        lines.append(
            f" [{r['status']:<8s}] {r['name']:<40s} {rn:<30s} "
            f"{r['match_count']:>4d}/{r['total_count']:<5d}  {pct:5.1f}%"
        )

    lines.append("")
    lines.append(f" Overall: {overall_pct:.1f}% instruction match")
    lines.append("")

    report = "\n".join(lines)
    print(report)

    if write_file:
        output_path = BASE / "analysis" / "progress_report.txt"
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(report, encoding="utf-8")
        print(f"\nReport written to {output_path}")

    json_path = BASE / "analysis" / "progress.json"
    with open(json_path, "w") as f:
        json.dump({
            "timestamp": datetime.now().isoformat(),
            "summary": {
                "total_functions": len(results),
                "matched": matched,
                "close": close,
                "partial": partial,
                "differ": differ,
                "not_found": not_found,
                "total_instructions": total_instr,
                "matched_instructions": total_match,
                "percentage": round(overall_pct, 2),
            },
            "functions": results,
        }, f, indent=2)


def main():
    parser = argparse.ArgumentParser(description="Legie decompilation progress")
    parser.add_argument("--report", action="store_true", help="Write report to file")
    parser.add_argument("--unit", default="Unit1", help="Unit to report on")
    parser.add_argument("--all-units", action="store_true", help="Report on all units")
    args = parser.parse_args()

    print("Analyzing decompilation progress...")
    results = run_progress(unit_filter=args.unit, all_units=args.all_units)
    print_report(results, write_file=args.report)


if __name__ == "__main__":
    main()
