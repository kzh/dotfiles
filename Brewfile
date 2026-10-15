# Curated fresh-machine setup. Homebrew resolves transitive library dependencies.
# Third-party taps
tap "hashicorp/tap"
tap "jaxxstorm/tap"
tap "oven-sh/bun"
tap "pulumi/tap"
tap "twitchdev/twitch"
tap "xwmx/taps"

# Shell and everyday CLI
brew "atuin"
brew "bat"
brew "coreutils"
brew "direnv"
brew "eza"
brew "fastfetch"
brew "fd"
brew "fzf"
brew "jq"
brew "ripgrep"
brew "tmux"
brew "tree"
brew "unzip"
brew "wget"
brew "xwmx/taps/nb"
brew "yq"
brew "zoxide"

# Git and source control
brew "gh"
brew "git"
brew "git-delta"
brew "git-lfs"
brew "lazygit"

# Languages, editors, and build tools
brew "autoconf"
brew "ccache"
brew "cmake"
brew "fnm"
brew "go"
brew "just"
brew "make"
brew "neovim"
brew "oven-sh/bun/bun"
brew "pkgconf"
brew "pnpm"
brew "rustup"
brew "uv"

# Code quality and generators
brew "biome"
brew "buf"
brew "protobuf"
brew "protoc-gen-go"
brew "protoc-gen-go-grpc"
brew "ruff"
brew "shellcheck"

# Containers, Kubernetes, and infrastructure
brew "caddy"
brew "cloudflare-wrangler"
brew "cloudflared"
brew "dive"
brew "docker-buildx"
brew "hashicorp/tap/terraform"
brew "hashicorp/tap/vault"
brew "helm"
brew "jaxxstorm/tap/tscli"
brew "kubectx"
brew "kubernetes-cli"
brew "lima"
brew "pulumi"
brew "pulumi/tap/crd2pulumi"
brew "pulumi/tap/esc"
brew "qemu"
brew "step"
brew "temporal"
brew "terragrunt"

# Databases and data tools
brew "duckdb"
brew "jupyterlab"
# Retain 17 for its existing data directory; 18 provides the default CLI.
brew "postgresql@17", restart_service: :changed
brew "postgresql@18", link: true
brew "redis", restart_service: :changed
brew "sqlite"

# Network, storage, and monitoring
brew "btop"
brew "macmon"
brew "node_exporter"
brew "rclone"
brew "smartmontools"
brew "wakeonlan"
brew "wireshark"

# Media and other utilities
brew "ffmpeg"
brew "hugo"
brew "imagemagick"
brew "pandoc"
brew "twitchdev/twitch/twitch-cli"

# macOS applications and fonts
cask "1password-cli"
cask "clickhouse"
cask "font-jetbrains-mono-nerd-font"
cask "ghostty@tip"
cask "mactex"
cask "ngrok"
cask "orbstack"

# Go developer tools
go "github.com/go-delve/delve/cmd/dlv"
go "github.com/kisielk/errcheck"
go "github.com/kzh/infra-faust/cmd/mx"
go "github.com/mgechev/revive"
go "golang.org/x/tools/cmd/goimports"
go "golang.org/x/tools/cmd/stringer"
go "golang.org/x/tools/gopls"
go "honnef.co/go/tools/cmd/staticcheck"

# Rust developer tools
cargo "cargo-bloat"
cargo "cargo-edit"
cargo "sqlx-cli"
cargo "stitch"
cargo "tokio-console"
