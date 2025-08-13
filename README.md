# dotfiles

These dotfiles are mostly generated using Claude Code and OpenAI Codex CLI.

## Features

- **Shell**: Optimized ZSH configuration with Oh My Zsh and custom plugins
- **Terminal**: Tmux with Rose Pine Dawn theme and enhanced keybindings
- **Terminal Emulator**: Ghostty configuration with Rose Pine Dawn theme
- **Editor**: Neovim setup based on kickstart.nvim with LSP, treesitter, and modern plugins
- **Version Control**: Git configuration with sensible defaults and delta integration
- **Package Management**: Organized Brewfile for easy software installation
- **Installation**: Robust install script with backup functionality

## What's Included

### Shell (ZSH)

- Fast startup with lazy loading for heavy tools (nvm, gcloud)
- Custom aliases and functions for productivity
- Modular configuration via `conf.d/` directory (symlinked to `~/.config/zsh/conf.d/`)
- Intelligent completions with fzf-tab
- 35+ pre-configured ZSH completions for modern CLI tools
- Command history search with Atuin
- Directory jumping with Zoxide
- Directory bookmarks system with fzf integration
- Rose Pine Dawn theme for FZF

### Terminal (Tmux)

- Rose Pine Dawn theme for consistent aesthetics
- Vim-style navigation and keybindings
- Session persistence with tmux-resurrect and continuum
- Enhanced copy/paste functionality
- Quick pane/window navigation with Alt keys (Alt+1 → window 0, etc.)
- Integration with Neovim via vim-tmux-navigator
- Mouse scroll support in pagers (git diff, less, etc.)

### Editor (Neovim)

- LSP support for multiple languages (Go, Rust, Python, JS/TS, etc.)
- Telescope fuzzy finder for files, grep, and more
- Git integration with Gitsigns and Fugitive
- Auto-formatting and linting with conform.nvim
- Snippet support with LuaSnip
- Rose Pine Dawn colorscheme
- Debugging support with nvim-dap

### Homebrew Packages

Organized into: development tools, programming languages, databases/cloud, terminal utilities, and GUI apps.

## Installation

### Prerequisites

- macOS (primary support) or Linux
- Git
- [Homebrew](https://brew.sh) (for macOS)
- Latest `less` for mouse scroll support (`brew install less`)

### Quick Start

```bash
git clone https://github.com/kzh/dotfiles.git ~/Code/Repos/github.com/kzh/dotfiles
cd ~/Code/Repos/github.com/kzh/dotfiles && ./install
```

The install script will check dependencies, backup existing configs, create symlinks, optionally install Homebrew packages, configure macOS defaults, and set up Oh My Zsh and Tmux plugins.

### Non-Interactive Install

- Use environment flags to auto-confirm prompts: `YES=1 DOTFILES_YES=1 NONINTERACTIVE=1 ./install`
- Or with Just (recommended): `just bootstrap`

### Post-Install

- Restart your terminal or run `source ~/.zshrc`
- In tmux, press `Ctrl-b` then `I` to install plugins
- In Neovim, run `:Lazy sync` once to install plugins
- If your default shell isn’t zsh, set it: `chsh -s "$(which zsh)"`

### Custom Aliases

#### Navigation

- `j` - Jump to directory (via Zoxide)
- `..`, `...`, `....` - Go up 1, 2, 3 directories
- `-` - Go to previous directory

#### Directory Bookmarks

- `bm [name] [path]` - Bookmark directory
- `bmg [name]` / `b` - Go to bookmark (interactive with fzf)
- `bml` / `bl` - List bookmarks
- `bmd <name>` / `bd` - Delete bookmark

#### Git

- `gs` - Status (short)
- `gco` - Checkout
- `gcm` - Commit
- `gsd` - Status + diff
- `lg` - LazyGit
- `cdr` - Jump to git repository root

#### Kubernetes

- `k` - kubectl
- `kp` - Get pods
- `kl` / `klf` - Get / follow logs
- `ke` - Exec into pod

#### Docker

- `dprune` - System cleanup
- `dstop` / `drm` - Stop / remove all containers

#### Tools

- `claude` - Claude Code with permissions bypass

### Key Bindings

#### Tmux (prefix: `Ctrl-b`)

- `|` - Split window horizontally
- `-` - Split window vertically
- `h/j/k/l` - Navigate panes (Vim-style)
- `H/J/K/L` - Resize panes
- `r` - Reload configuration
- `Alt+1` - Switch to window 0 (first window)
- `Alt+2-9` - Switch to windows 1-8
- `Alt+0` - Switch to window 9 (tenth window)
- `Alt+h/l` - Previous/next window

#### Neovim

- `<Space>` - Leader key
- `<leader>sf` - Search files
- `<leader>sg` - Live grep
- `<leader>sh` - Search help
- `<leader><leader>` - Switch buffers
- `gd` - Go to definition
- `gr` - Go to references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

## 📁 Directory Structure

```
dotfiles/
├── Brewfile
├── Justfile
├── LICENSE
├── README.md
├── install
├── scripts/
└── config/
    ├── editors/nvim/
    │   ├── init.lua
    │   ├── lua/
    │   └── snippets/
    ├── git/
    │   ├── gitconfig
    │   └── gitignore_global
    ├── shell/
    │   ├── completions/       # 35+ CLI tools
    │   └── zshrc
    └── terminal/
        ├── ghostty/config
        ├── tmux/scripts/
        └── tmux.conf
```

## Justfile Tasks

- `just bootstrap`: Non-interactive install (sets YES/DOTFILES_YES/NONINTERACTIVE)
- `just brew`: Install Homebrew packages from `Brewfile`
- `just lint`: Lint shell scripts and check zshrc syntax (if tools are installed)
