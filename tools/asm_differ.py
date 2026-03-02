"""
Assembly differ for the Legie decompilation project.

Compares original function assembly (from IDR) against recompiled function
assembly (from dcc32 output), with normalization to handle address differences.

Usage:
    python asm_differ.py FormCreate              # diff by function name
    python asm_differ.py 00590DE8                # diff by original address
    python asm_differ.py --list                  # list all matchable functions
    python asm_differ.py --all                   # diff all & show summary
"""

import re
import sys
import json
import argparse
from pathlib import Path
from collections import OrderedDict

try:
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_32
except ImportError:
    print("ERROR: Install dependencies: pip install capstone pefile")
    sys.exit(1)

BASE = Path(__file__).resolve().parent.parent
ORIGINAL_ASM = BASE / "analysis" / "original_asm.json"
MAP_FILE = BASE / "bin" / "Legie.map"
RECOMP_EXE = BASE / "bin" / "Legie.exe"
SRC_UNIT1 = BASE / "src" / "Unit1.pas"

ANSI_RED = "\033[91m"
ANSI_GREEN = "\033[92m"
ANSI_YELLOW = "\033[93m"
ANSI_CYAN = "\033[96m"
ANSI_DIM = "\033[2m"
ANSI_RESET = "\033[0m"
ANSI_BOLD = "\033[1m"


# ---------------------------------------------------------------------------
# MAP file parser
# ---------------------------------------------------------------------------

def parse_map_file(map_path, pe=None):
    """Parse a Delphi detailed MAP file.

    Returns:
        publics: dict of {name: virtual_address} for all public symbols
        image_base: the PE image base
    """
    publics = OrderedDict()
    image_base = 0x00400000

    in_publics = False
    in_segments = False

    code_rva = 0x1000
    data_rva = None
    if pe:
        image_base = pe.OPTIONAL_HEADER.ImageBase
        for section in pe.sections:
            name = section.Name.rstrip(b"\x00").decode("ascii", errors="replace")
            if name == ".text" or "CODE" in name.upper():
                code_rva = section.VirtualAddress
            if name == ".data" or name == ".bss" or "DATA" in name.upper():
                if data_rva is None:
                    data_rva = section.VirtualAddress

    with open(map_path, "r") as f:
        for line in f:
            line = line.rstrip()

            if "Publics by Value" in line:
                in_publics = True
                in_segments = False
                continue

            if line.strip().startswith("Line numbers for"):
                in_publics = False
                continue

            if "Detailed map of segments" in line:
                in_segments = True
                continue

            if in_publics and line.strip():
                m = re.match(r"\s*(\w{4}):(\w{8})\s+(\S+)", line)
                if m:
                    seg = int(m.group(1), 16)
                    offset = int(m.group(2), 16)
                    name = m.group(3)
                    if seg == 1:
                        va = image_base + code_rva + offset
                    elif seg == 2 and data_rva is not None:
                        va = image_base + data_rva + offset
                    elif seg == 2:
                        va = image_base + offset
                    else:
                        va = offset
                    publics[name] = va

    return publics, image_base


def find_code_section_rva(pe):
    """Find the .text section's virtual address and raw data offset."""
    for section in pe.sections:
        name = section.Name.rstrip(b"\x00").decode("ascii", errors="replace")
        if name == ".text" or "CODE" in name.upper():
            return section.VirtualAddress, section.PointerToRawData, section.SizeOfRawData
    first = pe.sections[0]
    return first.VirtualAddress, first.PointerToRawData, first.SizeOfRawData


# ---------------------------------------------------------------------------
# Disassembly of recompiled binary
# ---------------------------------------------------------------------------

