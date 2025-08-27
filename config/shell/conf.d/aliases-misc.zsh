#!/usr/bin/env zsh
alias cl="clear && ls"
alias crb="cargo run --bin"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"


unalias grep 2>/dev/null || true
alias psa="ps aux | grep -F -v grep | grep -F"
alias killp='killport'
unalias ports 2>/dev/null || true
ports() {
  local cmd
  if command -v lsof >/dev/null 2>&1; then
    cmd='lsof -i -P -n | grep LISTEN'
  else
    cmd='netstat -an | grep LISTEN'
  fi
  eval "$cmd" 2>/dev/null || {
    echo "(hint) ports may require elevated privileges for full results" >&2
    return 1
  }
}
alias ip="curl -fsSL https://ifconfig.me"

alias tmp='temporal'
command -v claude >/dev/null 2>&1 && alias claude='claude --dangerously-skip-permissions'
command -v cursor-agent >/dev/null 2>&1 && alias csr='cursor-agent'
command -v codex >/dev/null 2>&1 && alias codex='codex --yolo --search'
