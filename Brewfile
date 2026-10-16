# Curated fresh-machine setup. Homebrew resolves transitive library dependencies.
# Share terminal tools with the minimal setup.
minimal_brewfile = File.join(__dir__, "Brewfile.minimal")
instance_eval(File.read(minimal_brewfile), minimal_brewfile)

# Third-party taps
tap "oven-sh/bun"
tap "pulumi/tap"
tap "xwmx/taps"

# Notes
brew "xwmx/taps/nb"

# Git and source control
brew "gh"
brew "git-delta"
brew "git-lfs"

# Languages, editors, and build tools
brew "fnm"
brew "go"
brew "oven-sh/bun/bun"
brew "pnpm"
brew "rustup"
brew "shellcheck"
brew "uv"

# Containers, Kubernetes, and infrastructure
brew "kubectx"
brew "kubernetes-cli"
brew "lima"
brew "pulumi"
brew "pulumi/tap/esc"
brew "qemu"

# Network, storage, and monitoring
brew "btop"
brew "macmon"
brew "node_exporter"
brew "smartmontools"
brew "wakeonlan"

# Media and other utilities
brew "ffmpeg"
brew "pandoc"

# macOS applications and fonts
cask "1password-cli"
cask "clickhouse"
cask "ghostty@tip"
cask "orbstack"

# Rust developer tools
cargo "cargo-bloat"
cargo "tokio-console"
