#!/usr/bin/env zsh
if command -v bat >/dev/null 2>&1; then
  alias cat="bat"
fi

if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza -la --icons --group-directories-first"
  alias la="eza -a --icons --group-directories-first"
  alias lt="eza -laT --icons -L 4 --git-ignore -I node_modules -I dist -I target"
else
  alias ll="ls -la"
  alias la="ls -a"
fi

if command -v rg >/dev/null 2>&1; then
  alias rg="rg -S"
fi

if command -v nvim >/dev/null 2>&1; then
  alias v="nvim"
  alias vim="nvim"
  alias vi="nvim"
fi

alias cfg="$EDITOR ~/.zshrc && source ~/.zshrc"
alias src="source ~/.zshrc"
alias vimrc="$EDITOR $DOTFILES/config/editors/nvim/init.lua"


if command -v atuin >/dev/null 2>&1; then
  alias hg='atuin search -i'
else
  alias hg='history | grep'
fi
alias path='print -l $path'
alias reload='exec $SHELL -l'
alias du='du -h'
alias df='df -h'
command -v free >/dev/null 2>&1 && alias free='free -h'

command -v zoxide >/dev/null 2>&1 && alias j='z'
