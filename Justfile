set shell := ["bash", "-c"]

bootstrap:
	./install -y

# Zsh, tmux, Neovim, shell tools, and shell/tmux plugin setup (requires Homebrew)
minimal: brew-minimal bootstrap-minimal plugins

# Install only Zsh, tmux, Neovim, Atuin defaults, and eza configuration
bootstrap-minimal:
	./install --minimal -y

# Install only terminal and shell packages
brew-minimal:
	brew bundle --file=Brewfile.minimal

brew:
	PATH="$HOME/.cargo/bin:$(brew --prefix)/opt/rustup/bin:$PATH" brew bundle --file=Brewfile

# One-time shell and tmux plugin setup
plugins:
	bash bin/setup-plugins

# Syntax, configuration loading, and installer safety
check:
	bash bin/check
