#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
test_dir="$(mktemp -d "${TMPDIR:-/tmp}/dotfiles-install.XXXXXX")"
trap 'rm -rf -- "$test_dir"' EXIT
test_home="$test_dir/home"
mkdir -p "$test_home/.config/nvim" "$test_dir/outside"
printf 'original entrypoint\n' > "$test_home/.zshrc"
printf 'old editor settings\n' > "$test_home/.config/nvim/init.lua"
ln -s "$test_dir/outside/missing" "$test_home/.gitignore_global"

run_install() {
    env HOME="$test_home" XDG_CONFIG_HOME="$test_home/.config" /bin/bash "$repo_dir/install" "$@" >/dev/null
}
fail() { printf 'FAIL: %s\n' "$*" >&2; exit 1; }

printf 'n\n' | run_install
[[ "$(cat "$test_home/.zshrc")" == 'original entrypoint' ]] || fail 'declining changed files'
run_install -y
[[ -f "$test_home/.zshrc" && ! -L "$test_home/.zshrc" ]] || fail 'entrypoint must be a regular file'
[[ "$(readlink "$test_home/.config/nvim")" == "$repo_dir/modules/editor/nvim" ]] || fail 'editor link missing'
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
backups=("$test_home/.dotfiles_backup/"*)
[[ ${#backups[@]} -eq 1 ]] || fail 'unchanged rerun created more backups'

# A symlinked config parent must not allow writes outside the home directory.
ln -s "$test_dir/outside" "$test_home/escape"
if env HOME="$test_home" XDG_CONFIG_HOME="$test_home/escape/new" \
    /bin/bash "$repo_dir/install" -y >/dev/null 2>&1; then
    fail 'installer accepted a parent outside HOME'
fi
[[ ! -e "$test_dir/outside/new" ]] || fail 'installer wrote outside HOME'

printf 'Installer: backups, local overrides, reruns, and path safety passed.\n'
