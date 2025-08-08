#!/usr/bin/env zsh

# Misc productivity aliases
alias cl="clear && ls"
alias crb="cargo run --bin"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"
alias so="source"
alias psa="ps aux | grep"
alias killp='killport'
alias ports="lsof -i -P -n | grep LISTEN 2>/dev/null || sudo lsof -i -P -n | grep LISTEN"
alias ip="curl -s ifconfig.me"
alias temporal='temporal --env dev'
alias claude='claude --dangerously-skip-permissions'
alias csr='cursor-agent'
