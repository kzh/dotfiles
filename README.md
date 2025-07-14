# dotfiles

Development environment configuration for macOS with Neovim, Tmux, and Zsh.

## Quick Start

```bash
git clone https://github.com/kzh/dotfiles.git
cd dotfiles
./install.sh
```

## Installation

**Prerequisites**: macOS, Homebrew, Git

**Options**:
- `./install.sh` - Full installation
- `./install.sh --no-packages` - Skip Homebrew packages
- `./install.sh --no-dotfiles` - Skip configuration links
- `./install.sh --no-tmux-plugins` - Skip tmux plugins
- `./install.sh --no-rust` - Skip Rust toolchain

The installer backs up existing configurations as `.backup` files.

## Components

- **[Neovim](docs/neovim.md)** - IDE-like editor with LSP support
- **[Tmux](docs/tmux.md)** - Terminal multiplexer with session management
- **[Zsh](docs/zsh.md)** - Shell with modern CLI tools and productivity features

## Structure

```
config/
├── editors/nvim/      # Neovim configuration
├── shell/zshrc        # Zsh configuration
└── terminal/tmux.conf # Tmux configuration
docs/                  # Component documentation
Brewfile              # macOS packages
install.sh            # Installation script
```

## Post-Installation

1. Tmux: Run tmux and press `Ctrl-a I` to install plugins
2. Rust: Run `source ~/.cargo/env`
3. Restart terminal or run `source ~/.zshrc`

## License

MIT
