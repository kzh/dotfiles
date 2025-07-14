# Tmux - Ultimate Productivity Guide

## Core Bindings (Prefix: Ctrl-b)

### Pane Control
```
|        split vertical       z        zoom toggle
-        split horizontal     S        sync panes (broadcast)
h/j/k/l  navigate (vim)       x        kill pane
H/J/K/L  resize by 5          !        break to window
C-p      quick select         {/}      swap panes
```

### Window Operations
```
c        new (current path)   </>      move window
n/p      next/previous       ,        rename
0-9      select by number    &        kill window
C-h/C-l  previous/next       w        list windows
```

### Copy Mode (Vi)
```
[        enter copy mode     Space    start selection
v        visual mode         y        copy & exit
C-v      block selection     /        search forward
]        paste              n/N      next/prev match
```

## Plugin Ecosystem (15 plugins)

### Core Plugins
**TPM (Tmux Plugin Manager)**
```bash
Prefix + I              # Install plugins
Prefix + U              # Update plugins
Prefix + Alt-u          # Uninstall plugins
```

**tmux-sensible**
- Better defaults, UTF-8, faster escape time
- Aggressive resizing, focus events
- History boost to 50k

### Session & State Management
**tmux-resurrect**
```bash
Prefix + Ctrl-s         # Save complete environment
Prefix + Ctrl-r         # Restore everything
# Saves: pane layouts, working dirs, running programs
# Restores: vim/nvim sessions, pane contents
```

**tmux-continuum**
- Auto-saves every 10 minutes
- Optional auto-restore on tmux start
- Works with resurrect seamlessly

### Navigation & Search
**tmux-fzf** (Prefix + f)
```bash
session                 # Switch sessions with preview
window                  # Jump to any window
pane                   # Navigate all panes
command                # Run tmux commands
keybinding             # Search all keybindings
clipboard              # Browse clipboard history
process                # Manage running processes
```

**christoomey/vim-tmux-navigator**
```bash
Ctrl-h/j/k/l           # Seamless vim↔tmux navigation
Ctrl-\                 # Previous split
# Works in vim, nvim, and tmux transparently
```

### Text & Clipboard
**tmux-yank**
```bash
# Normal mode
y                      # Copy to system clipboard
Y                      # Copy line to clipboard

# Copy mode
y                      # Copy selection
Ctrl-y                 # Copy and paste immediately
Alt-y                  # Copy without exiting mode
```

**laktak/extrakto** (Prefix + Tab)
```bash
Tab                    # Extract from pane
Ctrl-f                 # Extract with filter
Ctrl-g                 # Extract with grab
Enter                  # Insert selection
Ctrl-o                 # Open selection

# Extracts: URLs, file paths, git hashes, 
# IPs, quotes, words, kubernetes resources
```

### System Monitoring
**tmux-battery**
```
#{battery_icon}        # Icon indicator
#{battery_percentage}  # Percentage
#{battery_remain}      # Time remaining
Icons: 🌕🌖🌗🌘🌑 or custom
```

**tmux-cpu**
```
#{cpu_icon}           # CPU usage icon
#{cpu_percentage}     # CPU percentage
#{ram_icon}           # RAM usage icon
#{ram_percentage}     # RAM percentage
```

**tmux-online-status**
```
#{online_status}      # 🌐 online / 📡 offline
```

### Productivity Tools
**tmux-open** (in copy mode)
```bash
o                     # Open file/URL
Ctrl-o                # Open with $EDITOR
Shift-s               # Search Google
# Works with files, URLs, Docker images, more
```

**tmux-logging**
```bash
Prefix + Alt-p        # Toggle logging current pane
Prefix + Alt-P        # Save visible pane contents
Prefix + Alt-c        # Clear pane history
Prefix + Alt-C        # Clear pane history & save

# Logs saved to ~/.tmux/logs/
# Format: tmux-[session]-[window]-[pane]-[timestamp].log
```

**tmux-prefix-highlight**
```
#{prefix_highlight}   # Shows when prefix active
# Customizable colors and text
# Shows copy mode status
# Shows synchronized panes
```

