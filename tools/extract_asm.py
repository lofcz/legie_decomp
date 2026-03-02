"""
Extract per-function assembly from IDR-decompiled Delphi 7 .pas files.

Produces analysis/original_asm.json with normalized instruction streams
for every function, suitable for diffing against a recompiled binary.

Usage:
    python extract_asm.py [--idr-dir ../raw_idr] [--output ../analysis/original_asm.json]
"""

import re
import sys
import json
from pathlib import Path
from collections import OrderedDict

BASE = Path(__file__).resolve().parent.parent
DEFAULT_IDR_DIR = BASE / "raw_idr"
DEFAULT_OUTPUT = BASE / "analysis" / "original_asm.json"

RE_FUNC_HEADER_COMMENT = re.compile(r"^//([0-9A-Fa-f]{8})")
RE_FUNC_START = re.compile(
    r"^(?:procedure|function|constructor|destructor)\s+"
    r"(?:(\w+)\.)?(\w+)"
)
RE_ASM_LINE = re.compile(r"^\s*>?([0-9A-Fa-f]{8})\s+(.*)")
RE_BLOCK_START = re.compile(r"^\{\*")
RE_BLOCK_END = re.compile(r"^\*\}")

RE_CALL_NAMED = re.compile(r"\bcall\s+([\w.]+(?:\.\w+)*)")
RE_CALL_ADDR = re.compile(r"\bcall\s+([0-9A-Fa-f]{6,8})\b")
RE_GVAR_COMMENT = re.compile(r";gvar_([0-9A-Fa-f]{8})")
RE_STRING_COMMENT = re.compile(r";'([^']*)'")
RE_JMP_ADDR = re.compile(r"\b(j[a-z]+)\s+([0-9A-Fa-f]{6,8})\b")
RE_MEM_ABS = re.compile(r"\[(?:ds:)?\[?([0-9A-Fa-f]{6,8})\]?\]")


def parse_instruction(addr_str, raw_text, comment_text):
    """Parse a single IDR assembly line into mnemonic + operands."""
    text = raw_text.strip()
    if not text:
        return None

    parts = text.split(None, 1)
    mnemonic = parts[0].lower()
    operands = parts[1] if len(parts) > 1 else ""

    operands = operands.split(";")[0].strip()

    return {
        "addr": addr_str.upper(),
        "mnemonic": mnemonic,
        "operands": operands,
        "raw": raw_text.strip(),
        "comment": comment_text.strip() if comment_text else "",
    }


def extract_functions_from_file(filepath):
    """Parse one IDR .pas file. Return list of function dicts with instructions."""
    functions = []
    current_func = None
    in_asm_block = False
    unit_name = Path(filepath).stem

    with open(filepath, "r", encoding="utf-8", errors="replace") as f:
        lines = f.readlines()

    pending_addr = None

    i = 0
    while i < len(lines):
        line = lines[i].rstrip()
        i += 1

        addr_m = RE_FUNC_HEADER_COMMENT.match(line)
        if addr_m:
            pending_addr = addr_m.group(1).upper()
            continue

        if RE_BLOCK_START.match(line) or line.startswith("{*"):
            in_asm_block = True
            decl_text = line[2:].strip() if line.startswith("{*") else ""
            fm = RE_FUNC_START.match(decl_text)
            if fm:
                cls_name = fm.group(1) or ""
                func_name = fm.group(2)
                fqn = f"{cls_name}.{func_name}" if cls_name else func_name
                func_addr = pending_addr or "00000000"
                current_func = {
                    "name": fqn,
                    "address": func_addr,
                    "unit": unit_name,
                    "signature": decl_text,
                    "instructions": [],
                }
                functions.append(current_func)
                pending_addr = None
            continue

        fm = RE_FUNC_START.match(line)
        if fm and not in_asm_block:
            cls_name = fm.group(1) or ""
            func_name = fm.group(2)
            fqn = f"{cls_name}.{func_name}" if cls_name else func_name
            func_addr = pending_addr or "00000000"
            current_func = {
                "name": fqn,
                "address": func_addr,
                "unit": unit_name,
                "signature": line.rstrip().rstrip(";"),
                "instructions": [],
            }
            functions.append(current_func)
            pending_addr = None
            continue

        if RE_BLOCK_END.match(line) or line.strip() == "*}" or line.strip().endswith("*}"):
            in_asm_block = False
            pending_addr = None
            continue

        if line.strip().startswith("end;"):
            if current_func and not in_asm_block:
                pending_addr = None
            continue

        if not in_asm_block:
            if line.strip() == "begin":
                pass
            pending_addr = None
            continue

        asm_m = RE_ASM_LINE.match(line)
        if not asm_m:
            continue

        addr_str = asm_m.group(1)
        rest = asm_m.group(2)

        comment = ""
        gvar_m = RE_GVAR_COMMENT.search(rest)
        str_m = RE_STRING_COMMENT.search(rest)
        if gvar_m:
            comment = f"gvar_{gvar_m.group(1).upper()}"
        if str_m:
            comment = (comment + " " if comment else "") + f"'{str_m.group(1)}'"

        instr = parse_instruction(addr_str, rest, comment)
        if instr and current_func:
            if not current_func["instructions"]:
                if current_func["address"] == "00000000":
                    current_func["address"] = addr_str.upper()
            current_func["instructions"].append(instr)

    return functions