def disassemble_function(pe_data, pe, func_va, func_end_va, image_base):
    """Disassemble a function from the recompiled PE."""
    text_rva, text_raw, text_size = find_code_section_rva(pe)
    text_va = image_base + text_rva

    func_offset_in_section = func_va - text_va
    if func_offset_in_section < 0 or func_offset_in_section >= text_size:
        return []

    end_offset = func_end_va - text_va if func_end_va else func_offset_in_section + 0x10000
    end_offset = min(end_offset, text_size)

    raw_start = text_raw + func_offset_in_section
    raw_end = text_raw + end_offset
    code_bytes = pe_data[raw_start:raw_end]

    md = Cs(CS_ARCH_X86, CS_MODE_32)
    md.detail = False

    instructions = []
    for insn in md.disasm(code_bytes, func_va):
        instructions.append({
            "addr": f"{insn.address:08X}",
            "mnemonic": insn.mnemonic,
            "operands": insn.op_str,
        })
        if insn.mnemonic == "ret" or insn.mnemonic == "int3":
            break

    return instructions


def normalize_recompiled(instructions, publics_by_va, func_va, image_base=0x400000):
    """Normalize recompiled instructions for comparison.

    Replace absolute addresses with symbolic names where possible.
    """
    va_to_name = {}
    for name, va in publics_by_va.items():
        va_to_name[va] = name

    all_data_vas = {}
    for name, va in publics_by_va.items():
        if va < image_base + 0x1000 or va >= image_base + 0x200000:
            all_data_vas[va] = name

    func_addrs = {int(ins["addr"], 16) for ins in instructions}

    label_map = {}
    label_idx = 0
    for ins in instructions:
        ops = ins["operands"]
        m = re.search(r"0x([0-9a-fA-F]+)", ops)
        if m and ins["mnemonic"].startswith("j"):
            target = int(m.group(1), 16)
            if target in func_addrs and target not in label_map:
                label_map[target] = f".L{label_idx}"
                label_idx += 1

    for ins in instructions:
        addr_int = int(ins["addr"], 16)
        if addr_int in label_map:
            ins["label"] = label_map[addr_int]

        ops = ins["operands"]

        if ins["mnemonic"].startswith("j"):
            m = re.search(r"0x([0-9a-fA-F]+)", ops)
            if m:
                target = int(m.group(1), 16)
                if target in label_map:
                    ins["operands_norm"] = label_map[target]
                elif target in va_to_name:
                    ins["operands_norm"] = f"<FN:{va_to_name[target]}>"
                else:
                    ins["operands_norm"] = f"<ADDR:{target:08X}>"
            continue

        if ins["mnemonic"] == "call":
            m = re.search(r"0x([0-9a-fA-F]+)", ops)
            if m:
                target = int(m.group(1), 16)
                if target in va_to_name:
                    ins["operands_norm"] = f"<FN:{va_to_name[target]}>"
                else:
                    ins["operands_norm"] = f"<FN:sub_{target:08X}>"
            continue

        norm = ops
        for m in re.finditer(r"0x([0-9a-fA-F]{5,8})", ops):
            val = int(m.group(1), 16)
            if val in va_to_name:
                norm = norm.replace(m.group(0), f"<GVAR:{va_to_name[val]}>")
        ins["operands_norm"] = norm

    return instructions


# ---------------------------------------------------------------------------
# Original assembly loading
# ---------------------------------------------------------------------------

def load_original_asm(path=None):
    """Load the original_asm.json."""
    path = path or ORIGINAL_ASM
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)


def find_original_function(orig_data, query):
    """Find a function in original_asm.json by name or address."""
    query_upper = query.upper()

    for func in orig_data:
        if func["address"].upper() == query_upper:
            return func

    for func in orig_data:
        if func["name"].upper() == query_upper:
            return func

    for func in orig_data:
        if query_upper in func["name"].upper():
            return func

    return None


# ---------------------------------------------------------------------------
# Source file scanning for address annotations
# ---------------------------------------------------------------------------

