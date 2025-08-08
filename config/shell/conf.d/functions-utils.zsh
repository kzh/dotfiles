#!/usr/bin/env zsh

# Utility functions
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

bak() {
  cp -r "$1" "$1.bak.$(date +%Y%m%d_%H%M%S)"
}

replace() {
  if [[ $# -ne 3 ]]; then
    echo "Usage: replace 'find' 'replace' 'files'"
    return 1
  fi
  if [[ "$OSTYPE" == "darwin"* ]]; then
    find . -type f -name "$3" -exec sed -i '' "s/$1/$2/g" {} +
  else
    find . -type f -name "$3" -exec sed -i "s/$1/$2/g" {} +
  fi
}

mkcd() {
  if [[ -z "$1" ]]; then
    echo "Usage: mkcd 'directory'" >&2
    return 1
  fi
  mkdir -p "$1" && cd "$1"
}

fname() {
  if [[ -z "$1" ]]; then
    echo "Usage: fname 'pattern'"
    return 1
  fi
  find . -name "*$1*" -type f 2>/dev/null
}

dname() {
  if [[ -z "$1" ]]; then
    echo "Usage: dname 'pattern'"
    return 1
  fi
  find . -name "*$1*" -type d 2>/dev/null
}

sizeof() {
  if [[ -z "$1" ]]; then
    du -sh .
  else
    du -sh "$1"
  fi
}

killport() {
  if [[ -z "$1" ]]; then
    echo "Usage: killport 'port'"
    return 1
  fi
  if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: Port must be a number"
    return 1
  fi
  local pids=$(lsof -ti:$1 2>/dev/null)
  if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9 2>/dev/null && echo "Killed processes on port $1"
  else
    echo "No process found on port $1"
  fi
}

gclone() {
  if [[ -z "$1" ]]; then
    echo "Usage: gclone 'repo-url'"
    return 1
  fi
  git clone "$1" && cd "$(basename "$1" .git)"
}

take() {
  mkdir -p "$@" && cd "${@:$#}"
}

# Docker helper: build and push to GHCR
dbp() {
  if [[ -z "$1" ]]; then
    echo "Usage: dbp 'image-name'" >&2
    return 1
  fi
  docker build -t "ghcr.io/$1" . && docker push "ghcr.io/$1"
}

