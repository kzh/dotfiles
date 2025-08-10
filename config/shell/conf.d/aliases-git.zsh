#!/usr/bin/env zsh
alias gs="git status -sb"
alias gcm="git commit"
alias gsd="git status && git diff"
alias gst="git stash"
alias gpu="git push -u origin HEAD"
alias gcb="git checkout -b"
alias grhh="git reset --hard HEAD"
alias gcleanf="git clean -fd"
alias gpr="gh pr create"
alias gprs="gh pr list"
alias gprv="gh pr view"
alias glogg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

command -v lazygit >/dev/null 2>&1 && alias lg='lazygit'

