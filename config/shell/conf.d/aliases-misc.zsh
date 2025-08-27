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
  eval "$cmd" 2>/dev/null || eval "sudo $cmd"
}
alias ip="curl -s ifconfig.me"

alias temporal='temporal'
alias tmp='temporal'
alias claude='claude --dangerously-skip-permissions'
alias csr='cursor-agent'
alias codex='codex --yolo --search'
