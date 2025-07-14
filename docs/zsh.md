# ZSH - Ultimate Productivity Guide

## Performance Architecture
```bash
# Lazy Loading (100ms startup)
nvm() { unset -f nvm node npm npx; . "$NVM_DIR/nvm.sh"; nvm "$@" }
docker() { unset -f docker; . $ZSH/plugins/docker/docker.plugin.zsh; docker "$@" }
kubectl() { unset -f kubectl; . $ZSH/plugins/kubectl/kubectl.plugin.zsh; kubectl "$@" }

# History: 50K entries, instant sharing, deduped
HISTSIZE=50000 SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_VERIFY
```

## Navigation Excellence
```bash
z proj                   # zoxide smart jump (learns from cd)
zi                       # interactive directory picker
~proj ~dl ~docs          # hash dirs: proj=~/Code dl=~/Downloads
d                        # dirs stack, cd to number
cd -                     # previous directory
cd !$                    # cd to last argument
cd /u/l/b<Tab>           # /usr/local/bin
**<Tab>                  # fuzzy complete anywhere
```

## Modern CLI Arsenal
```bash
cat→bat  ls→eza  find→fd  grep→rg  sed→sd  ps→procs  top→btm
df→duf  du→dust  ping→gping  dig→dog  curl→httpie  man→tldr

eza: -la (details) -T (tree) --git (status) --icons
fd: -H (hidden) -E .git -t f (files) -e py (extension)
rg: -S (smart case) -F (fixed) -C3 (context) --json
```

## Global Aliases (anywhere in cmd)
```bash
cmd G pattern            # | grep pattern
cmd L                    # | less
cmd H -10                # | head -10
cmd T -f                 # | tail -f
cmd S                    # | sort
cmd U                    # | uniq
cmd C                    # | wc -l
cmd J .key               # | jq .key
cmd Y                    # | pbcopy
cmd NE                   # 2>/dev/null
cmd NUL                  # >/dev/null 2>&1
```

## Suffix Aliases (open by extension)
```bash
file.yml                 # opens in nvim
image.png                # opens in Preview
doc.pdf                  # opens in default app
```

## Git Mastery
```bash
# Custom aliases
gs      # status -sb         glo     # log with pager
gad     # add               glop    # log -p
gcm     # commit            grsh    # reset --hard
gco     # checkout          grbc    # rebase --continue
gdf     # diff              gst     # stash

# Power functions
gcof    # fzf branch checkout
gshow   # interactive commit browser with preview
```

## FZF Integration
```bash
Ctrl-R                   # history search
Ctrl-T                   # file picker → inserts path
Alt-C                    # directory navigator
kill -9 **<Tab>          # fuzzy complete PIDs
ssh **<Tab>              # fuzzy complete hosts
export var=**<Tab>       # fuzzy complete vars

# Custom FZF commands
fzf --preview 'bat {}'   # file preview
fzf --bind 'ctrl-/:toggle-preview'
```

## Plugin Ecosystem (31 plugins)

### Core Productivity

**fzf - Fuzzy Finder**
```bash
Ctrl-R                  # History search with preview
Ctrl-T                  # File picker (inserts path)
Alt-C                   # Directory navigator
**<Tab>                 # Trigger fuzzy completion

# Advanced usage
kill -9 **<Tab>         # Process selection
ssh **<Tab>             # Host selection
unset **<Tab>           # Variable selection
export **<Tab>          # Environment selection
```

**zoxide - Smarter cd**
```bash
z proj                  # Jump to ~/Code/project
zi                      # Interactive selection
z -                     # Previous directory
z ..                    # Parent directory

# Learning algorithm based on:
# - Frequency (how often you visit)
# - Recency (how recently you visited)
```

**atuin - Shell History Database**
```bash
# Synced across machines, searchable
Ctrl-R                  # Enhanced history search
atuin search --cmd ls   # Search specific commands
atuin stats             # Usage statistics
atuin import auto       # Import existing history
```

