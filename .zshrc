# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kevin/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Go
export GOPATH="$HOME/Code/Go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$(go env GOPATH)/bin

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home)

# FZF
export FZF_DEFAULT_OPTS='
  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
  autojump
  fzf
  docker
  kubectl
)

source $ZSH/oh-my-zsh.sh

# direnv
eval "$(direnv hook zsh)"

# Google Cloud SDK
if [ -f '/Users/kevin/GCloud/path.zsh.inc' ]; then . '/Users/kevin/GCloud/path.zsh.inc'; fi
if [ -f '/Users/kevin/GCloud/completion.zsh.inc' ]; then . '/Users/kevin/GCloud/completion.zsh.inc'; fi

# :D
export EDITOR='vim'

alias v="vim"
alias clr="clear"
alias cfg="v ~/.zshrc && source ~/.zshrc"

alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias tsm="transmission-remote"

alias rg="rg -S"

galias() {
    alias $1="git $2"
}

galias gs   "status -sb"
galias gad  "add"
galias gbi  "bisect"
galias gbr  "branch"
galias gcm  "commit"
galias gcp  "cherry-pick"
galias gclo "clone"
galias gco  "checkout"
galias gdf  "diff"
galias ggc  "gc --prune=all"
galias glo  "-c core.pager='less -p \"^commit \"' log"
galias glop "-c core.pager='less -p \"^commit \"' log -p"
galias gmr  "merge"
galias gpl  "pull"
galias gps  "push"
galias grb  "rebase"
galias grs  "reset"
galias grsh "reset --hard"
galias grt  "remote"
galias grv  "revert"
galias gsh  "show"
galias gsm  "submodule"
galias gst  "-c core.pager='less -p ^stash' stash"
galias grbc "git rebase --continue"

alias ta="tmux -a"
alias tk="tmux kill-server"
alias tks="tmux kill-session -t"
