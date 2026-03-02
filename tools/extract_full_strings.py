"""
Extract full-length strings from the Delphi executable binary by
reading the case statement jump table directly.

The function sub_00550A18 (GetStringByID) uses:
  MOVZX EAX, AX
  CMP EAX, 0x2D7     (727)
  JA exit
  JMP DWORD PTR [EAX*4 + 0x550A3F]   <- jump table

The jump table at VA 0x00550A3F has 728 entries (4 bytes each).
Each handler does one of:
  - MOV EAX,EBX; MOV EDX,STRING_VA; CALL @LStrAsg  (assign string)
  - MOV EAX,EBX; CALL @LStrClr                      (empty string)
  - JMP exit                                          (default/no-op)
"""
import struct
import re
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
EXE_PATH = BASE / 'legie_unpacked.exe'
OUTPUT = BASE / 'src' / 'GameTextTable.pas'

IMAGE_BASE = 0x00400000
JUMP_TABLE_VA = 0x00550A3F
NUM_ENTRIES = 728
LSTRASG_VA = None  # Will detect

def get_pe_sections(data):
    pe_offset = struct.unpack_from('<I', data, 0x3C)[0]
    num_sections = struct.unpack_from('<H', data, pe_offset + 6)[0]
    opt_hdr_size = struct.unpack_from('<H', data, pe_offset + 20)[0]
    section_offset = pe_offset + 24 + opt_hdr_size
    sections = []
    for i in range(num_sections):
        off = section_offset + i * 40
        name = data[off:off+8].rstrip(b'\x00').decode('ascii', errors='replace')
        va = struct.unpack_from('<I', data, off + 12)[0]
        raw_size = struct.unpack_from('<I', data, off + 16)[0]
        raw_ptr = struct.unpack_from('<I', data, off + 20)[0]
        sections.append({'name': name, 'va': va, 'raw_size': raw_size, 'raw_ptr': raw_ptr})
    return sections

def va_to_offset(va, sections):
    rva = va - IMAGE_BASE
    for s in sections:
        if s['va'] <= rva < s['va'] + s['raw_size']:
            return s['raw_ptr'] + (rva - s['va'])
    return None

def read_dword(data, va, sections):
    fo = va_to_offset(va, sections)
    if fo is None:
        return None
    return struct.unpack_from('<I', data, fo)[0]

def read_bytes_at(data, va, length, sections):
    fo = va_to_offset(va, sections)
    if fo is None:
        return None
    return data[fo:fo+length]

def read_delphi_string(data, va, sections):
    """Read a Delphi AnsiString. Length at VA-4, data at VA."""
    fo = va_to_offset(va, sections)
    if fo is None:
        return None
    len_fo = va_to_offset(va - 4, sections)
    if len_fo is not None:
        str_len = struct.unpack_from('<I', data, len_fo)[0]
        if 0 < str_len < 10000:
            raw = data[fo:fo + str_len]
            try:
                return raw.decode('cp1250')
            except:
                pass
    # Fallback: null-terminated
    end = data.find(b'\x00', fo, fo + 10000)
    if end >= 0:
        try:
            return data[fo:end].decode('cp1250')
        except:
            pass
    return None

def analyze_handler(data, handler_va, sections):
    """
    Analyze a case handler to extract the string VA.
    
    Expected patterns:
    1. String assignment:
       89 D8          MOV EAX, EBX     (or 8B C3)
       BA xx xx xx xx MOV EDX, string_va
       E8 xx xx xx xx CALL @LStrAsg
    
    2. Empty string:
       89 D8          MOV EAX, EBX
       E8 xx xx xx xx CALL @LStrClr
    
    3. Default (just jump to exit):
       E9 xx xx xx xx JMP exit
       or just falls through
    """
    code = read_bytes_at(data, handler_va, 20, sections)
    if code is None:
        return 'default', None

    # Pattern 1: MOV EAX,EBX (89 D8 or 8B C3) + MOV EDX,imm32 (BA xx xx xx xx)
    # Check for 89 D8 BA or 8B C3 BA
    if len(code) >= 7:
        if (code[0:2] in (b'\x89\xD8', b'\x8B\xC3')) and code[2] == 0xBA:
            string_va = struct.unpack_from('<I', code, 3)[0]
            return 'string', string_va
        
        # Sometimes: MOV EAX,EBX + CALL @LStrClr (no MOV EDX)
        if (code[0:2] in (b'\x89\xD8', b'\x8B\xC3')) and code[2] == 0xE8:
            return 'empty', None
    
    # Pattern: direct JMP (E9 xx xx xx xx) - default case
    if code[0] == 0xE9:
        return 'default', None

    # Try offset +0: might start differently
    # Check if first byte is MOV EAX,EBX differently encoded
    if len(code) >= 8:
        # 8B C3 = MOV EAX, EBX (alternative encoding)
        for start in range(0, 4):
            if start + 7 <= len(code):
                if code[start] == 0xBA:
                    string_va = struct.unpack_from('<I', code, start + 1)[0]
                    return 'string', string_va

    return 'unknown', None

