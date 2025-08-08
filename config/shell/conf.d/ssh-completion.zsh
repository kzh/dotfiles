#!/usr/bin/env zsh

# Populate ssh/scp/rsync host completion from ~/.ssh/config and includes
_ssh_config_hosts() {
  local config_files=(~/.ssh/config)
  local h=()

  if [[ -r ~/.ssh/config ]]; then
    local includes=(${(f)"$(grep '^Include' ~/.ssh/config 2>/dev/null | awk '{print $2}' | sed "s|~|$HOME|g")"})
    config_files+=($includes)
  fi

  for f in $config_files; do
    if [[ -r "$f" ]]; then
      h+=(${${${(@M)${(f)"$(cat "$f" 2>/dev/null)"}:#Host *}#Host }:#*[*?]*})
    fi
  done

  h=(${(u)h})
  echo $h
}

local ssh_hosts=($(_ssh_config_hosts))
if [[ ${#ssh_hosts[@]} -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $ssh_hosts
  zstyle ':completion:*:scp:*' hosts $ssh_hosts
  zstyle ':completion:*:rsync:*' hosts $ssh_hosts
fi

