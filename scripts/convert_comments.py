#!/usr/bin/env python3
"""
Convert /* ... */ block comments to // line comments in .scss files under src/
Skips files named `theme.scss` and files whose name contains `style-settings` or that contain
the `@settings` marker near the top.

Usage:
  python3 scripts/convert_comments.py        # dry-run
  python3 scripts/convert_comments.py --apply  # apply changes (creates .bak backups)
"""
import re
from pathlib import Path
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--apply", action="store_true")
args = parser.parse_args()

root = Path("src")
pattern = re.compile(r'/\*(.*?)\*/', re.S)
changed = []

for fp in sorted(root.rglob("*.scss")):
    name = fp.name
    if name == "theme.scss":
        continue
    if "style-settings" in name or "_style-settings" in name:
        continue
    text = fp.read_text(encoding="utf8")
    # skip files that include @settings marker (style metadata)
    if "@settings" in text[:2000]:
        continue

    def repl(m):
        s = m.string
        start = m.start()
        # find indentation at start of comment by locating last newline
        nl = s.rfind('\n', 0, start)
        if nl == -1:
            indent = ''
        else:
            indent = re.match(r'[ \t]*', s[nl+1:start]).group(0)
        body = m.group(1)
        lines = body.splitlines()
        if not lines:
            return indent + '//'
        out_lines = []
        for line in lines:
            # preserve relative spacing, but prefix with //
            if line.strip() == '':
                out_lines.append(indent + '//')
            else:
                out_lines.append(indent + '//' + (' ' + line.lstrip()))
        return '\n'.join(out_lines)

    new = pattern.sub(repl, text)
    if new != text:
        print(("APPLY:" if args.apply else "DRY:  "), fp)
        changed.append(str(fp))
        if args.apply:
            bak = fp.with_suffix(fp.suffix + '.bak')
            bak.write_text(text, encoding='utf8')
            fp.write_text(new, encoding='utf8')

if not changed:
    print("No files would be changed.")
else:
    print(f"Total files matched: {len(changed)}")
