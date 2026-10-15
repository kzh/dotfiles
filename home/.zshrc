# Managed by kzh/dotfiles. Local settings belong in $XDG_CONFIG_HOME/zsh/local.zsh.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -r "$XDG_CONFIG_HOME/zsh/zshrc" ]]; then
  source "$XDG_CONFIG_HOME/zsh/zshrc"
else
  print -u2 -- "dotfiles: missing $XDG_CONFIG_HOME/zsh/zshrc; rerun the installer"
fi
