#!/bin/sh
set -eu

cd "$(dirname "$0")"

extensions_file="$(mktemp "${TMPDIR:-/tmp}/vscode-extensions.XXXXXX")"
trap 'rm -f "$extensions_file"' EXIT HUP INT TERM

code --list-extensions \
  | LC_ALL=C sort \
  | sed 's/^/code --install-extension /' > "$extensions_file"
mv "$extensions_file" extensions.txt
trap - EXIT HUP INT TERM

git add -- .gitignore README.md extensions.txt keybindings.json push.sh settings.json

if git diff --cached --quiet; then
  echo "VS Code configuration is already up to date."
else
  git commit -m 'sync'
fi

git push
