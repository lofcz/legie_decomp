"""
Assembly Analyzer for IDR-decompiled Delphi 7 source files.

Parses the x86 assembly blocks in {* ... *} comment sections from IDR output
and produces:
  1. String cross-reference table (function -> string literals)
  2. Call graph (function -> called functions)
  3. Global variable usage map (gvar -> functions that read/write it)
  4. Game state machine trace (values assigned to a tracked variable)
  5. Function catalog with sizes and parameter info

Usage:
    python asm_analyzer.py <Projects_dir> [--output analysis]
"""

import re
import os
import sys
import json
from pathlib import Path
from collections import defaultdict


# Regex patterns for IDR assembly output
RE_FUNC_START = re.compile(
    r"^(?:procedure|function|constructor|destructor)\s+"
    r"(?:(\w+)\.)?(\w+)"
)
RE_FUNC_HEADER_COMMENT = re.compile(r"^//([0-9A-Fa-f]{8})")
RE_ASM_LINE = re.compile(r"^\s*>?([0-9A-Fa-f]{8})\s+(.*)")
RE_STRING_LIT = re.compile(r";'([^']*)'")
RE_CALL_SUB = re.compile(r"\bcall\s+(?:dword\s+ptr\s+\[.*\]|)?\s*(?:sub_)?([0-9A-Fa-f]{8})")
RE_CALL_NAMED = re.compile(r"\bcall\s+(\w+(?:\.\w+)*)")
RE_GVAR = re.compile(r"gvar_([0-9A-Fa-f]{8})")
RE_GVAR_ADDR = re.compile(r"\[(?:005|5)[0-9A-Fa-f]{5}\]|ds:\[(?:005|5)[0-9A-Fa-f]{5}\]")
RE_MOV_CONST = re.compile(r"mov\s+.*,\s*([0-9A-Fa-f]+)\s*$")
RE_BLOCK_START = re.compile(r"^\{\*")
RE_BLOCK_END = re.compile(r"^\*\}")


class AsmFunction:
    __slots__ = ['address', 'name', 'cls', 'unit', 'params', 'asm_lines',
                 'string_refs', 'calls', 'gvar_reads', 'gvar_writes']

    def __init__(self, address, name, cls, unit, params):
        self.address = address
        self.name = name
        self.cls = cls
        self.unit = unit
        self.params = params
        self.asm_lines = 0
        self.string_refs = []
        self.calls = []
        self.gvar_reads = []
        self.gvar_writes = []


def parse_unit_file(filepath):
    """Parse a single IDR .pas file and extract function info."""
    functions = []
    current_func = None
    in_asm_block = False
    unit_name = Path(filepath).stem

    with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
        lines = f.readlines()

    i = 0
    while i < len(lines):
        line = lines[i].rstrip()
        i += 1

        # Detect function header from the comment line before the function
        # Pattern: //XXXXXXXX
        addr_match = RE_FUNC_HEADER_COMMENT.match(line)
        if addr_match and i < len(lines):
            addr_hex = addr_match.group(1)
            next_line = lines[i].rstrip() if i < len(lines) else ''

            func_match = RE_FUNC_START.match(next_line)
            if func_match:
                cls_name = func_match.group(1) or ''
                func_name = func_match.group(2)
                params = next_line
                current_func = AsmFunction(
                    address=addr_hex,
                    name=func_name,
                    cls=cls_name,
                    unit=unit_name,
                    params=params,
                )
                functions.append(current_func)

            # Also handle commented-out functions: {*function sub_XXXX...
            elif not func_match:
                for lookahead in range(min(3, len(lines) - i)):
                    peek = lines[i + lookahead].rstrip()
                    if peek.startswith('{*'):
                        func_text = peek[2:].strip()
                        fm = RE_FUNC_START.match(func_text)
                        if fm:
                            cls_name = fm.group(1) or ''
                            func_name = fm.group(2)
                            current_func = AsmFunction(
                                address=addr_hex,
                                name=func_name,
                                cls=cls_name,
                                unit=unit_name,
                                params=func_text,
                            )
                            functions.append(current_func)
                        break

        if RE_BLOCK_START.match(line):
            in_asm_block = True
            # Check if the {* line itself has function declaration
            func_text = line[2:].strip() if line.startswith('{*') else ''
            if func_text and not current_func:
                fm = RE_FUNC_START.match(func_text)
                if fm:
                    cls_name = fm.group(1) or ''
                    func_name = fm.group(2)
                    current_func = AsmFunction(
                        address='00000000',
                        name=func_name,
                        cls=cls_name,
                        unit=unit_name,
                        params=func_text,
                    )
                    functions.append(current_func)

        if RE_BLOCK_END.match(line):
            in_asm_block = False
            continue

        if not in_asm_block or not current_func:
            continue

        asm_match = RE_ASM_LINE.match(line)
        if not asm_match:
            continue

        current_func.asm_lines += 1
        asm_text = asm_match.group(2)

        # Extract string references
        for s in RE_STRING_LIT.findall(line):
            if s and s not in current_func.string_refs:
                current_func.string_refs.append(s)

        # Extract function calls
        for call_match in RE_CALL_NAMED.finditer(asm_text):
            target = call_match.group(1)
            if target.startswith('0') or target.startswith('sub_'):
                continue
            if target not in current_func.calls:
                current_func.calls.append(target)

        # Extract sub_XXXX calls (by address)
        for addr in re.findall(r'\bcall\s+([0-9A-Fa-f]{6,8})\b', asm_text):
            label = f"sub_{addr.zfill(8).upper()}"
            if label not in current_func.calls:
                current_func.calls.append(label)

        # Extract global variable references
        for gv in RE_GVAR.findall(line):
            gv_name = f"gvar_{gv.upper()}"
            gv_short = gv.upper().lstrip('0') or '0'
            # Heuristic: if gvar address appears in the destination of a mov, it's a write
            dest_part = asm_text.split(',')[0].upper() if ',' in asm_text else ''
            is_write = (dest_part.lstrip().startswith('MOV') and
                        (gv.upper() in dest_part or gv_short in dest_part))
            if is_write:
                if gv_name not in current_func.gvar_writes:
                    current_func.gvar_writes.append(gv_name)
            else:
                if gv_name not in current_func.gvar_reads:
                    current_func.gvar_reads.append(gv_name)

    return functions


