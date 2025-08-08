#!/usr/bin/env zsh

# Docker aliases
alias dprune='docker system prune -af --volumes'
alias dstop='docker ps -q 2>/dev/null | xargs -r docker stop 2>/dev/null'
alias drm='docker ps -aq 2>/dev/null | xargs -r docker rm 2>/dev/null'
alias drmi='docker images -q 2>/dev/null | xargs -r docker rmi 2>/dev/null'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dex='docker exec -it'
alias dlog='docker logs -f'