**direnv - Directory Environments**
```bash
# Auto-load .envrc files
echo 'export API_KEY=secret' > .envrc
direnv allow           # Trust the file
# Automatically loaded when entering directory
# Automatically unloaded when leaving
```

### Development Plugins

**git-extras - 100+ Git Commands**
```bash
git ignore "*.log"      # Add to .gitignore
git undo               # Undo last commit
git standup            # What I did yesterday
git effort             # Show effort stats
git changelog          # Generate changelog
git release 1.0.0      # Tag and push release
git delete-branch      # Delete local and remote
git pr                 # Open pull request
git browse             # Open repo in browser
```

**docker - Enhanced Docker**
```bash
# Completions for all subcommands
docker run <Tab>       # Image completion
docker exec <Tab>      # Container completion
docker-compose <Tab>   # Service completion

# Aliases included
dcup                   # docker-compose up
dcdown                 # docker-compose down
dclogs                 # docker-compose logs
```

**kubectl - Kubernetes Power**
```bash
# Completions + aliases
k get po<Tab>          # Resource completion
k -n <Tab>             # Namespace completion
k logs <Tab>           # Pod completion

# Aliases
kaf                    # kubectl apply -f
keti                   # kubectl exec -ti
kcuc                   # kubectl config use-context
kcsc                   # kubectl config set-context
```

**Cloud Providers**
```bash
# aws - AWS CLI
aws s3 <Tab>           # Service completion
aws ec2 describe<Tab>  # Command completion

# gcloud - Google Cloud
gcloud compute <Tab>   # Service completion
gcloud projects <Tab>  # Project completion

# terraform
terraform plan <Tab>   # Command completion
tf workspace <Tab>     # Workspace completion
```

### Language-Specific

**golang**
```bash
# Aliases
gob                    # go build
gobd                   # go build -o /dev/null
goc                    # go clean
god                    # go doc
gof                    # go fmt
gofa                   # go fmt ./...
gog                    # go get
goi                    # go install
gol                    # golint
gor                    # go run
got                    # go test
gov                    # go vet
```

**rust**
```bash
# Cargo completions
cargo b<Tab>           # build/bench completion
cargo t<Tab>           # test completion
cargo r<Tab>           # run completion
```

**npm/yarn**
```bash
# npm shortcuts
npmg                   # npm install -g
npmS                   # npm install --save
npmD                   # npm install --save-dev
npmr                   # npm run
npmt                   # npm test

# yarn shortcuts  
y                      # yarn
ya                     # yarn add
yad                    # yarn add --dev
yr                     # yarn run
yt                     # yarn test
```

**pip - Python**
```bash
# Virtual env detection
# Auto-completion for packages
pip install <Tab>      # Package names
pip show <Tab>         # Installed packages
```

### Shell Enhancements

**fast-syntax-highlighting**
```bash
# Real-time highlighting:
# - Green: valid commands
# - Red: command not found
# - Yellow: quoted strings
# - Blue: options/flags
# - Underline: existing paths
```

**zsh-autosuggestions**
```bash
# Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Usage
→                      # Accept suggestion
Ctrl-→                 # Accept partial word
Alt-→                  # Accept partial line
```

**history-substring-search**
```bash
# Type part of command
git com<↑>             # Cycles through git commit, git commit -m, etc.
docker <↑>             # All docker commands

# Bindings
↑/↓                    # During typing
Ctrl-P/N               # Alternative bindings
```

**extract - Archive Handler**
```bash
extract file.tar.gz    # Auto-detects type
extract file.zip       # Works with 15+ formats
# Supports: tar.gz, tar.bz2, tar.xz, zip, 
# rar, 7z, gz, bz2, xz, tar, deb, rpm, etc.
```

### Utility Plugins