def analyze_all(projects_dir):
    """Parse all .pas files in the Projects directory."""
    all_functions = []
    pas_files = sorted(Path(projects_dir).glob('*.pas'))

    for pf in pas_files:
        try:
            funcs = parse_unit_file(pf)
            all_functions.extend(funcs)
        except Exception as e:
            print(f"  Warning: error parsing {pf.name}: {e}")

    return all_functions


def build_string_xrefs(functions):
    """Map string literal -> list of functions referencing it."""
    xrefs = defaultdict(list)
    for func in functions:
        fqn = f"{func.cls + '.' if func.cls else ''}{func.name}"
        for s in func.string_refs:
            xrefs[s].append({'func': fqn, 'addr': func.address, 'unit': func.unit})
    return dict(sorted(xrefs.items()))


def build_call_graph(functions):
    """Build caller -> callee adjacency list."""
    graph = {}
    for func in functions:
        fqn = f"{func.cls + '.' if func.cls else ''}{func.name}"
        if func.calls:
            graph[fqn] = {
                'address': func.address,
                'unit': func.unit,
                'calls': func.calls
            }
    return graph


def build_gvar_map(functions):
    """Map each global variable to its readers and writers."""
    gvar_map = defaultdict(lambda: {'readers': [], 'writers': []})
    for func in functions:
        fqn = f"{func.cls + '.' if func.cls else ''}{func.name}"
        for gv in func.gvar_reads:
            entry = {'func': fqn, 'addr': func.address, 'unit': func.unit}
            if entry not in gvar_map[gv]['readers']:
                gvar_map[gv]['readers'].append(entry)
        for gv in func.gvar_writes:
            entry = {'func': fqn, 'addr': func.address, 'unit': func.unit}
            if entry not in gvar_map[gv]['writers']:
                gvar_map[gv]['writers'].append(entry)
    return dict(sorted(gvar_map.items()))


def trace_game_state(functions, state_var='gvar_005F5577'):
    """Trace all writes to the game state variable."""
    transitions = []
    for func in functions:
        fqn = f"{func.cls + '.' if func.cls else ''}{func.name}"
        if state_var in func.gvar_writes:
            transitions.append({
                'func': fqn,
                'addr': func.address,
                'unit': func.unit,
            })
    return transitions


def build_function_catalog(functions):
    """Create a catalog of all functions with metadata."""
    catalog = []
    for func in functions:
        catalog.append({
            'address': func.address,
            'name': func.name,
            'class': func.cls,
            'unit': func.unit,
            'asm_lines': func.asm_lines,
            'string_count': len(func.string_refs),
            'call_count': len(func.calls),
            'gvar_read_count': len(func.gvar_reads),
            'gvar_write_count': len(func.gvar_writes),
            'strings': func.string_refs[:10],
            'signature': func.params,
        })
    catalog.sort(key=lambda x: x['address'])
    return catalog