def normalize_function(func, all_func_addrs):
    """Normalize a function's instructions for diffing.

    - Replace intra-function jump targets with local labels
    - Annotate call targets and gvar references from IDR comments
    """
    instrs = func["instructions"]
    if not instrs:
        return func

    func_start = int(func["address"], 16)

    intra_addrs = set()
    for ins in instrs:
        jmp_m = RE_JMP_ADDR.match(ins["raw"])
        if jmp_m:
            target = int(jmp_m.group(2), 16)
            intra_addrs.add(target)

    func_addrs_set = {int(ins["addr"], 16) for ins in instrs}
    local_targets = intra_addrs & func_addrs_set

    label_map = {}
    label_idx = 0
    for ins in instrs:
        a = int(ins["addr"], 16)
        if a in local_targets and a not in label_map:
            label_map[a] = f".L{label_idx}"
            label_idx += 1

    for ins in instrs:
        a = int(ins["addr"], 16)
        if a in label_map:
            ins["label"] = label_map[a]

        ops = ins["operands"]

        jmp_m = RE_JMP_ADDR.match(ins["raw"])
        if jmp_m:
            target = int(jmp_m.group(2), 16)
            if target in label_map:
                ins["operands_norm"] = label_map[target]
            elif target in all_func_addrs:
                ins["operands_norm"] = f"<FN:{all_func_addrs[target]}>"
            else:
                ins["operands_norm"] = f"<ADDR:{jmp_m.group(2).upper()}>"
            continue

        call_named_m = RE_CALL_NAMED.search(ins["raw"])
        call_addr_m = RE_CALL_ADDR.search(ins["raw"])
        if ins["mnemonic"] == "call":
            if call_named_m:
                target_name = call_named_m.group(1)
                if not target_name[0].isdigit():
                    ins["operands_norm"] = f"<FN:{target_name}>"
                    continue
            if call_addr_m:
                target = int(call_addr_m.group(1), 16)
                if target in all_func_addrs:
                    ins["operands_norm"] = f"<FN:{all_func_addrs[target]}>"
                else:
                    ins["operands_norm"] = f"<FN:sub_{call_addr_m.group(1).upper().zfill(8)}>"
                continue

        norm = ops
        if ins["comment"]:
            for gvar_m in RE_GVAR_COMMENT.finditer(";" + ins["comment"]):
                gvar_name = f"gvar_{gvar_m.group(1).upper()}"
                addr_full = gvar_m.group(1).upper()
                addr_short = addr_full.lstrip("0") or "0"
                replacement = f"<GVAR:{gvar_name}>"
                pattern = re.compile(
                    r"(?<!\w)(?:00)?" + re.escape(addr_short) + r"(?!\w)"
                )
                norm = pattern.sub(replacement, norm)

        ins["operands_norm"] = norm

    func["local_labels"] = {hex(a): lbl for a, lbl in label_map.items()}
    return func


def main():
    import argparse

    parser = argparse.ArgumentParser(description="Extract assembly from IDR output")
    parser.add_argument("--idr-dir", default=str(DEFAULT_IDR_DIR))
    parser.add_argument("--output", default=str(DEFAULT_OUTPUT))
    args = parser.parse_args()

    idr_dir = Path(args.idr_dir)
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    pas_files = sorted(idr_dir.glob("*.pas"))
    if not pas_files:
        print(f"No .pas files found in {idr_dir}")
        sys.exit(1)

    print(f"Parsing {len(pas_files)} .pas files from {idr_dir}...")

    all_functions = []
    for pf in pas_files:
        try:
            funcs = extract_functions_from_file(pf)
            if funcs:
                print(f"  {pf.name}: {len(funcs)} functions")
            all_functions.extend(funcs)
        except Exception as e:
            print(f"  WARNING: {pf.name}: {e}")

    all_functions = [f for f in all_functions if f["instructions"]]

    all_func_addrs = {}
    for func in all_functions:
        addr = int(func["address"], 16)
        if addr > 0:
            all_func_addrs[addr] = func["name"]

    print(f"\nNormalizing {len(all_functions)} functions...")
    for func in all_functions:
        normalize_function(func, all_func_addrs)

    total_instrs = sum(len(f["instructions"]) for f in all_functions)

    by_unit = {}
    for func in all_functions:
        u = func["unit"]
        if u not in by_unit:
            by_unit[u] = 0
        by_unit[u] += 1

    print(f"\nResults:")
    print(f"  Total functions: {len(all_functions)}")
    print(f"  Total instructions: {total_instrs}")
    print(f"  Units: {len(by_unit)}")
    for u in sorted(by_unit, key=by_unit.get, reverse=True)[:10]:
        print(f"    {u}: {by_unit[u]} functions")

    output_data = []
    for func in all_functions:
        slim_instrs = []
        for ins in func["instructions"]:
            entry = OrderedDict()
            entry["addr"] = ins["addr"]
            entry["mnemonic"] = ins["mnemonic"]
            entry["operands"] = ins["operands"]
            if "operands_norm" in ins:
                entry["operands_norm"] = ins["operands_norm"]
            if "label" in ins:
                entry["label"] = ins["label"]
            if ins.get("comment"):
                entry["comment"] = ins["comment"]
            slim_instrs.append(entry)

        output_data.append(OrderedDict([
            ("name", func["name"]),
            ("address", func["address"]),
            ("unit", func["unit"]),
            ("signature", func["signature"]),
            ("instruction_count", len(slim_instrs)),
            ("local_labels", func.get("local_labels", {})),
            ("instructions", slim_instrs),
        ]))

    output_data.sort(key=lambda f: f["address"])

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(output_data, f, indent=1, ensure_ascii=False)

    size_mb = output_path.stat().st_size / (1024 * 1024)
    print(f"\nWrote {output_path} ({size_mb:.1f} MB)")


if __name__ == "__main__":
    main()