**ssh-agent**
```bash
# Auto-starts ssh-agent
# Loads SSH keys on demand
# Shares agent between terminals
zstyle :omz:plugins:ssh-agent identities id_rsa id_ed25519
zstyle :omz:plugins:ssh-agent lifetime 4h
```

**colored-man-pages**
```bash
# Colorizes man pages for readability
# Headers in cyan
# Options in green  
# Examples in yellow
# References in magenta
```

**command-not-found**
```bash
# Suggests packages when command missing
$ htop
Command 'htop' not found, but can be installed with:
brew install htop
```

**httpie - HTTP Client**
```bash
http GET api.github.com/users/github
http POST httpbin.org/post name=John
http --json POST api.example.com/data field=value

# Aliases
https                  # http --default-scheme=https
```

**jsontools - JSON Utils**
```bash
# Pretty print
echo '{"foo":"bar"}' | pp_json

# Validate
echo '{"foo":"bar"}' | is_json

# URL encode JSON
echo '{"foo":"bar"}' | urlencode_json
```

**web-search - Search from Terminal**
```bash
google "zsh plugins"   # Opens in browser
ddg "privacy search"   # DuckDuckGo
github "neovim"       # GitHub search
so "python async"     # Stack Overflow

# Custom search
alias wiki='web_search wikipedia'
```

**copypath/copyfile**
```bash
copypath              # Copy current path to clipboard
copyfile file.txt     # Copy file contents to clipboard
```

### Plugin Management

**Installation**
```bash
# Oh My Zsh plugins (built-in)
plugins=(git docker kubectl ...)

# Custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Then add to plugins array
plugins=(... zsh-autosuggestions)
```

**Performance Tips**
```bash
# Lazy load slow plugins
zsh_add_plugin() {
  PLUGIN_NAME=$1
  source $ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh
}

# Load only when needed
docker() {
  unfunction docker
  zsh_add_plugin docker
  docker "$@"
}
```

**Must-Have External Plugins**
```bash
# fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# zsh-autosuggestions  
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf-tab (fzf for tab completion)
git clone https://github.com/Aloxaf/fzf-tab \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

## Kubernetes Productivity
```bash
kctxf                    # fzf context switch
knsf                     # fzf namespace switch
kall                     # ALL resources in namespace
kwp                      # watch pods with columns
kexec                    # fzf pod → exec bash
klogs                    # fzf pod → stream logs

k get pods -o json | jq '.items[].metadata.name'
k exec -it $(k get pods -o name | fzf) -- bash
```

## Docker Operations
```bash
dexec                    # fzf container → exec
dlogs                    # fzf container → logs
dprune                   # system prune -af --volumes
dstop && drm            # stop/remove all containers

docker ps --format "table {{.Names}}\t{{.Status}}"
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
```

## Power Functions
```bash
# System
killport() { lsof -ti:$1 | xargs kill -9 }
serve() { python3 -m http.server ${1:-8000} }
mkcd() { mkdir -p "$1" && cd "$1" }
take() { mkcd "$1" }

# Text Processing
replace() { rg -l "$1" | xargs sd "$1" "$2" }
jpretty() { pbpaste | jq . | pbcopy }
urlencode() { python3 -c "import urllib.parse; print(urllib.parse.quote('$1'))" }
urldecode() { python3 -c "import urllib.parse; print(urllib.parse.unquote('$1'))" }

# Process Management
topcpu() { ps aux | sort -nrk 3,3 | head -n ${1:-10} }
topmem() { ps aux | sort -nrk 4,4 | head -n ${1:-10} }
listening() { lsof -iTCP -sTCP:LISTEN -P }

# Archive
extract() {
  case $1 in
    *.tar.bz2) tar xvjf $1;;  *.tar.gz) tar xvzf $1;;
    *.tar.xz) tar xvJf $1;;   *.zip) unzip $1;;
    *.rar) unrar x $1;;       *.7z) 7z x $1;;
    *) echo "Unknown archive type";;
  esac
}
```

## Daily Workflows

### Morning Setup
```bash
# System check
btm                      # resource monitor
docker ps               # container status
k get pods              # kubernetes health

