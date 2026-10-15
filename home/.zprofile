# Managed by kzh/dotfiles.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -r "$XDG_CONFIG_HOME/zsh/zprofile" ]]; then
  source "$XDG_CONFIG_HOME/zsh/zprofile"
fi
[[ -r "$HOME/.zprofile.local" ]] && source "$HOME/.zprofile.local"
