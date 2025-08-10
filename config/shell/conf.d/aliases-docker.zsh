#!/usr/bin/env zsh
alias dprune='docker system prune -af --volumes'
unalias dstop 2>/dev/null || true
unalias drm 2>/dev/null || true
unalias drmi 2>/dev/null || true
_docker_xargs() {

  if command -v gxargs >/dev/null 2>&1; then
    gxargs "$@"
  else
    xargs "$@"
  fi
}

dstop() { docker ps -q 2>/dev/null | sed -n '1p' >/dev/null || return 0; docker ps -q | _docker_xargs docker stop 2>/dev/null; }
drm()   { docker ps -aq 2>/dev/null | sed -n '1p' >/dev/null || return 0; docker ps -aq | _docker_xargs docker rm 2>/dev/null; }
drmi()  { docker images -q 2>/dev/null | sed -n '1p' >/dev/null || return 0; docker images -q | _docker_xargs docker rmi 2>/dev/null; }
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dex='docker exec -it'
alias dlog='docker logs -f'