def scan_source_annotations(src_path=None):
    """Scan src/Unit1.pas for function-to-original-address mappings.

    Looks for patterns like:
        { 00590DE8 }
        { @orig 00590DE8 }
        procedure Foo; { 00XXXXXX }
    before/after function declarations.
    """
    src_path = src_path or SRC_UNIT1
    if not src_path.exists():
        return {}

    mappings = {}
    re_addr_comment = re.compile(r"\{\s*(?:@orig\s+)?([0-9A-Fa-f]{8})\s*\}")
    re_func_decl = re.compile(
        r"^(procedure|function)\s+(?:(\w+)\.)?(\w+)"
    )

    with open(src_path, "r", encoding="utf-8", errors="replace") as f:
        lines = f.readlines()

    for i, line in enumerate(lines):
        addr_m = re_addr_comment.search(line)
        if not addr_m:
            continue
        addr = addr_m.group(1).upper()

        func_m = re_func_decl.match(line)
        if func_m:
            cls_name = func_m.group(2) or ""
            func_name = func_m.group(3)
            fqn = f"{cls_name}.{func_name}" if cls_name else func_name
            mappings[addr] = fqn
            continue

        for delta in range(-3, 4):
            j = i + delta
            if 0 <= j < len(lines) and j != i:
                func_m2 = re_func_decl.match(lines[j])
                if func_m2:
                    cls_name = func_m2.group(2) or ""
                    func_name = func_m2.group(3)
                    fqn = f"{cls_name}.{func_name}" if cls_name else func_name
                    mappings[addr] = fqn
                    break

    return mappings


# ---------------------------------------------------------------------------
# Diffing logic
# ---------------------------------------------------------------------------

def normalize_operand_text(ops):
    """Normalize operand text for comparison: collapse whitespace, lowercase,
    strip 0x prefixes, normalize hex formatting, remove segment prefixes."""
    s = ops.lower().strip()
    s = re.sub(r"\s+", " ", s)
    s = s.replace(", ", ",")
    s = s.replace("0x", "")
    s = re.sub(r"\bds:", "", s)
    s = re.sub(r"\b0+([0-9a-f]+)\b", lambda m: m.group(1), s)
    return s


def diff_instructions(orig_instrs, recomp_instrs, fn_name_map=None):
    """Compare two instruction lists. Returns list of (status, orig, recomp) tuples.

    status: 'match', 'mnemonic_diff', 'operand_diff', 'orig_only', 'recomp_only'
    fn_name_map: dict mapping original function names to recompiled names (for annotation matching)
    """
    if fn_name_map is None:
        fn_name_map = {}

    fn_name_map_lower = {k.lower(): v.lower() for k, v in fn_name_map.items()}

    def unify_operands(o_ops, r_ops):
        """Try to match operands accounting for function name mappings and data addresses."""
        if o_ops == r_ops:
            return True

        o_fn = re.search(r"<fn:(\S+?)>", o_ops)
        r_fn = re.search(r"<fn:(\S+?)>", r_ops)
        if o_fn and r_fn:
            orig_name = o_fn.group(1).lower()
            recomp_name = r_fn.group(1).lower()
            if fn_name_map_lower.get(orig_name, "") == recomp_name:
                return True
            if orig_name == recomp_name:
                return True

        o_stripped = re.sub(r"<gvar:\w+>", "<GVAR>", o_ops)
        r_stripped = re.sub(r"<gvar:\w+>", "<GVAR>", r_ops)
        if o_stripped == r_stripped and "<GVAR>" in o_stripped:
            return True

        o_data = re.sub(r"\b[0-9a-f]{5,8}\b", "<IMM>", o_ops)
        r_data = re.sub(r"\b[0-9a-f]{5,8}\b", "<IMM>", r_ops)
        if o_data == r_data and "<IMM>" in o_data:
            return True

        return False

    results = []
    oi, ri = 0, 0
    while oi < len(orig_instrs) or ri < len(recomp_instrs):
        if oi >= len(orig_instrs):
            results.append(("recomp_only", None, recomp_instrs[ri]))
            ri += 1
            continue
        if ri >= len(recomp_instrs):
            results.append(("orig_only", orig_instrs[oi], None))
            oi += 1
            continue

        o = orig_instrs[oi]
        r = recomp_instrs[ri]

        o_mn = o["mnemonic"].lower()
        r_mn = r["mnemonic"].lower()
        o_ops = normalize_operand_text(o.get("operands_norm", o["operands"]))
        r_ops = normalize_operand_text(r.get("operands_norm", r["operands"]))

        if o_mn == r_mn and unify_operands(o_ops, r_ops):
            results.append(("match", o, r))
            oi += 1
            ri += 1
        elif o_mn == r_mn:
            results.append(("operand_diff", o, r))
            oi += 1
            ri += 1
        else:
            results.append(("mnemonic_diff", o, r))
            oi += 1
            ri += 1

    return results


