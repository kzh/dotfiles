# A small set of everyday shortcuts. Standard commands keep their usual behavior.
alias v=nvim vim=nvim vi=nvim
alias ..='cd ..' ...='cd ../..'
alias reload='exec zsh -l'
alias cfg='$EDITOR "$DOTFILES/modules/shell/zsh/zshrc"'
alias ll='eza -la --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias gs='git status -sb'
alias lg=lazygit
alias ta='tmux attach' tls='tmux ls' tn='tmux new -s'
alias k=kubectl kctx=kubectx kns=kubens
alias j=z
alias sysinfo=fastfetch

mkcd() {
  [[ $# == 1 ]] || { print -u2 'Usage: mkcd directory'; return 1; }
  mkdir -p -- "$1" && builtin cd -- "$1"
}

cdr() {
  local root
  root=$(git rev-parse --show-toplevel) && builtin cd -- "$root"
}

if [[ -x /Applications/Tailscale.app/Contents/MacOS/Tailscale ]]; then
  tailscale() { /Applications/Tailscale.app/Contents/MacOS/Tailscale "$@"; }
fi
alias ts=tailscale tssh='tailscale ssh'

# Work connection: credentials stay in Pulumi ESC.
ch() {
  local esc_json ch_host ch_port ch_user ch_password
  esc_json="$(pulumi env open infra/clickhouse --format json)" || return 1
  ch_host="$(printf '%s' "$esc_json" | jq -r '.environmentVariables.CLICKHOUSE_HOST')"
  ch_port="$(printf '%s' "$esc_json" | jq -r '.environmentVariables.CLICKHOUSE_PORT')"
  ch_user="$(printf '%s' "$esc_json" | jq -r '.environmentVariables.CLICKHOUSE_USER')"
  ch_password="$(printf '%s' "$esc_json" | jq -r '.environmentVariables.CLICKHOUSE_PASSWORD')"
  if [[ -z "$ch_host" || -z "$ch_port" || -z "$ch_user" || -z "$ch_password" || "$ch_host" == null || "$ch_port" == null || "$ch_user" == null || "$ch_password" == null ]]; then
    print -u2 'failed to resolve ClickHouse connection from ESC env infra/clickhouse'
    return 1
  fi
  clickhouse client --host "$ch_host" --port "$ch_port" --user "$ch_user" --password "$ch_password" "$@"
}
