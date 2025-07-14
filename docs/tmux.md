# Tmux Quick Reference

Essential commands and hotkeys for terminal multiplexing.

## Prefix Key: `Ctrl-b`

All commands require the prefix key first (unless noted).

## Pane Management

| Key | Action | Description |
|-----|--------|-------------|
| `\|` | Split vertically | Creates vertical split |
| `-` | Split horizontally | Creates horizontal split |
| `h/j/k/l` | Navigate panes | Move between panes (vim-style) |
| `H/J/K/L` | Resize panes | Resize by 5 cells |
| `x` | Kill pane | Close current pane |
| `z` | Zoom pane | Toggle pane zoom |
| `!` | Break pane | Move pane to new window |

## Window Management

| Key | Action | Description |
|-----|--------|-------------|
| `c` | New window | Create new window |
| `n/p` | Next/Previous | Navigate windows |
| `0-9` | Select window | Jump to window number |
| `,` | Rename window | Rename current window |
| `&` | Kill window | Close current window |
| `w` | List windows | Show window list |

## Session Management

| Key | Action | Description |
|-----|--------|-------------|
| `d` | Detach | Detach from session |
| `s` | List sessions | Show session list |
| `$` | Rename session | Rename current session |
| `(/)` | Previous/Next | Switch sessions |

## Copy Mode (Vi-style)

| Key | Action | Description |
|-----|--------|-------------|
| `[` | Enter copy mode | Start selection mode |
| `Space` | Start selection | Begin selecting text |
| `Enter` | Copy selection | Copy and exit mode |
| `]` | Paste | Paste from buffer |
| `/` | Search forward | Search in copy mode |
| `?` | Search backward | Reverse search |

## Other Commands

| Key | Action | Description |
|-----|--------|-------------|
| `r` | Reload config | Source tmux.conf |
| `?` | List keys | Show all key bindings |
| `:` | Command prompt | Enter tmux command |
| `t` | Show time | Display clock |

## Plugin Commands

### Session Management (resurrect/continuum)
- `Ctrl-b Ctrl-s` - Save session
- `Ctrl-b Ctrl-r` - Restore session

### Plugin Manager (TPM)
- `Ctrl-b I` - Install plugins
- `Ctrl-b U` - Update plugins
- `Ctrl-b alt-u` - Remove plugins

### FZF Integration
- `Ctrl-b f` - Launch FZF menu
- Search windows, panes, commands, and more

### Text Extraction (Extrakto)
- `Ctrl-b tab` - Extract text from pane
- Copy URLs, paths, hashes, and other patterns

### Vim-Tmux Navigator
- `Ctrl-h/j/k/l` - Navigate between vim and tmux panes seamlessly

### File Operations
- `Ctrl-b o` - Open selected text as file/URL

### System Monitoring
- Battery, CPU, and network status in status bar
- Automatic updates based on system state

### Logging
- `Ctrl-b alt-p` - Start/stop logging pane
- `Ctrl-b alt-P` - Screen capture
- `Ctrl-b alt-c` - Save complete history

## Command Line Usage

### Sessions
```bash
tmux new -s name          # Create named session
tmux ls                   # List sessions
tmux attach -t name       # Attach to session
tmux kill-session -t name # Kill session
```

### Windows and Panes
```bash
tmux new-window -n name   # Create named window
tmux split-window -h      # Split horizontal
tmux split-window -v      # Split vertical
```

## Quick Workflows

### Start Development Session
```bash
tmux new -s project
# Ctrl-a c (new window for editor)
# Ctrl-a c (new window for servers)
# Ctrl-a c (new window for git)
```

### Project Template
```bash
tmux new -s frontend -d
tmux send-keys 'nvim .' C-m
tmux new-window -n servers
tmux new-window -n git
tmux select-window -t 1
tmux attach -t frontend
```

### Remote Work
```bash
# On remote server
tmux new -s remote-work
# Do work, then detach: Ctrl-a d
# Later reconnect
tmux attach -t remote-work
```

## Configuration Tips

### Essential Settings
```bash
# Keep default prefix Ctrl-b
set -g prefix C-b
bind C-b send-prefix

# Vi mode
setw -g mode-keys vi

# Mouse support
set -g mouse on

# Start numbering at 1
set -g base-index 1
setw -g pane-base-index 1
```

### Useful Bindings
```bash
# Reload config
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# Better splits
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Alt+arrow to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

## Troubleshooting

### Common Issues
- **Tmux not starting**: `pkill -f tmux && rm -rf /tmp/tmux-$(id -u)`
- **Colors not working**: Add `set -g default-terminal "screen-256color"`
- **Copy/paste broken**: Install platform-specific clipboard tool
- **Nested sessions**: Use `TMUX= tmux` to force nested

### Reset Everything
```bash
tmux kill-server
rm -rf ~/.tmux/plugins/*
rm -rf /tmp/tmux-$(id -u)
# Restart tmux
```

## Key Reminders

- **Prefix** = `Ctrl-b` (default tmux prefix)
- Hold prefix, then press command key
- Use `|` and `-` for splits (easier to remember)
- `z` to zoom/unzoom panes for focus
- `d` to detach and keep session running
- Sessions persist until server restart
- Seamless vim/tmux navigation with Ctrl-h/j/k/l
- Rich status bar with system monitoring