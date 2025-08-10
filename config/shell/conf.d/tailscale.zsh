#!/usr/bin/env zsh
if [[ "$OSTYPE" == "darwin"* ]] && [[ -x /Applications/Tailscale.app/Contents/MacOS/Tailscale ]]; then
  tailscale() { /Applications/Tailscale.app/Contents/MacOS/Tailscale "$@" }
  alias ts='tailscale'
  alias tssh='tailscale ssh'
elif command -v tailscale >/dev/null 2>&1; then
  alias ts='tailscale'
  alias tssh='tailscale ssh'
fi
