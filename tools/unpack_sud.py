"""Extract all files from a Quake II-style PACK file (legie.sud).

Format:
  Header (12 bytes): 'PACK' + DirOffset(4) + DirLength(4)
  File table at DirOffset: entries of 128 bytes each
    - 120 bytes: null-terminated filename
    - 4 bytes: file offset
    - 4 bytes: file size
  DirLength / 128 = number of files
"""
import struct, os, sys

def unpack(pak_path, out_dir):
    with open(pak_path, 'rb') as f:
        sig = f.read(4)
        if sig != b'PACK':
            print(f"Bad signature: {sig!r}")
            sys.exit(1)

        dir_offset, dir_length = struct.unpack('<ii', f.read(8))
        num_files = dir_length // 128
        print(f"PACK: {num_files} files, directory at 0x{dir_offset:X}")

        f.seek(dir_offset)
        entries = []
        for _ in range(num_files):
            raw = f.read(128)
            name_bytes = raw[:120]
            name = name_bytes.split(b'\x00', 1)[0].decode('ascii', errors='replace')
            file_pos, file_len = struct.unpack('<ii', raw[120:128])
            entries.append((name, file_pos, file_len))

        os.makedirs(out_dir, exist_ok=True)
        for name, pos, length in entries:
            out_path = os.path.join(out_dir, name.replace('/', os.sep))
            os.makedirs(os.path.dirname(out_path), exist_ok=True)
            f.seek(pos)
            data = f.read(length)
            with open(out_path, 'wb') as of:
                of.write(data)

        print(f"Extracted {len(entries)} files to {out_dir}")

        exts = {}
        for name, _, length in entries:
            ext = os.path.splitext(name)[1].lower()
            exts.setdefault(ext, []).append(length)
        print("\nBreakdown by extension:")
        for ext in sorted(exts, key=lambda e: -len(exts[e])):
            total = sum(exts[ext])
            print(f"  {ext or '(none)':8s}: {len(exts[ext]):4d} files, {total:>10,d} bytes")

if __name__ == '__main__':
    pak = sys.argv[1] if len(sys.argv) > 1 else r'c:\Users\lordo\Documents\Legie\bin\legie.sud'
    out = sys.argv[2] if len(sys.argv) > 2 else r'c:\Users\lordo\Documents\Legie\pak_extracted'
    unpack(pak, out)