# Tool updates  
brew upgrade            # update tools
```

### Project Navigation
```bash
# Jump to project
z myproject             # smart cd
tmux new -s project     # new session

# Quick file operations
fd README | head -1 | xargs bat  # find and view
rg TODO                          # find todos
fd -e log -x tail -f {}         # tail all logs
```

### Debugging Sessions
```bash
# Port investigation
lsof -i :3000           # what's on port
killport 3000           # free it up
netstat -tlnp           # all listeners

# Process debugging
procs --tree            # process tree
topcpu                  # cpu hogs
ps aux G node           # filter processes

# Log analysis
tail -f log.txt G ERROR # filter errors
rg "Exception" -A5 -B5  # context search
fd -e log | xargs rg "FATAL"  # search all logs
```

### Git Workflows
```bash
# Feature branch
gco -b feature/new      # create branch
gs                      # check status
gad .                   # stage all
gcm "feat: add feature" # commit
gps -u origin HEAD      # push with tracking

# Code review
gdf main..HEAD          # changes vs main
glo --oneline -10       # recent commits
gshow                   # browse commits
```

## Command Line Editing
```bash
# Line navigation
Ctrl-A/E                # start/end of line
Alt-F/B                 # forward/back word
Ctrl-W                  # delete word back
Ctrl-K                  # delete to end
Ctrl-U                  # delete to start

# History
!!                      # last command
!$                      # last argument
!^                      # first argument
!*                      # all arguments
^old^new                # replace in last cmd
!vim:p                  # preview last vim cmd

# Job control
Ctrl-Z                  # suspend
fg                      # foreground
bg                      # background
jobs -l                 # list with PIDs
```

## Advanced Completion
```bash
# Smart matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Menu selection
zstyle ':completion:*' menu select
# Descriptions
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
# Process colors
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
```

## Environment Optimization
```bash
# Critical paths
export PATH="$GOBIN:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Performance
export DISABLE_AUTO_UPDATE=true
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
```

## Emergency Commands
```bash
exec zsh                 # reload shell
hash -r                  # rebuild command hash
unalias -a              # remove all aliases
unfunction func_name    # remove function
bindkey -L              # list all keybindings
compinit -D             # rebuild completions
```

## Quick Reference

| Task | Command | Description |
|------|---------|-------------|
| **Navigation** |||
| Smart jump | `z proj` | Frecency-based cd |
| Interactive | `zi` | FZF directory picker |
| Previous | `-` or `cd -` | Last directory |
| **Search** |||
| Files | `fd pattern` | Find files fast |
| Content | `rg "text"` | Grep replacement |
| History | `Ctrl-R` | FZF history search |
| **Git** |||
| Status | `gs` | Short git status |
| Interactive | `gcof` | FZF branch switch |
| Browse | `gshow` | Commit explorer |
| **Process** |||
| Kill port | `killport 3000` | Free up port |
| Top CPU | `topcpu` | CPU hungry processes |
| Monitor | `btm` | System dashboard |
| **Docker** |||
| Exec | `dexec` | Container shell |
| Cleanup | `dprune` | Remove everything |
| **K8s** |||
| Context | `kctxf` | Switch context |
| Logs | `klogs` | Stream pod logs |
| All | `kall` | List everything |

## Productivity Rules
1. **z > cd**: Let it learn your habits
2. **Global aliases**: Transform any output
3. **FZF everything**: Fuzzy beats exact
4. **Modern tools**: 10x faster
5. **Lazy load**: Keep startup fast
6. **Hash dirs**: Quick project jumps
7. **Extract**: One command for all archives
8. **History search**: Ctrl-R is your friend
9. **Autosuggestions**: Just press →
10. **Functions**: Automate repetitive tasks