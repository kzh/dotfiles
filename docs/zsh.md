# Zsh Quick Reference

Essential commands, aliases, and hotkeys for shell productivity.

## Key Features

- **Oh My Zsh** framework with robbyrussell theme
- **Modern CLI tools** replacing standard commands
- **FZF integration** for fuzzy finding
- **Git aliases** for faster workflows
- **Auto-suggestions** and syntax highlighting

## Key Bindings

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl-R` | History search | Interactive fuzzy search |
| `Ctrl-T` | File finder | Fuzzy find files |
| `Alt-C` | Directory finder | Fuzzy change directory |
| `**<Tab>` | Fuzzy completion | Trigger fzf completion |

## Modern CLI Replacements

| Old | New | Description |
|-----|-----|-------------|
| `ls` | `eza --icons` | List with icons and colors |
| `cat` | `bat` | Syntax highlighting |
| `find` | `fd` | Modern find alternative |
| `grep` | `rg` | Fast ripgrep |
| `du` | `dust` | Disk usage visualizer |
| `top` | `btop` | Better system monitor |
| `cd` | `z <name>` | Smart directory jumping |
| `curl` | `httpie` | Human-friendly HTTP client |
| `git log` | `gitui` | Interactive git interface |
| `sed` | `sd` | Simpler find and replace |
| `cut/awk` | `choose` | Better field selection |
| `man` | `tealdeer` | Faster help pages |

## Git Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `g` | `git` | Git shorthand |
| `gs` | `git status` | Show status |
| `ga` | `git add` | Stage changes |
| `gc` | `git commit` | Commit changes |
| `gp` | `git push` | Push commits |
| `gl` | `git pull` | Pull changes |
| `gco` | `git checkout` | Switch branches |
| `gb` | `git branch` | List branches |
| `glog` | `git log --oneline --graph` | Pretty log |

## Development Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `v` | `nvim` | Neovim editor |
| `tm` | `tmux` | Terminal multiplexer |
| `py` | `python3` | Python 3 |
| `dk` | `docker` | Docker |
| `k` | `kubectl` | Kubernetes |
| `code` | `code .` | VS Code |

## Directory Navigation

### Zoxide (Smart CD)
- `z <partial-name>` - Jump to frequently used directory
- `zi` - Interactive directory selection
- `z -` - Go to previous directory

### Quick Commands
- `..` - Go up one directory
- `...` - Go up two directories
- `cd -` - Go to previous directory
- `pwd` - Show current directory

## Useful Functions

### mkcd - Make and enter directory
```bash
mkcd project-name  # Creates directory and cd into it
```

### extract - Universal extractor
```bash
extract archive.tar.gz  # Handles .zip, .tar.gz, .rar, etc.
```

### Git branch switcher
```bash
fgb  # Fuzzy search and checkout git branches
```

## History Commands

| Command | Description |
|---------|-------------|
| `history` | Show command history |
| `!!` | Repeat last command |
| `!$` | Last argument from previous command |
| `!^` | First argument from previous command |
| `!*` | All arguments from previous command |

## Quick Workflows

### Git Workflow
```bash
gs              # Check status
ga .            # Stage all changes
gc -m "message" # Commit with message
gp              # Push to remote
```

### Project Navigation
```bash
z myproject     # Jump to project directory
v .             # Open in neovim
tm              # Start tmux session
```

### File Operations
```bash
ll              # Detailed file list with icons
lt              # Tree view of directories
bat filename    # View file with syntax highlighting
fd pattern      # Find files matching pattern
rg "text"       # Search for text in files
http GET api.example.com/users  # Make HTTP requests
gitui           # Interactive git interface
lg              # Lazygit interface
bottom          # System monitor
```

### Web Search
```bash
google "search term"    # Search Google
ddg "search term"       # Search DuckDuckGo
gh "repo name"          # Search GitHub
so "question"           # Search Stack Overflow
```

## Environment Variables

### Development Paths
```bash
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
```

### Editor Settings
```bash
export EDITOR=nvim
export VISUAL=nvim
```

## Oh My Zsh Plugins

**Core plugins:**
- `ssh-agent` - SSH key management
- `fzf` - Fuzzy finder integration
- `git-extras` - Additional git commands
- `colored-man-pages` - Colorized manual pages
- `command-not-found` - Suggest packages for missing commands
- `extract` - Universal archive extractor
- `history-substring-search` - Fish-like history search

**Development plugins:**
- `docker` - Docker completions
- `kubectl` - Kubernetes shortcuts
- `golang` - Go development helpers
- `rust` - Rust/Cargo completions
- `npm` - Node package manager
- `yarn` - Yarn completions
- `pip` - Python package completions
- `terraform` - Terraform completions

**Cloud plugins:**
- `aws` - AWS CLI completions
- `gcloud` - Google Cloud completions

**Utility plugins:**
- `httpie` - HTTPie completions
- `jsontools` - JSON manipulation tools
- `web-search` - Search from terminal
- `copypath` - Copy current path
- `copyfile` - Copy file contents

**External plugins:**
- `fast-syntax-highlighting` - Enhanced syntax highlighting
- `zsh-autosuggestions` - Fish-like auto suggestions

## Customization Tips

### Change Theme
```bash
# Edit ~/.zshrc
ZSH_THEME="theme-name"
```

**Popular themes:**
- `robbyrussell` (current)
- `powerlevel10k`
- `agnoster`
- `spaceship`

### Add Custom Aliases
```bash
# Add to ~/.zshrc or ~/.config/zsh/aliases.zsh
alias myalias='command'
```

### Performance Optimization
```bash
# Lazy load expensive tools
export NVM_LAZY_LOAD=true

# Compile .zshrc for faster loading
zcompile ~/.zshrc
```

## Troubleshooting

### Common Issues
- **Command not found**: Check `$PATH` with `echo $PATH`
- **Slow startup**: Use `time zsh -i -c exit` to measure
- **Completion issues**: Run `rm -rf ~/.zcompdump* && exec zsh`
- **Plugin problems**: Check `$plugins` array

### Debug Commands
```bash
which command           # Find command location
type command           # Show command type
hash -r                # Refresh command cache
exec zsh               # Restart shell
zsh --no-globalrcs     # Start without config
```

### Reset Configuration
```bash
# Backup and reset
mv ~/.zshrc ~/.zshrc.backup
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

## Key Reminders

- Use `Tab` for completion everywhere
- `Ctrl-C` to cancel current command
- `Ctrl-L` to clear screen
- `Ctrl-D` to exit shell
- Case-insensitive completion enabled
- Auto-suggestions appear in gray text (press `→` or `End` to accept)
- Fast syntax highlighting shows errors in real-time
- `**<Tab>` triggers fuzzy completion anywhere
- History substring search with arrow keys
- Auto-installation of missing plugins on first run