def format_instruction(ins, width=55):
    """Format one instruction for display."""
    if ins is None:
        return " " * width

    lbl = ins.get("label", "")
    lbl_str = f"{lbl:5s} " if lbl else "      "
    mn = ins["mnemonic"]
    ops = ins.get("operands_norm", ins["operands"])
    line = f"{ins['addr']} {lbl_str}{mn:8s} {ops}"
    if len(line) > width:
        line = line[:width - 3] + "..."
    return f"{line:<{width}}"


def print_diff(results, func_name, orig_addr, show_all=True):
    """Print a colored side-by-side diff."""
    match_count = sum(1 for s, _, _ in results if s == "match")
    total = len(results)
    pct = (match_count / total * 100) if total else 0

    print(f"{ANSI_BOLD}{'=' * 120}")
    print(f" {func_name}  (original @ 0x{orig_addr})")
    print(f" {match_count}/{total} instructions match ({pct:.1f}%)")
    print(f"{'=' * 120}{ANSI_RESET}")
    print(f" {'ORIGINAL':<57s} {'RECOMPILED':<57s} STATUS")
    print(f" {'-' * 55}  {'-' * 55}  ------")

    for status, o, r in results:
        o_str = format_instruction(o)
        r_str = format_instruction(r)

        if status == "match":
            if not show_all:
                continue
            color = ANSI_GREEN
            tag = "OK"
        elif status == "operand_diff":
            color = ANSI_YELLOW
            tag = "OPS"
        elif status == "mnemonic_diff":
            color = ANSI_RED
            tag = "DIFF"
        elif status == "orig_only":
            color = ANSI_RED
            tag = "ORIG+"
        elif status == "recomp_only":
            color = ANSI_CYAN
            tag = "REC+"
        else:
            color = ""
            tag = "?"

        print(f" {color}{o_str}  {r_str}  {tag}{ANSI_RESET}")

    print()
    return match_count, total


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def resolve_function_query(query, orig_data, map_publics, src_annotations):
    """Resolve a user query to (original_func, recomp_name, recomp_va).

    The query can be:
    - An original address (hex): look up in orig_data, find corresponding recomp name
    - A current function name: look up in map publics, find original by annotation
    - An IDR function name: look up in orig_data directly
    """
    orig_func = find_original_function(orig_data, query)

    if orig_func:
        orig_addr = orig_func["address"]
        recomp_name = src_annotations.get(orig_addr)

        if recomp_name and recomp_name in map_publics:
            return orig_func, recomp_name, map_publics[recomp_name]

        for mn, va in map_publics.items():
            if mn.split(".")[-1].upper() == orig_func["name"].split(".")[-1].upper():
                return orig_func, mn, va
            if mn.upper() == orig_func["name"].upper():
                return orig_func, mn, va

    for mn, va in map_publics.items():
        short = mn.split(".")[-1]
        if short.upper() == query.upper() or mn.upper() == query.upper():
            for addr, src_name in src_annotations.items():
                if src_name == mn or src_name.split(".")[-1] == short:
                    of = find_original_function(orig_data, addr)
                    if of:
                        return of, mn, va
            for of in orig_data:
                if of["name"].split(".")[-1].upper() == short.upper():
                    return of, mn, va
            return None, mn, va

    return orig_func, None, None


