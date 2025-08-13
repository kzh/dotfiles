#!/usr/bin/env zsh

# cdr: jump to the root of the current git repository
# Usage: cdr
# - If inside a git work tree, cd to its top-level directory
# - Otherwise, print an error and return non-zero

cdr() {
  local root
  if root=$(git rev-parse --show-toplevel 2>/dev/null); then
    builtin cd "$root" || return
  else
    echo "cdr: not inside a git repository" >&2
    return 1
  fi
}

