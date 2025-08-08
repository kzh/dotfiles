#!/usr/bin/env zsh

# macOS helpers and aliases
if [[ "$OSTYPE" == "darwin"* ]]; then
  ql() { qlmanage -p "$@" &>/dev/null & }
  finder() { open "${1:-.}" }
  sysinfo() {
    echo "macOS: $(sw_vers -productVersion)"
    echo "Build: $(sw_vers -buildVersion)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "CPU: $(sysctl -n machdep.cpu.brand_string)"
    echo "Memory: $(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 )) GB"
    echo "Disk: $(df -h / | awk 'NR==2 {print $4 " free of " $2}')"
  }

  alias localip="ipconfig getifaddr en0"
  alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}'"
  alias flushdns="sudo dscacheutil -flushcache"
fi

