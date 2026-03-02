"""
Extract string ID->text mappings from game_text_table.txt and generate
a Delphi unit (GameTextTable.pas) with the GetStringByID function.
"""
import re
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
INPUT = BASE / 'analysis' / 'game_text_table.txt'
OUTPUT = BASE / 'src' / 'GameTextTable.pas'

def extract_mappings():
    mappings = []
    in_table = False
    with open(INPUT, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.rstrip()
            if 'STRING ID -> TEXT MAPPING TABLE' in line:
                in_table = True
                continue
            if in_table and line.startswith('===='):
                if mappings:
                    break
                continue
            if in_table and line.startswith('---'):
                continue
            if in_table:
                m = re.match(r'\s*(\d+)\s+0x[0-9A-Fa-f]+\s+(.*)', line)
                if m:
                    sid = int(m.group(1))
                    text = m.group(2).strip()
                    mappings.append((sid, text))
    return mappings

def escape_pascal(s):
    """Escape a string for Delphi Pascal string literal (single quotes)."""
    return s.replace("'", "''")

def generate_unit(mappings):
    lines = []
    lines.append('{')
    lines.append('  Legie - Game Text String Table')
    lines.append('  Decompiled from _Unit61.pas / sub_00550A18')
    lines.append(f'  {len(mappings)} string entries (IDs 0-727)')
    lines.append('  Text encoding: Windows-1250 (Czech)')
    lines.append('}')
    lines.append('unit GameTextTable;')
    lines.append('')
    lines.append('interface')
    lines.append('')
    lines.append('procedure GetStringByID(ID: Word; var Result: AnsiString);')
    lines.append('')
    lines.append('implementation')
    lines.append('')
    lines.append('procedure GetStringByID(ID: Word; var Result: AnsiString);')
    lines.append('begin')
    lines.append('  if ID > 727 then Exit;')
    lines.append('  case ID of')
    
    for sid, text in mappings:
        if text == '(empty)' or text == '':
            lines.append(f"    {sid}: Result := '';")
        else:
            escaped = escape_pascal(text)
            if len(escaped) > 100:
                escaped = escaped[:100] + '...'
                escaped = escape_pascal(escaped[:100]) + "'"
                lines.append(f"    {sid}: Result := '{escaped};")
            else:
                lines.append(f"    {sid}: Result := '{escaped}';")
    
    lines.append('  end;')
    lines.append('end;')
    lines.append('')
    lines.append('end.')
    return '\n'.join(lines)


if __name__ == '__main__':
    print("Extracting string mappings...")
    mappings = extract_mappings()
    print(f"  Found {len(mappings)} mappings")
    
    unit = generate_unit(mappings)
    OUTPUT.write_text(unit, encoding='utf-8')
    print(f"  Written to {OUTPUT}")
