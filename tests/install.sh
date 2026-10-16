#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
test_dir="$(mktemp -d "${TMPDIR:-/tmp}/dotfiles-install.XXXXXX")"
trap 'rm -rf -- "$test_dir"' EXIT
test_home="$test_dir/home"
mkdir -p "$test_home/.config/nvim" "$test_home/.config/atuin" "$test_dir/outside"
printf 'original entrypoint\n' > "$test_home/.zshrc"
printf 'old editor settings\n' > "$test_home/.config/nvim/init.lua"
ln -s "$test_dir/outside/missing" "$test_home/.gitignore_global"
printf 'invert = false\n[theme]\nname = "existing-theme"\n' > "$test_home/.config/atuin/config.toml"
cp "$test_home/.config/atuin/config.toml" "$test_dir/atuin-expected"

run_install() {
    env -u ATUIN_CONFIG_DIR HOME="$test_home" XDG_CONFIG_HOME="${test_config:-$test_home/.config}" /bin/bash "$repo_dir/install" "$@" >/dev/null
}
fail() { printf 'FAIL: %s\n' "$*" >&2; exit 1; }

printf 'n\n' | run_install
[[ "$(cat "$test_home/.zshrc")" == 'original entrypoint' ]] || fail 'declining changed files'
run_install -y
[[ -f "$test_home/.zshrc" && ! -L "$test_home/.zshrc" ]] || fail 'entrypoint must be a regular file'
[[ "$(readlink "$test_home/.config/nvim")" == "$repo_dir/modules/editor/nvim" ]] || fail 'editor link missing'
cmp -s "$test_dir/atuin-expected" "$test_home/.config/atuin/config.toml" || fail 'install changed existing Atuin configuration'
backups=("$test_home/.dotfiles_backup/"*)
[[ "$(cat "${backups[0]}/.zshrc")" == 'original entrypoint' ]] || fail 'original file not backed up'
[[ "$(cat "${backups[0]}/.config/nvim/init.lua")" == 'old editor settings' ]] || fail 'directory not backed up'
[[ "$(readlink "${backups[0]}/.gitignore_global")" == "$test_dir/outside/missing" ]] || fail 'symlink not preserved'

printf 'export EDITOR=local-editor\n' > "$test_home/.config/zsh/local.zsh"
printf '[user]\nname = Local User\n' > "$test_home/.gitconfig.local"
cp "$test_home/.config/zsh/local.zsh" "$test_dir/zsh-expected"
cp "$test_home/.gitconfig.local" "$test_dir/git-expected"
run_install --yes
cmp -s "$test_dir/zsh-expected" "$test_home/.config/zsh/local.zsh" || fail 'rerun changed shell overrides'
cmp -s "$test_dir/git-expected" "$test_home/.gitconfig.local" || fail 'rerun changed Git overrides'
cmp -s "$test_dir/atuin-expected" "$test_home/.config/atuin/config.toml" || fail 'rerun changed Atuin configuration'
backups=("$test_home/.dotfiles_backup/"*)
[[ ${#backups[@]} -eq 1 ]] || fail 'unchanged rerun created more backups'

# A symlinked config parent must not allow writes outside the home directory.
ln -s "$test_dir/outside" "$test_home/escape"
if env HOME="$test_home" XDG_CONFIG_HOME="$test_home/escape/new" \
    /bin/bash "$repo_dir/install" -y >/dev/null 2>&1; then
    fail 'installer accepted a parent outside HOME'
fi
[[ ! -e "$test_dir/outside/new" ]] || fail 'installer wrote outside HOME'

# The minimal profile installs only terminal configuration, including with a
# custom XDG directory containing spaces.
test_home="$test_dir/minimal-home"
test_config="$test_home/custom config"
mkdir -p "$test_home"
run_install --minimal -y
for file in .zshrc .zprofile; do
    [[ -f "$test_home/$file" && ! -L "$test_home/$file" ]] || fail "minimal entrypoint missing: $file"
done
for file in zshrc zprofile aliases.zsh; do
    [[ "$(readlink "$test_config/zsh/$file")" == "$repo_dir/modules/shell/zsh/$file" ]] || fail "minimal Zsh link missing: $file"
done
[[ -f "$test_config/zsh/local.zsh" && ! -L "$test_config/zsh/local.zsh" ]] || fail 'minimal shell overrides missing'
[[ "$(readlink "$test_home/.tmux.conf")" == "$repo_dir/home/.tmux.conf" ]] || fail 'minimal tmux entrypoint missing'
[[ "$(readlink "$test_config/tmux")" == "$repo_dir/modules/terminal/tmux" ]] || fail 'minimal tmux link missing'
[[ "$(readlink "$test_config/nvim")" == "$repo_dir/modules/editor/nvim" ]] || fail 'minimal editor link missing'
[[ "$(readlink "$test_home/Library/Application Support/eza/theme.yml")" == "$repo_dir/modules/cli/eza/theme.yml" ]] || fail 'minimal eza theme missing'
[[ -f "$test_config/atuin/config.toml" && ! -L "$test_config/atuin/config.toml" ]] || fail 'minimal Atuin config must be a regular file'
cmp -s "$repo_dir/modules/cli/atuin/config.toml" "$test_config/atuin/config.toml" || fail 'minimal Atuin defaults missing'

unselected=(
    "$test_home/.gitconfig"
    "$test_home/.gitignore_global"
    "$test_home/.gitconfig.local"
    "$test_config/uv/uv.toml"
    "$test_home/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
)
for file in "${unselected[@]}"; do
    [[ ! -e "$file" && ! -L "$file" ]] || fail "minimal installed unrelated configuration: $file"
    mkdir -p "$(dirname "$file")"
    printf 'existing configuration\n' > "$file"
done
printf 'export EDITOR=local-editor\n' > "$test_config/zsh/local.zsh"
cp "$test_dir/atuin-expected" "$test_config/atuin/config.toml"
run_install -y --minimal
for file in "${unselected[@]}"; do
    [[ ! -L "$file" && "$(cat "$file")" == 'existing configuration' ]] || fail "minimal changed unrelated configuration: $file"
done
[[ "$(cat "$test_config/zsh/local.zsh")" == 'export EDITOR=local-editor' ]] || fail 'minimal rerun changed shell overrides'
cmp -s "$test_dir/atuin-expected" "$test_config/atuin/config.toml" || fail 'minimal rerun changed Atuin configuration'
[[ ! -d "$test_home/.dotfiles_backup" ]] || fail 'minimal rerun created backups'

printf 'Installer: full/minimal profiles, backups, local overrides, reruns, and path safety passed.\n'
