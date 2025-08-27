# Repository Guidelines

These guidelines help contributors (human or agent) keep this dotfiles repo safe, consistent, and easy to use.

## Project Structure & Module Organization
- `install`: Bash installer that backs up existing files to `~/.dotfiles_backup/<timestamp>`, then symlinks configs into `$HOME`.
- `config/`: Source of truth for configs.
  - `shell/` (`zshrc`, `conf.d/*.zsh`, `completions/_*`)
  - `terminal/` (`tmux.conf`, `tmux/scripts/`, `ghostty/config`)
  - `editors/nvim/` (Lazy-managed Neovim setup)
  - `git/` (`gitconfig`, `gitignore_global`), `eza/theme.yml`
- `Brewfile`: Homebrew apps and CLIs.
- `Justfile`: Common tasks; prefer `just` where possible.
- `scripts/`: Small helpers used by configs.

## Build, Test, and Development Commands
- `./install`: Interactive setup; creates backups, links configs, optional macOS defaults.
- `./install -y`: Non-interactive mode for automation (also `DOTFILES_YES=1 ./install`).
- `just bootstrap`: Non-interactive install via `install` (recommended).
- `just brew`: Install packages from `Brewfile`.
- `just lint`: Shell lint + zsh syntax check (requires `shellcheck`).

## Coding Style & Naming Conventions
- Shell scripts: `#!/usr/bin/env bash` + `set -euo pipefail`; prefer small, composable functions (`snake_case`).
- ZSH: Put additions in `config/shell/conf.d/*.zsh`; completions as `config/shell/completions/_tool`.
- Indentation: spaces; keep lines under ~100 chars; quote variables; avoid `sudo` in repo scripts.
- Run `just lint` and fix `shellcheck` warnings.

## Testing Guidelines
- No unit tests; validate by running `just lint` and starting a fresh shell (`zsh -n config/shell/zshrc`).
- For installer changes, test on macOS with a new user or a clean `$HOME` and confirm backups are created and links resolve.

## Commit & Pull Request Guidelines
- Use Conventional Commits: e.g., `feat(shell): add bookmarks`, `refactor(zsh,tmux): improve keybindings` (see git history).
- PRs include: concise summary, rationale, affected paths, `just lint` output, and manual test notes (screenshots for tmux/ghostty changes helpful).
- If adding tools, update `Brewfile` and README sections accordingly.

## Security & Configuration Tips
- Never commit secrets, tokens, or machine-specific credentials.
- The installer links configs under `$HOME`; optional steps may install Homebrew packages and set macOS defaults with explicit confirmation. Avoid other system-wide changes.
- When in doubt, prefer new files in `conf.d/` over editing `zshrc` directly.