### Theme: Rose Pine
```bash
set -g @rose_pine_variant 'dawn'  # dawn/moon/main
set -g @rose_pine_host 'on'        # Show hostname
set -g @rose_pine_date_time '%H:%M'  # Time format
set -g @rose_pine_user 'on'        # Show username
set -g @rose_pine_directory 'on'   # Current directory
set -g @rose_pine_bar_bg_disable 'off'  # Transparent bar
set -g @rose_pine_field_separator ' | '  # Field separator

# Icons (Nerd Font required)
set -g @rose_pine_session_icon ''
set -g @rose_pine_current_window_icon ''
set -g @rose_pine_folder_icon ''
set -g @rose_pine_username_icon ''
set -g @rose_pine_hostname_icon '󰒋'
set -g @rose_pine_date_time_icon '󰃰'
```

### Plugin Configuration Examples
```bash
# Resurrect - Save specific programs
set -g @resurrect-processes 'ssh psql mysql sqlite3 "~rails server"'
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-strategy-nvim 'session'
set -g @resurrect-capture-pane-contents 'on'

# Continuum - Auto restore
set -g @continuum-restore 'on'
set -g @continuum-save-interval '10'

# FZF - Custom options
TMUX_FZF_LAUNCH_KEY="f"
TMUX_FZF_OPTIONS="-p -w 80% -h 60%"
TMUX_FZF_PREVIEW=1

# Extrakto - Custom settings
set -g @extrakto_clip_tool "pbcopy"  # macOS
set -g @extrakto_filter_order "word line"
set -g @extrakto_grab_area "window full"

# Prefix highlight
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_show_sync_mode 'on'
set -g @prefix_highlight_prefix_prompt 'PREFIX'
set -g @prefix_highlight_copy_prompt 'COPY'
set -g @prefix_highlight_sync_prompt 'SYNC'
```

## Daily Workflows

### Morning Setup
```bash
# Start main session
tmux new -s main -d
tmux send-keys 'btm' Enter      # system monitor
tmux split-window -h
tmux send-keys 'docker ps' Enter
tmux new-window -n logs
tmux send-keys 'tail -f /var/log/system.log' Enter
tmux attach -t main

# Or use saved session
tmux resurrect  # Ctrl-b Ctrl-r
```

### Project Development
```bash
# Quick project session
PROJECT=$(basename $PWD)
tmux new -s $PROJECT -n editor
tmux send-keys "nvim ." Enter
tmux new-window -n server
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "npm run dev" Enter
tmux select-pane -t 1
tmux send-keys "npm run test:watch" Enter
tmux new-window -n git
tmux send-keys "gitui" Enter
tmux select-window -t editor
```

### Debugging Sessions
```bash
# Multi-pane debugging
tmux new-window -n debug
tmux send-keys 'htop' Enter
tmux split-window -h
tmux send-keys 'tail -f app.log | grep ERROR' Enter
tmux split-window -v
tmux send-keys 'watch -n 1 "netstat -tlnp"' Enter
tmux select-pane -t 0
tmux resize-pane -Z  # zoom for focus
```

### Remote Server Management
```bash
# Multiple servers dashboard
tmux new-window -n servers
for server in web{1..4}.example.com; do
  tmux split-window -h "ssh $server htop"
  tmux select-layout tiled
done
# Sync panes for simultaneous commands
tmux setw synchronize-panes on  # or Prefix + S
```

## Advanced Features

### Pane Synchronization
```bash
Prefix + S      # Toggle sync
# Type once, execute everywhere
# Perfect for: cluster ops, multi-server config
```

### Logging Tools
```
Alt-p    toggle pane log      Alt-c    save history
Alt-P    screenshot pane      Logs → ~/.tmux/logs/
```

### Mouse Mode
```
Scroll, select, resize with mouse
Drag to copy text
Click to focus pane
```

## Power Patterns

### Quick Navigation
```bash
# Jump between projects
Prefix + s              # session list
Prefix + f → session    # FZF session picker

# Window hopping
Prefix + w              # window preview
Prefix + f → window     # FZF window search

# Pane focus
Prefix + q → number     # quick pane select
Prefix + z              # zoom toggle
```

### Efficient Layouts
```bash
# Preset layouts
Prefix + M-1    # even horizontal
Prefix + M-2    # even vertical  
Prefix + M-3    # main horizontal
Prefix + M-4    # main vertical
Prefix + M-5    # tiled
Prefix + Space  # cycle layouts

# Custom layout save
Prefix + C-s    # save with resurrect
```

