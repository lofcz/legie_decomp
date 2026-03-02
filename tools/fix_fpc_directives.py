"""Fix FPC-only compiler directives in GLScene source files for Delphi 7."""
import glob
import re

files = glob.glob('glscene/Source/**/*.pas', recursive=True)
total = 0
pat = re.compile(r'\{\$(?:INFO|HINT|WARNING|Note)\s', re.IGNORECASE)

for f in files:
    with open(f, 'r', encoding='utf-8', errors='replace') as fh:
        content = fh.read()
    matches = pat.findall(content)
    if not matches:
        continue
    def repl(m):
        s = m.group(0)
        return '{' + s[2:]
    new = pat.sub(repl, content)
    if new != content:
        with open(f, 'w', encoding='utf-8') as fh:
            fh.write(new)
        print(f'  Fixed {len(matches)} in {f}')
        total += len(matches)

print(f'Total: {total}')
