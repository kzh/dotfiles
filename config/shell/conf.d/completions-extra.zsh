#!/usr/bin/env zsh
if command -v compdef >/dev/null 2>&1; then
  compdef k=kubectl
  compdef lg=git
  compdef v=nvim
  compdef gs=git
  compdef gco=git

  compdef _tailscale tailscale
  compdef ts=tailscale
  compdef _op op

  autoload -U +X bashcompinit && bashcompinit
  command -v terraform >/dev/null 2>&1 && complete -o nospace -C "$(command -v terraform)" terraform
  command -v vault >/dev/null 2>&1 && complete -o nospace -C "$(command -v vault)" vault
  command -v terragrunt >/dev/null 2>&1 && complete -o nospace -C "$(command -v terragrunt)" terragrunt
fi