def get_next_func_va(name, publics):
    """Get the VA of the next function after the given one (for end boundary)."""
    names = list(publics.keys())
    try:
        idx = names.index(name)
    except ValueError:
        return None
    if idx + 1 < len(names):
        return publics[names[idx + 1]]
    return None


def main():
    parser = argparse.ArgumentParser(description="Legie ASM Differ")
    parser.add_argument("function", nargs="?", help="Function name or original address")
    parser.add_argument("--list", action="store_true", help="List all matchable functions")
    parser.add_argument("--all", action="store_true", help="Diff all functions, show summary")
    parser.add_argument("--mismatches", action="store_true", help="Only show mismatched lines")
    parser.add_argument("--orig-asm", default=str(ORIGINAL_ASM))
    parser.add_argument("--map", default=str(MAP_FILE))
    parser.add_argument("--exe", default=str(RECOMP_EXE))
    args = parser.parse_args()

    if not Path(args.orig_asm).exists():
        print(f"ERROR: {args.orig_asm} not found. Run extract_asm.py first.")
        sys.exit(1)

    print("Loading original assembly...")
    orig_data = load_original_asm(Path(args.orig_asm))
    orig_unit1 = [f for f in orig_data if f["unit"] == "Unit1"]
    print(f"  {len(orig_data)} total functions, {len(orig_unit1)} in Unit1")

    pe_data = None
    pe = None
    image_base = 0x400000
    if Path(args.exe).exists():
        print("Loading recompiled executable...")
        pe_data = Path(args.exe).read_bytes()
        pe = pefile.PE(data=pe_data)
        image_base = pe.OPTIONAL_HEADER.ImageBase
        print(f"  Image base: 0x{image_base:08X}")
    elif not args.list:
        print(f"WARNING: Recompiled exe not found at {args.exe}")

    map_publics = {}
    if Path(args.map).exists():
        print("Parsing MAP file...")
        map_publics, image_base = parse_map_file(Path(args.map), pe)
        print(f"  {len(map_publics)} public symbols")
    else:
        print(f"WARNING: MAP file not found at {args.map}")
        if not args.list:
            sys.exit(1)

    src_annotations = scan_source_annotations()
    print(f"  {len(src_annotations)} source annotations found")

    fn_name_map = {}
    for orig_addr, recomp_name in src_annotations.items():
        for func in orig_data:
            if func["address"].upper() == orig_addr.upper():
                fn_name_map[func["name"]] = recomp_name
                break

    if args.list:
        print(f"\n{'ORIG ADDR':>10s}  {'ORIG NAME':<35s}  {'RECOMP NAME':<35s}  INSTRS")
        print(f" {'-' * 9}  {'-' * 35}  {'-' * 35}  ------")
        for func in orig_unit1:
            recomp_name = src_annotations.get(func["address"], "")
            if not recomp_name:
                for mn in map_publics:
                    if mn.split(".")[-1].upper() == func["name"].split(".")[-1].upper():
                        recomp_name = mn
                        break
            in_map = "*" if recomp_name and recomp_name in map_publics else " "
            print(f" {func['address']:>9s}  {func['name']:<35s}  {in_map}{recomp_name:<34s}  {func['instruction_count']}")
        return

    if args.all:
        total_match = 0
        total_instr = 0
        results_summary = []

        for func in orig_unit1:
            orig_func, recomp_name, recomp_va = resolve_function_query(
                func["address"], orig_data, map_publics, src_annotations
            )
            if not orig_func or not recomp_name or not recomp_va or not pe_data:
                results_summary.append((func["name"], func["address"],
                                        0, func["instruction_count"], "NOT_FOUND"))
                total_instr += func["instruction_count"]
                continue

            next_va = get_next_func_va(recomp_name, map_publics)
            recomp_instrs = disassemble_function(pe_data, pe, recomp_va, next_va, image_base)
            recomp_instrs = normalize_recompiled(recomp_instrs, map_publics, recomp_va, image_base)

            diff = diff_instructions(orig_func["instructions"], recomp_instrs, fn_name_map)
            mc = sum(1 for s, _, _ in diff if s == "match")
            tc = len(diff)
            total_match += mc
            total_instr += tc

            pct = (mc / tc * 100) if tc else 0
            if pct == 100:
                tag = "MATCH"
            elif pct >= 80:
                tag = "CLOSE"
            elif mc > 0:
                tag = "PARTIAL"
            else:
                tag = "DIFFER"
            results_summary.append((func["name"], func["address"], mc, tc, tag))

        print(f"\n{ANSI_BOLD}{'=' * 90}")
        print(f" LEGIE DECOMPILATION PROGRESS - Unit1")
        print(f"{'=' * 90}{ANSI_RESET}")
        print(f" {'STATUS':<10s} {'FUNCTION':<40s} {'MATCH':>12s}  {'PCT':>6s}")
        print(f" {'-' * 8}   {'-' * 40}  {'-' * 10}  {'-' * 6}")

        for name, addr, mc, tc, tag in sorted(results_summary, key=lambda x: -x[2] / max(x[3], 1)):
            pct = (mc / tc * 100) if tc else 0
            if tag == "MATCH":
                color = ANSI_GREEN
            elif tag == "CLOSE":
                color = ANSI_YELLOW
            elif tag == "NOT_FOUND":
                color = ANSI_DIM
            else:
                color = ANSI_RED
            print(f" {color}[{tag:<8s}] {name:<40s}  {mc:>4d}/{tc:<5d}  {pct:5.1f}%{ANSI_RESET}")

        overall_pct = (total_match / total_instr * 100) if total_instr else 0
        matched = sum(1 for _, _, _, _, t in results_summary if t == "MATCH")
        close = sum(1 for _, _, _, _, t in results_summary if t == "CLOSE")
        nf = sum(1 for _, _, _, _, t in results_summary if t == "NOT_FOUND")
        print(f"\n Overall: {total_match}/{total_instr} instructions ({overall_pct:.1f}%)")
        print(f" {matched} matched, {close} close, {len(results_summary) - matched - close - nf} differ, {nf} not found")
        return

    if not args.function:
        parser.print_help()
        sys.exit(1)

    orig_func, recomp_name, recomp_va = resolve_function_query(
        args.function, orig_data, map_publics, src_annotations
    )

    if not orig_func:
        print(f"ERROR: Function '{args.function}' not found in original assembly data")
        sys.exit(1)

    print(f"\nOriginal: {orig_func['name']} @ 0x{orig_func['address']} "
          f"({orig_func['instruction_count']} instructions)")

    if not recomp_name:
        print(f"WARNING: No matching function found in recompiled binary")
        print("Showing original assembly only:\n")
        for ins in orig_func["instructions"]:
            lbl = ins.get("label", "")
            lbl_str = f"{lbl:5s} " if lbl else "      "
            ops = ins.get("operands_norm", ins["operands"])
            cmt = f"  ; {ins['comment']}" if ins.get("comment") else ""
            print(f"  {ins['addr']} {lbl_str}{ins['mnemonic']:8s} {ops}{cmt}")
        sys.exit(0)

    print(f"Recompiled: {recomp_name} @ 0x{recomp_va:08X}")

    next_va = get_next_func_va(recomp_name, map_publics)
    recomp_instrs = disassemble_function(pe_data, pe, recomp_va, next_va, image_base)
    print(f"  Disassembled {len(recomp_instrs)} instructions from recompiled binary")

    recomp_instrs = normalize_recompiled(recomp_instrs, map_publics, recomp_va, image_base)

    diff = diff_instructions(orig_func["instructions"], recomp_instrs, fn_name_map)
    print_diff(diff, orig_func["name"], orig_func["address"],
               show_all=not args.mismatches)


if __name__ == "__main__":
    main()
