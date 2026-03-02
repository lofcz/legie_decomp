"""
Function annotation checker for the Legie decompilation project.

Compares the list of original functions (from IDR) with the functions
currently in src/Unit1.pas, reporting:
  - Functions with address annotations (ready for diffing)
  - Functions missing annotations
  - Original functions not yet present in source
  - Stub functions vs real implementations

Usage:
    python annotate_funcs.py                # show report
    python annotate_funcs.py --stubs        # list all stub functions
    python annotate_funcs.py --missing      # list functions missing from source
    python annotate_funcs.py --gen-map      # generate analysis/func_map.json
"""

import re
import json
import argparse
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
SRC_UNIT1 = BASE / "src" / "Unit1.pas"
ORIGINAL_ASM = BASE / "analysis" / "original_asm.json"
FUNC_MAP_OUT = BASE / "analysis" / "func_map.json"

RE_FUNC_DECL = re.compile(
    r"^(procedure|function)\s+(?:(\w+)\.)?(\w+)"
)
RE_ADDR_COMMENT = re.compile(r"\{\s*(?:@orig\s+)?([0-9A-Fa-f]{8})\s*\}")
RE_FORWARD = re.compile(r"\bforward\b", re.IGNORECASE)


def scan_source_functions(src_path):
    """Scan Unit1.pas for function declarations and their annotations."""
    functions = []
    with open(src_path, "r", encoding="utf-8", errors="replace") as f:
        lines = f.readlines()

    in_implementation = False
    i = 0
    while i < len(lines):
        line = lines[i].rstrip()
        i += 1

        if line.strip().lower() == "implementation":
            in_implementation = True
            continue

        if not in_implementation:
            continue

        func_m = RE_FUNC_DECL.match(line)
        if not func_m:
            continue

        if RE_FORWARD.search(line):
            continue

        kind = func_m.group(1)
        cls_name = func_m.group(2) or ""
        func_name = func_m.group(3)
        fqn = f"{cls_name}.{func_name}" if cls_name else func_name

        orig_addr = None
        addr_m = RE_ADDR_COMMENT.search(line)
        if addr_m:
            orig_addr = addr_m.group(1).upper()
        else:
            for delta in range(-2, 3):
                j = (i - 1) + delta
                if 0 <= j < len(lines) and j != (i - 1):
                    addr_m2 = RE_ADDR_COMMENT.search(lines[j])
                    if addr_m2:
                        orig_addr = addr_m2.group(1).upper()
                        break

        body_lines = 0
        is_stub = True
        j = i
        depth = 0
        while j < len(lines):
            sline = lines[j].strip()
            j += 1
            if sline.lower() == "begin":
                depth += 1
            if depth > 0:
                body_lines += 1
                if sline and not sline.lower().startswith(("begin", "end", "end;", "//")):
                    is_stub = False
            if sline.lower().startswith("end;") and depth <= 1:
                break
            if sline.lower() == "end;" or sline.lower() == "end":
                depth -= 1
                if depth <= 0:
                    break

        functions.append({
            "name": fqn,
            "kind": kind,
            "line": i,
            "orig_addr": orig_addr,
            "body_lines": body_lines,
            "is_stub": is_stub and body_lines <= 3,
        })

    return functions


def load_original_functions(path=None):
    """Load original function list from extract output."""
    path = path or ORIGINAL_ASM
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
    return [f for f in data if f["unit"] == "Unit1"]


