#!/usr/bin/env zsh
# Configure Charmbracelet glow to use the Rosé Pine Dawn Glamour style.
# Prefer XDG path, fall back to the style inside this repo, then to a built-in.

local _xdg_glow_style="${XDG_CONFIG_HOME:-$HOME/.config}/glow/rose-pine-dawn.json"

# Resolve path to this conf file, even when sourced.
local _this_dir
_this_dir="${${(%):-%N}:A:h}"
# dotfiles repo root (conf.d/ is at config/shell/conf.d)
local _repo_root="${_this_dir:h:h:h}"
local _repo_style="${_repo_root}/config/terminal/glow/rose-pine-dawn.json"

if [[ -f "${_xdg_glow_style}" ]]; then
  export GLAMOUR_STYLE="${_xdg_glow_style}"
elif [[ -f "${_repo_style}" ]]; then
  export GLAMOUR_STYLE="${_repo_style}"
else
  # Final fallback to a built-in light style
  export GLAMOUR_STYLE="light"
fi

# If you prefer a fixed width in non-TUI mode, uncomment:
# export GLOW_WIDTH=0  # 0 = auto width