def write_report(output_dir, functions):
    """Generate all analysis reports."""
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    string_xrefs = build_string_xrefs(functions)
    call_graph = build_call_graph(functions)
    gvar_map = build_gvar_map(functions)
    state_trace = trace_game_state(functions)
    catalog = build_function_catalog(functions)

    # 1. String xrefs
    with open(output_dir / 'string_xrefs.json', 'w', encoding='utf-8') as f:
        json.dump(string_xrefs, f, indent=2, ensure_ascii=False)

    # 2. Call graph
    with open(output_dir / 'call_graph.json', 'w', encoding='utf-8') as f:
        json.dump(call_graph, f, indent=2)

    # 3. Global variable map
    with open(output_dir / 'gvar_map.json', 'w', encoding='utf-8') as f:
        json.dump(gvar_map, f, indent=2)

    # 4. Game state trace
    with open(output_dir / 'game_state_trace.json', 'w', encoding='utf-8') as f:
        json.dump(state_trace, f, indent=2)

    # 5. Function catalog
    with open(output_dir / 'function_catalog.json', 'w', encoding='utf-8') as f:
        json.dump(catalog, f, indent=2, ensure_ascii=False)

    # 6. Human-readable summary
    with open(output_dir / 'summary.txt', 'w', encoding='utf-8') as f:
        f.write("=" * 70 + "\n")
        f.write("LEGIE ASSEMBLY ANALYSIS SUMMARY\n")
        f.write("=" * 70 + "\n\n")

        f.write(f"Total functions parsed: {len(functions)}\n")
        f.write(f"Total assembly lines:   {sum(fn.asm_lines for fn in functions)}\n")
        f.write(f"Unique string literals: {len(string_xrefs)}\n")
        f.write(f"Global variables:       {len(gvar_map)}\n")
        f.write(f"Game state writers:     {len(state_trace)}\n\n")

        # Unit breakdown
        unit_counts = defaultdict(int)
        unit_asm = defaultdict(int)
        for fn in functions:
            unit_counts[fn.unit] += 1
            unit_asm[fn.unit] += fn.asm_lines
        f.write("FUNCTIONS BY UNIT:\n")
        f.write("-" * 50 + "\n")
        for unit in sorted(unit_counts, key=lambda u: unit_asm[u], reverse=True):
            f.write(f"  {unit:30s}  {unit_counts[unit]:4d} funcs  {unit_asm[unit]:6d} asm lines\n")

        # Largest functions
        f.write("\nLARGEST FUNCTIONS (by asm lines):\n")
        f.write("-" * 70 + "\n")
        largest = sorted(functions, key=lambda fn: fn.asm_lines, reverse=True)[:30]
        for fn in largest:
            fqn = f"{fn.cls + '.' if fn.cls else ''}{fn.name}"
            f.write(f"  {fn.address}  {fqn:45s}  {fn.asm_lines:5d} lines  [{fn.unit}]\n")

        # Functions with most string references (likely game logic)
        f.write("\nFUNCTIONS WITH MOST STRING REFS:\n")
        f.write("-" * 70 + "\n")
        most_strings = sorted(functions, key=lambda fn: len(fn.string_refs), reverse=True)[:30]
        for fn in most_strings:
            fqn = f"{fn.cls + '.' if fn.cls else ''}{fn.name}"
            strs = ', '.join(fn.string_refs[:5])
            if len(fn.string_refs) > 5:
                strs += f', ... (+{len(fn.string_refs)-5} more)'
            f.write(f"  {fn.address}  {fqn:40s}  {len(fn.string_refs):3d} strings: {strs}\n")

        # Game state transitions
        f.write(f"\nGAME STATE WRITERS (gvar_005F5577):\n")
        f.write("-" * 50 + "\n")
        for t in state_trace:
            f.write(f"  {t['addr']}  {t['func']:40s}  [{t['unit']}]\n")

        # Most-used global variables
        f.write("\nMOST-USED GLOBAL VARIABLES:\n")
        f.write("-" * 60 + "\n")
        gvar_usage = [(gv, len(info['readers']) + len(info['writers']))
                      for gv, info in gvar_map.items()]
        gvar_usage.sort(key=lambda x: x[1], reverse=True)
        for gv, count in gvar_usage[:40]:
            info = gvar_map[gv]
            f.write(f"  {gv}  {count:3d} refs ({len(info['readers'])} read, {len(info['writers'])} write)\n")

    print(f"Reports written to {output_dir}/")
    print(f"  string_xrefs.json     - {len(string_xrefs)} unique strings")
    print(f"  call_graph.json       - {len(call_graph)} callers")
    print(f"  gvar_map.json         - {len(gvar_map)} global variables")
    print(f"  game_state_trace.json - {len(state_trace)} state writers")
    print(f"  function_catalog.json - {len(catalog)} functions")
    print(f"  summary.txt           - human-readable overview")


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print(f"Usage: python {sys.argv[0]} <Projects_dir> [--output analysis_dir]")
        sys.exit(1)

    projects_dir = sys.argv[1]
    output_dir = 'analysis'
    if '--output' in sys.argv:
        idx = sys.argv.index('--output')
        if idx + 1 < len(sys.argv):
            output_dir = sys.argv[idx + 1]

    print(f"Parsing .pas files in {projects_dir}...")
    all_functions = analyze_all(projects_dir)
    print(f"Found {len(all_functions)} functions total\n")

    print("Generating analysis reports...")
    write_report(output_dir, all_functions)