def escape_pascal(s):
    return s.replace("'", "''")

def pascal_string_literal(s, max_chunk=200):
    """Build a Delphi string literal, splitting at chunk boundaries if needed."""
    escaped = escape_pascal(s)
    if len(escaped) <= max_chunk:
        return f"'{escaped}'"
    chunks = []
    while escaped:
        chunks.append(f"'{escaped[:max_chunk]}'")
        escaped = escaped[max_chunk:]
    return ' +\n      '.join(chunks)

def main():
    print("Reading executable...")
    exe_data = EXE_PATH.read_bytes()
    sections = get_pe_sections(exe_data)
    print(f"  Sections: {', '.join(s['name'] for s in sections)}")

    print(f"Reading jump table at VA 0x{JUMP_TABLE_VA:08X}...")
    handlers = []
    for i in range(NUM_ENTRIES):
        va = JUMP_TABLE_VA + i * 4
        handler_va = read_dword(exe_data, va, sections)
        if handler_va is None:
            handlers.append(None)
        else:
            handlers.append(handler_va)

    valid_handlers = sum(1 for h in handlers if h is not None)
    print(f"  Read {valid_handlers} handler addresses")

    print("Analyzing case handlers...")
    results = {}
    stats = {'string': 0, 'empty': 0, 'default': 0, 'unknown': 0}
    
    for sid, handler_va in enumerate(handlers):
        if handler_va is None:
            results[sid] = ''
            stats['default'] += 1
            continue
        
        kind, string_va = analyze_handler(exe_data, handler_va, sections)
        stats[kind] = stats.get(kind, 0) + 1
        
        if kind == 'string' and string_va:
            text = read_delphi_string(exe_data, string_va, sections)
            if text:
                results[sid] = text
            else:
                results[sid] = f'[unreadable at 0x{string_va:08X}]'
        elif kind == 'empty':
            results[sid] = ''
        else:
            results[sid] = ''

    print(f"  Results: {stats}")
    print(f"  Strings with content: {sum(1 for t in results.values() if t and not t.startswith('['))}")

    # Generate Pascal unit
    print("Generating GameTextTable.pas...")
    lines = []
    lines.append('{')
    lines.append('  Legie - Game Text String Table')
    lines.append('  Extracted directly from legie_unpacked.exe jump table')
    lines.append(f'  {NUM_ENTRIES} entries (IDs 0-{NUM_ENTRIES-1}), full-length strings')
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
    lines.append(f'  if ID > {NUM_ENTRIES-1} then Exit;')
    lines.append('  case ID of')

    for sid in range(NUM_ENTRIES):
        text = results.get(sid, '')
        if not text or text.startswith('['):
            lines.append(f"    {sid}: Result := '';")
        else:
            lines.append(f"    {sid}: Result := {pascal_string_literal(text)};")

    lines.append('  end;')
    lines.append('end;')
    lines.append('')
    lines.append('end.')

    OUTPUT.write_text('\n'.join(lines), encoding='cp1250')
    
    total_chars = sum(len(t) for t in results.values() if not t.startswith('['))
    max_len = max((len(t) for t in results.values()), default=0)
    print(f"  Written: 728 entries, {total_chars} total chars, longest={max_len}")

if __name__ == '__main__':
    main()
