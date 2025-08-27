set shell := ["bash", "-c"]

bootstrap:
	./install -y

brew:
	brew bundle --file=Brewfile

# Lint shell scripts and zsh configs if tools are available
lint:
	set -euo pipefail; \
	if command -v shellcheck >/dev/null; then \
	  echo "Running shellcheck..."; \
	  targets=(install); \
	  for f in config/terminal/tmux/scripts/* scripts/*; do \
	    [[ -e "$f" ]] || continue; \
	    [[ -f "$f" ]] && targets+=("$f"); \
	  done; \
	  shellcheck -S style "${targets[@]}" || true; \
	else \
	  echo "shellcheck not installed; skipping"; \
	fi; \
	if command -v zsh >/dev/null; then \
	  echo "Checking zsh syntax..."; \
	  zsh -n config/shell/zshrc || true; \
	  for f in config/shell/conf.d/*.zsh; do \
	    [[ -f "$f" ]] || continue; \
	    zsh -n "$f" || true; \
	  done; \
	else \
	  echo "zsh not installed; skipping zshrc syntax check"; \
	fi
