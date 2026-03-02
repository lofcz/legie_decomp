"""
Build script for the Legie decompilation project.

Compiles the Delphi project with dcc32 and optionally runs the asm differ.

Usage:
    python build.py                    # just compile
    python build.py --diff FormCreate  # compile then diff a function
    python build.py --diff-all         # compile then show progress
"""

import os
import sys
import time
import subprocess
import argparse
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
SRC_DIR = BASE / "src"
BIN_DIR = BASE / "bin"
DCC32 = Path(r"C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe")


def kill_legie():
    """Kill any running Legie.exe processes."""
    try:
        result = subprocess.run(
            ["taskkill", "/f", "/im", "Legie.exe"],
            capture_output=True, text=True, timeout=10,
        )
        if result.returncode == 0:
            print("Killed running Legie.exe")
            time.sleep(1)
    except Exception:
        pass


def compile_project():
    """Compile Legie.dpr with dcc32. Returns True on success."""
    if not DCC32.exists():
        print(f"ERROR: dcc32.exe not found at {DCC32}")
        return False

    dpr_file = SRC_DIR / "Legie.dpr"
    if not dpr_file.exists():
        print(f"ERROR: {dpr_file} not found")
        return False

    exe_path = BIN_DIR / "Legie.exe"
    if exe_path.exists():
        try:
            os.remove(exe_path)
        except PermissionError:
            print("Legie.exe is locked, attempting to kill...")
            kill_legie()
            time.sleep(2)
            try:
                os.remove(exe_path)
            except PermissionError:
                print("ERROR: Cannot remove Legie.exe -- close it manually")
                return False

    print(f"Compiling {dpr_file.name}...")
    result = subprocess.run(
        [str(DCC32), "Legie.dpr"],
        capture_output=True, text=True, cwd=str(SRC_DIR), timeout=120,
    )

    stdout = result.stdout.strip()
    stderr = result.stderr.strip()

    if stdout:
        for line in stdout.splitlines():
            line = line.strip()
            if line and not line.startswith("Borland") and not line.startswith("Copyright"):
                print(f"  {line}")

    if result.returncode != 0:
        print(f"\nCompilation FAILED (exit code {result.returncode})")
        if stderr:
            print(stderr)
        return False

    map_file = BIN_DIR / "Legie.map"
    if map_file.exists():
        size_kb = map_file.stat().st_size / 1024
        print(f"  Map file: {map_file} ({size_kb:.0f} KB)")

    if exe_path.exists():
        size_kb = exe_path.stat().st_size / 1024
        print(f"  Executable: {exe_path} ({size_kb:.0f} KB)")
        print("Compilation SUCCEEDED")
        return True
    else:
        print("ERROR: Exe not produced despite dcc32 returning success")
        return False


def main():
    parser = argparse.ArgumentParser(description="Build Legie project")
    parser.add_argument("--diff", metavar="FUNC", help="Diff a specific function after build")
    parser.add_argument("--diff-all", action="store_true", help="Show progress for all functions")
    parser.add_argument("--kill", action="store_true", help="Just kill Legie.exe")
    args = parser.parse_args()

    if args.kill:
        kill_legie()
        return

    ok = compile_project()
    if not ok:
        sys.exit(1)

    if args.diff:
        differ = BASE / "tools" / "asm_differ.py"
        if differ.exists():
            print(f"\n--- Diffing function: {args.diff} ---\n")
            result = subprocess.run(
                [sys.executable, str(differ), args.diff],
                cwd=str(BASE), capture_output=True, text=True,
            )
            if result.stdout:
                print(result.stdout)
            if result.stderr:
                print(result.stderr, file=sys.stderr)
        else:
            print(f"\nasm_differ.py not found at {differ}")

    if args.diff_all:
        progress = BASE / "tools" / "progress.py"
        if progress.exists():
            print("\n--- Progress Report ---\n")
            result = subprocess.run(
                [sys.executable, str(progress)],
                cwd=str(BASE), capture_output=True, text=True,
            )
            if result.stdout:
                print(result.stdout)
            if result.stderr:
                print(result.stderr, file=sys.stderr)
        else:
            print(f"\nprogress.py not found at {progress}")


if __name__ == "__main__":
    main()
