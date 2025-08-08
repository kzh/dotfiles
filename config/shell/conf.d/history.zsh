#!/usr/bin/env zsh

# History helpers and lightweight backup

# Backup zsh history weekly; keep last 10 backups
if [[ ! -d "$HOME/.history_backup" ]]; then
  mkdir -p "$HOME/.history_backup"
fi

if [[ ! -f "$HOME/.history_backup/last_backup" ]] || \
   [[ $(find "$HOME/.history_backup/last_backup" -mtime +7 2>/dev/null) ]]; then
  cp "$HISTFILE" "$HOME/.history_backup/zsh_history_$(date +%Y%m%d_%H%M%S)" 2>/dev/null || true
  touch "$HOME/.history_backup/last_backup"
  ls -t "$HOME/.history_backup"/zsh_history_* 2>/dev/null | tail -n +11 | xargs rm -f 2>/dev/null || true
fi

hunalias() {
  # Prevent alias expansion from breaking function definitions
  unalias h 2>/dev/null || true
  unalias history 2>/dev/null || true
}
hunalias

h() {
  if [[ -z "$1" ]]; then
    history 1
  else
    history 1 | grep -i "$@"
  fi
}

hi() {
  local selected=$(history -n 1 | tac | awk '!seen[$0]++' | \
    fzf --preview 'echo {}' --preview-window=up:3:wrap \
      --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
      --header 'Press CTRL-Y to copy command')
  if [[ -n "$selected" ]]; then
    print -z "$selected"
  fi
}

