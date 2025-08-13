set shell := ["bash", "-c"]

bootstrap:
	YES=1 DOTFILES_YES=1 NONINTERACTIVE=1 ./install

brew:
	brew bundle --file=Brewfile

# Lint shell scripts and zsh configs if tools are available
lint:
	set -euo pipefail; \
	if command -v shellcheck >/dev/null; then \
	  echo "Running shellcheck..."; \
	  shellcheck -S style install || true; \
	else \
	  echo "shellcheck not installed; skipping"; \
	fi; \
	if command -v zsh >/dev/null; then \
	  echo "Checking zshrc syntax..."; \
	  zsh -n config/shell/zshrc || true; \
	else \
	  echo "zsh not installed; skipping zshrc syntax check"; \
	fi
