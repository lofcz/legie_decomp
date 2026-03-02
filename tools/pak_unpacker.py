"""
PAK/SUD Unpacker for Legie game data files.

Format (derived from GLVfsPAK.pas disassembly):
  Header (12 bytes):
    [0:4]   magic     - 'PACK' (uncompressed) or 'PACZ' (compressed, unsupported)
    [4:8]   dir_off   - absolute offset to file table directory
    [8:12]  dir_size  - total byte size of directory (entry_count = dir_size // 128)

  Directory entry (128 bytes each, at dir_off):
    [0:120]   filename   - null-terminated ASCII string
    [120:124] data_off   - absolute offset of file data within PAK
    [124:128] data_size  - byte length of file data

Usage:
    python pak_unpacker.py <input.sud> [output_dir]
"""

import struct
import sys
import os
from pathlib import Path

HEADER_SIZE = 12
ENTRY_SIZE = 128
FILENAME_LEN = 120


def read_header(f):
    data = f.read(HEADER_SIZE)
    if len(data) < HEADER_SIZE:
        raise ValueError("File too small for PAK header")
    magic = data[0:4]
    if magic == b'PACZ':
        raise ValueError("Compressed PAK (PACZ) is not supported by this tool")
    if magic != b'PACK':
        raise ValueError(f"Invalid magic: {magic!r} (expected b'PACK')")
    dir_offset, dir_size = struct.unpack_from('<II', data, 4)
    entry_count = dir_size // ENTRY_SIZE
    return dir_offset, dir_size, entry_count


def read_directory(f, dir_offset, entry_count):
    f.seek(dir_offset)
    entries = []
    for i in range(entry_count):
        raw = f.read(ENTRY_SIZE)
        if len(raw) < ENTRY_SIZE:
            raise ValueError(f"Truncated directory entry {i}")
        name_bytes = raw[0:FILENAME_LEN]
        null_pos = name_bytes.find(b'\x00')
        if null_pos >= 0:
            name_bytes = name_bytes[:null_pos]
        filename = name_bytes.decode('ascii', errors='replace')
        data_offset, data_size = struct.unpack_from('<II', raw, FILENAME_LEN)
        entries.append((filename, data_offset, data_size))
    return entries


def extract_all(pak_path, out_dir):
    pak_path = Path(pak_path)
    out_dir = Path(out_dir)

    with open(pak_path, 'rb') as f:
        dir_offset, dir_size, entry_count = read_header(f)
        print(f"PAK: {pak_path.name}")
        print(f"  Directory offset : 0x{dir_offset:08X}")
        print(f"  Directory size   : {dir_size} bytes")
        print(f"  Entry count      : {entry_count}")
        print()

        entries = read_directory(f, dir_offset, entry_count)

        ext_counts = {}
        total_bytes = 0

        for i, (filename, data_offset, data_size) in enumerate(entries):
            ext = Path(filename).suffix.lower()
            ext_counts[ext] = ext_counts.get(ext, 0) + 1
            total_bytes += data_size

            dest = out_dir / filename
            dest.parent.mkdir(parents=True, exist_ok=True)

            f.seek(data_offset)
            data = f.read(data_size)
            if len(data) < data_size:
                print(f"  WARNING: truncated file {filename} ({len(data)}/{data_size})")

            dest.write_bytes(data)

            if (i + 1) % 200 == 0 or i == entry_count - 1:
                print(f"  Extracted {i + 1}/{entry_count} files...")

    print()
    print(f"Done. {entry_count} files extracted to {out_dir}")
    print(f"Total data: {total_bytes:,} bytes ({total_bytes / 1048576:.1f} MB)")
    print()
    print("File types:")
    for ext in sorted(ext_counts, key=lambda e: ext_counts[e], reverse=True):
        print(f"  {ext or '(no ext)':>10s} : {ext_counts[ext]}")


def list_contents(pak_path):
    """List PAK contents without extracting."""
    with open(pak_path, 'rb') as f:
        dir_offset, dir_size, entry_count = read_header(f)
        entries = read_directory(f, dir_offset, entry_count)

    print(f"{'#':>5s}  {'Offset':>10s}  {'Size':>10s}  Filename")
    print("-" * 60)
    for i, (filename, data_offset, data_size) in enumerate(entries):
        print(f"{i:5d}  0x{data_offset:08X}  {data_size:10,d}  {filename}")
    print(f"\nTotal: {entry_count} entries")


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage:")
        print(f"  python {sys.argv[0]} <input.sud> [output_dir]   - extract all files")
        print(f"  python {sys.argv[0]} --list <input.sud>         - list contents")
        sys.exit(1)

    if sys.argv[1] == '--list':
        if len(sys.argv) < 3:
            print("Error: --list requires a PAK file path")
            sys.exit(1)
        list_contents(sys.argv[2])
    else:
        pak_file = sys.argv[1]
        if len(sys.argv) >= 3:
            output = sys.argv[2]
        else:
            output = Path(pak_file).stem + "_extracted"
        extract_all(pak_file, output)
