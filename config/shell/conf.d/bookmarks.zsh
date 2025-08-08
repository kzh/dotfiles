#!/usr/bin/env zsh

# Lightweight directory bookmarks with fzf integration

export BOOKMARKS_FILE="${BOOKMARKS_FILE:-$HOME/.config/zsh/bookmarks}"
[[ ! -f "$BOOKMARKS_FILE" ]] && mkdir -p "$(dirname "$BOOKMARKS_FILE")" && touch "$BOOKMARKS_FILE"

BM_FZF_OPTS="${FZF_DEFAULT_OPTS:-} --height=70% --layout=reverse --info=inline --border=rounded --margin=1,2 --padding=1"

if [[ -t 1 ]] && [[ "${TERM}" != "dumb" ]] && command -v tput >/dev/null 2>&1 && [[ $(tput colors) -ge 8 ]]; then
  BM_COLOR_ENABLED=1
  BM_COLOR_HEADER="\033[1;35m"
  BM_COLOR_NAME="\033[36m"
  BM_COLOR_PATH="\033[90m"
  BM_COLOR_SUCCESS="\033[32m"
  BM_COLOR_UPDATE="\033[33m"
  BM_COLOR_ERROR="\033[31m"
  BM_COLOR_RESET="\033[0m"
else
  BM_COLOR_ENABLED=0
  BM_COLOR_HEADER=""; BM_COLOR_NAME=""; BM_COLOR_PATH=""; BM_COLOR_SUCCESS=""; BM_COLOR_UPDATE=""; BM_COLOR_ERROR=""; BM_COLOR_RESET=""
fi

_bookmark_help() {
  echo "Bookmark commands:"
  echo "  bm [name] [path]  - Bookmark a directory (default: current dir)"
  echo "  bmg [name]        - Go to bookmark (interactive if no name)"
  echo "  bml               - List bookmarks"
  echo "  bmd <name>        - Delete a bookmark"
  echo ""
  echo "Aliases:"
  echo "  b  = bmg (jump)"
  echo "  bl = bml (list)"
  echo "  ba = bm  (add)"
  echo "  bd = bmd (delete)"
}

bm() {
  local name path
  name="$1"; shift || true
  path="${1:-$PWD}"
  if [[ -z "$name" ]]; then
    _bookmark_help
    return 1
  fi
  if grep -q "^$name=" "$BOOKMARKS_FILE" 2>/dev/null; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "/^$name=/d" "$BOOKMARKS_FILE"
    else
      sed -i "/^$name=/d" "$BOOKMARKS_FILE"
    fi
    echo -e "${BM_COLOR_UPDATE}✏️  Updated bookmark:${BM_COLOR_RESET} ${BM_COLOR_NAME}$name${BM_COLOR_RESET} → ${BM_COLOR_PATH}$path${BM_COLOR_RESET}"
  else
    echo -e "${BM_COLOR_SUCCESS}✅ Added bookmark:${BM_COLOR_RESET} ${BM_COLOR_NAME}$name${BM_COLOR_RESET} → ${BM_COLOR_PATH}$path${BM_COLOR_RESET}"
  fi
  echo "$name=$path" >> "$BOOKMARKS_FILE"
}

bml() {
  if [[ ! -s "$BOOKMARKS_FILE" ]]; then
    echo "No bookmarks saved yet. Use 'bm name' to add one."
    return 0
  fi
  column -t -s= "$BOOKMARKS_FILE"
}

bmd() {
  if [[ -z "$1" ]]; then
    echo -e "${BM_COLOR_ERROR}❌ Usage:${BM_COLOR_RESET} bmd 'bookmark-name'"
    return 1
  fi
  if grep -q "^$1=" "$BOOKMARKS_FILE" 2>/dev/null; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "/^$1=/d" "$BOOKMARKS_FILE"
    else
      sed -i "/^$1=/d" "$BOOKMARKS_FILE"
    fi
    echo -e "${BM_COLOR_ERROR}🗑️  Deleted bookmark:${BM_COLOR_RESET} ${BM_COLOR_NAME}$1${BM_COLOR_RESET}"
  else
    echo -e "${BM_COLOR_ERROR}❌ Bookmark not found:${BM_COLOR_RESET} $1"
    return 1
  fi
}

bmg() {
  if [[ -n "$1" ]]; then
    local bookmark_path=$(grep "^$1=" "$BOOKMARKS_FILE" 2>/dev/null | cut -d= -f2)
    if [[ -n "$bookmark_path" ]]; then
      cd "$bookmark_path"
    else
      echo "Bookmark not found: $1"
      return 1
    fi
  else
    if [[ ! -s "$BOOKMARKS_FILE" ]]; then
      echo "No bookmarks saved yet. Use 'bm name' to add one."
      return 1
    fi
    local selected=$(awk -F= '{printf "%-20s %s\n", $1, $2}' "$BOOKMARKS_FILE" | \
      FZF_DEFAULT_OPTS="$BM_FZF_OPTS" fzf \
        --preview 'echo -e "'${BM_COLOR_HEADER}'📁 Directory Preview'${BM_COLOR_RESET}'\n'${BM_COLOR_PATH}'Path: {2}'${BM_COLOR_RESET}'"; echo; eza -la --icons --group-directories-first --color=always {2} 2>/dev/null || ls -la {2} 2>/dev/null' \
        --preview-window=right:60%:wrap:border-left \
        --prompt='Bookmarks ❯ ' \
        --header=$'Select bookmark to jump to\n' | \
      awk '{print $2}')
    [[ -n "$selected" ]] && cd "$selected"
  fi
}

# Short aliases
alias b='bmg'
alias bl='bml'
alias ba='bm'
alias bd='bmd'

