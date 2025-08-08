#!/usr/bin/env zsh

# General aliases and tool-aware replacements

# cat -> bat, if available
if command -v bat >/dev/null 2>&1; then
  alias cat="bat"
fi

# ls family -> eza, if available
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza -la --icons --group-directories-first"
  alias la="eza -a --icons --group-directories-first"
  alias lt="eza --tree --icons"
  alias llt="eza -la --tree --icons --level=2"
else
  alias ll="ls -la"
  alias la="ls -a"
fi

# ripgrep defaults
if command -v rg >/dev/null 2>&1; then
  alias rg="rg -S"
fi

# nvim shortcuts
if command -v nvim >/dev/null 2>&1; then
  alias v="nvim"
  alias vim="nvim"
  alias vi="nvim"
fi

# dotfiles helpers
alias cfg="v ~/.zshrc && source ~/.zshrc"
alias src="source ~/.zshrc"
alias vimrc="v $DOTFILES/config/editors/nvim/init.lua"

# misc helpers
alias hg='history | grep'
alias path='echo -e ${PATH//:/\n}'
alias reload='exec $SHELL -l'
alias du='du -h'
alias df='df -h'
alias free='free -h'

# prefer zoxide's z as j shortcut if available
command -v zoxide >/dev/null 2>&1 && alias j='z'

