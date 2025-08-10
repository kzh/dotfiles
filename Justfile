set shell := ["bash", "-c"]

bootstrap:
	YES=1 DOTFILES_YES=1 NONINTERACTIVE=1 ./install

brew:
	brew bundle --file=Brewfile
