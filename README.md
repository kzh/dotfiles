# dotfiles

These dotfiles are mostly managed using Codex CLI.

## Highlights

- Shell: ZSH + Oh My Zsh, modular `conf.d/`, fast startup, rich completions, Atuin history, Zoxide jumping.
- Terminal: Tmux with Rose Pine Dawn theme, sensible keybindings, TPM + resurrect/continuum.
- Editor: Lazy-managed Neovim (LSP, Treesitter, Telescope, Gitsigns, conform.nvim, nvim-lint, DAP).
- Extras: Ghostty config (Rose Pine Dawn), `eza` theme, Git config with delta.

## Install

Prereqs: macOS or Linux, Git; Homebrew for macOS.

Quick start

```bash
git clone https://github.com/kzh/dotfiles.git ~/Code/Repos/github.com/kzh/dotfiles
cd ~/Code/Repos/github.com/kzh/dotfiles && ./install
```

Non-interactive

- `./install -y` (or `./install --yes`)
- With Just: `just bootstrap`
- Env alternative: `DOTFILES_YES=1 ./install` (legacy `YES=1` and `NONINTERACTIVE=1` also work)

What the installer does

- Backs up existing files to `~/.dotfiles_backup/<timestamp>`
- Symlinks configs into `$HOME` and `$XDG_CONFIG_HOME`
- Optionally installs Homebrew packages and macOS defaults
- Optionally sets up Oh My Zsh and Tmux plugins (TPM)

Post‑install

- Restart shell or `source ~/.zshrc`
- In tmux: press `Ctrl-b` then `I` to install plugins
- In Neovim: run `:Lazy sync` once

## Layout

```
dotfiles/
├── install
├── Brewfile
├── Justfile
├── config/
│   ├── shell/                # zshrc, conf.d/, completions/_*
│   ├── terminal/             # tmux.conf, tmux/scripts/, ghostty/config
│   ├── editors/nvim/         # Lazy-managed Neovim
│   ├── git/                  # gitconfig, gitignore_global
│   └── eza/                  # theme.yml
└── scripts/
```

## Just tasks

- `just bootstrap` — non-interactive install (`./install -y`)
- `just brew` — install packages from Brewfile
- `just lint` — shellcheck + `zsh -n` if available