### Copy/Paste Workflows
```bash
# Keyboard copy
Prefix + [      # enter copy mode
/searchterm     # find text
n               # next match
v               # start selection
y               # yank and exit

# Mouse copy
Drag to select → auto-copies
Middle-click to paste

# System clipboard
Prefix + y      # copy to system (tmux-yank)
Cmd/Ctrl + v    # paste from system
```

### Window Organization
```bash
# Rename for clarity
Prefix + ,      # rename window
Prefix + $      # rename session

# Reorder windows
Prefix + .      # move to number
Prefix + </>    # shift left/right

# Monitor activity
:setw monitor-activity on
:setw monitor-silence 30
```

## Optimized Settings
```bash
set -sg escape-time 10         # Faster commands
set -g history-limit 50000     # Huge scrollback
set -g focus-events on         # Vim integration
set -g mouse on                # Full mouse support
set -g default-terminal "tmux-256color"  # True color
```

## Productivity Scripts

### Session Templates
```bash
#!/bin/bash
# ~/bin/tmux-work
tmux new -s work -d
tmux rename-window 'email'
tmux send-keys 'mutt' Enter
tmux new-window -n 'calendar'
tmux send-keys 'calcurse' Enter
tmux new-window -n 'slack'
tmux new-window -n 'notes'
tmux send-keys 'nvim ~/notes' Enter
tmux select-window -t email
tmux attach -t work
```

### Auto-reconnect SSH
```bash
#!/bin/bash
# ~/bin/ssh-persist
while true; do
  ssh -t $1 'tmux attach || tmux new -s main'
  echo "Connection lost. Reconnecting in 5s..."
  sleep 5
done
```

### Multi-pane Command
```bash
#!/bin/bash
# ~/bin/tmux-multi
cmd="$@"
for pane in $(tmux list-panes -F '#P'); do
  tmux send-keys -t $pane "$cmd" Enter
done
```

## Emergency Commands
```bash
tmux kill-server            # nuclear option
Prefix + :                  # command mode
respawn-pane -k            # restart frozen pane
respawn-window -k          # restart frozen window
source ~/.tmux.conf        # reload config
```

## Troubleshooting

### Common Fixes
```bash
# Colors broken
export TERM=xterm-256color
tmux kill-server && tmux

# Copy/paste not working (macOS)
brew install reattach-to-user-namespace

# Plugins not loading
~/.tmux/plugins/tpm/bin/install_plugins

# Session corrupted
cd ~/.tmux/resurrect
rm last  # remove symlink
ln -s <good-backup> last
```

### Debug Commands
```bash
tmux info                   # current settings
tmux list-keys             # all bindings
tmux show-options -g       # global options
Prefix + ?                 # show bindings
display-message -p '#S:#I.#P' # session:window.pane
```

## Quick Reference

| Task | Key | Description |
|------|-----|-------------|
| **Panes** |||
| Split V | `\|` | Vertical split |
| Split H | `-` | Horizontal split |
| Navigate | `h/j/k/l` | Vim-style movement |
| Zoom | `z` | Toggle zoom |
| Sync | `S` | Broadcast input |
| **Windows** |||
| New | `c` | Create window |
| Switch | `0-9` | By number |
| Rename | `,` | Name window |
| Move | `</>` | Shift position |
| **Sessions** |||
| List | `s` | Show all |
| Save | `C-s` | Resurrect |
| Detach | `d` | Keep running |
| **Copy** |||
| Mode | `[` | Enter copy |
| Select | `v` | Visual mode |
| Copy | `y` | Yank text |
| Paste | `]` | Insert text |
| **Plugins** |||
| FZF | `f` | Everything menu |
| Extract | `Tab` | Grab text |

## Productivity Rules
1. **Name everything**: Sessions and windows
2. **Use resurrect**: Save layouts
3. **Zoom often**: Focus on one pane
4. **Sync panes**: Multi-server ops
5. **Mouse+keyboard**: Best of both
6. **FZF navigate**: Faster than cycling
7. **Extract text**: No manual copy
8. **Templates**: Automate layouts
9. **Persistent SSH**: Auto-reconnect
10. **Learn bindings**: `Prefix + ?`