def generate_report(src_funcs, orig_funcs):
    """Generate annotation status report."""
    orig_by_addr = {f["address"]: f for f in orig_funcs}
    src_by_addr = {}
    for sf in src_funcs:
        if sf["orig_addr"]:
            src_by_addr[sf["orig_addr"]] = sf

    annotated = [f for f in src_funcs if f["orig_addr"]]
    unannotated = [f for f in src_funcs if not f["orig_addr"]]
    stubs = [f for f in src_funcs if f["is_stub"]]
    real = [f for f in src_funcs if not f["is_stub"]]

    missing_from_src = []
    for addr, of in orig_by_addr.items():
        if addr not in src_by_addr:
            missing_from_src.append(of)

    print(f"{'=' * 80}")
    print(f" FUNCTION ANNOTATION REPORT")
    print(f"{'=' * 80}")
    print(f"\n Source: {SRC_UNIT1}")
    print(f" Original: {len(orig_funcs)} functions in Unit1")
    print(f" Source:   {len(src_funcs)} function implementations")
    print(f"   Annotated:   {len(annotated)}")
    print(f"   Unannotated: {len(unannotated)}")
    print(f"   Stubs:       {len(stubs)}")
    print(f"   Real impls:  {len(real)}")
    print(f"   Missing:     {len(missing_from_src)} (in original, not in source)")

    if unannotated:
        print(f"\n UNANNOTATED FUNCTIONS (need {{ XXXXXXXX }} comment):")
        print(f" {'-' * 60}")
        for f in unannotated:
            stub_tag = " [STUB]" if f["is_stub"] else ""
            print(f"   Line {f['line']:>5d}: {f['name']}{stub_tag}")

    if missing_from_src:
        print(f"\n MISSING FROM SOURCE ({len(missing_from_src)} functions):")
        print(f" {'-' * 60}")
        for f in sorted(missing_from_src, key=lambda x: x["instruction_count"], reverse=True)[:30]:
            print(f"   {f['address']}  {f['name']:<35s}  {f['instruction_count']:>5d} instrs")
        if len(missing_from_src) > 30:
            print(f"   ... and {len(missing_from_src) - 30} more")

    return {
        "annotated": annotated,
        "unannotated": unannotated,
        "stubs": stubs,
        "real": real,
        "missing_from_src": missing_from_src,
    }


def generate_func_map(src_funcs, orig_funcs):
    """Generate a mapping file: original_addr -> {current_name, orig_name}."""
    orig_by_addr = {f["address"]: f["name"] for f in orig_funcs}

    mapping = {}
    for sf in src_funcs:
        if sf["orig_addr"]:
            mapping[sf["orig_addr"]] = {
                "current_name": sf["name"],
                "orig_name": orig_by_addr.get(sf["orig_addr"], "unknown"),
                "is_stub": sf["is_stub"],
                "line": sf["line"],
            }

    FUNC_MAP_OUT.parent.mkdir(parents=True, exist_ok=True)
    with open(FUNC_MAP_OUT, "w") as f:
        json.dump(mapping, f, indent=2)
    print(f"\nWrote {FUNC_MAP_OUT} ({len(mapping)} entries)")
    return mapping


def main():
    parser = argparse.ArgumentParser(description="Function annotation checker")
    parser.add_argument("--stubs", action="store_true", help="List stub functions")
    parser.add_argument("--missing", action="store_true", help="List missing functions")
    parser.add_argument("--gen-map", action="store_true", help="Generate func_map.json")
    args = parser.parse_args()

    if not SRC_UNIT1.exists():
        print(f"ERROR: {SRC_UNIT1} not found")
        return
    if not ORIGINAL_ASM.exists():
        print(f"ERROR: {ORIGINAL_ASM} not found. Run extract_asm.py first.")
        return

    src_funcs = scan_source_functions(SRC_UNIT1)
    orig_funcs = load_original_functions()

    report = generate_report(src_funcs, orig_funcs)

    if args.stubs:
        print(f"\n ALL STUB FUNCTIONS:")
        for f in report["stubs"]:
            addr = f["orig_addr"] or "????????"
            print(f"   {addr}  {f['name']}")

    if args.missing:
        print(f"\n ALL MISSING FUNCTIONS:")
        for f in report["missing_from_src"]:
            print(f"   {f['address']}  {f['name']:<35s}  {f['instruction_count']:>5d} instrs")

    if args.gen_map:
        generate_func_map(src_funcs, orig_funcs)


if __name__ == "__main__":
    main()
