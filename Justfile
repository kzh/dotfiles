set shell := ["bash", "-c"]

bootstrap:
	./install -y

brew:
	brew bundle --file=Brewfile

# One-time shell and tmux plugin setup
plugins:
	bash bin/setup-plugins

# Syntax, configuration loading, and installer safety
check:
	bash bin/check
