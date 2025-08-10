#!/usr/bin/env zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
  ql() { qlmanage -p "$@" &>/dev/null & }
  finder() { open "${1:-.}" }
  sysinfo() {
    local macos build kernel arch cpu mem disk
    if command -v sw_vers >/dev/null 2>&1; then
      macos=$(sw_vers -productVersion)
      build=$(sw_vers -buildVersion)
    else
      macos="unknown"
      build="unknown"
    fi
    kernel=$(uname -r 2>/dev/null || echo unknown)
    arch=$(uname -m 2>/dev/null || echo unknown)
    if command -v sysctl >/dev/null 2>&1; then
      cpu=$(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo unknown)
      mem_gb=$(( $(sysctl -n hw.memsize 2>/dev/null || echo 0) / 1024 / 1024 / 1024 ))
      mem="${mem_gb} GB"
    else
      cpu="unknown"
      mem="unknown"
    fi
    disk=$(df -h / 2>/dev/null | awk 'NR==2 {print $4 " free of " $2}')
    echo "macOS: ${macos}"
    echo "Build: ${build}"
    echo "Kernel: ${kernel}"
    echo "Architecture: ${arch}"
    echo "CPU: ${cpu}"
    echo "Memory: ${mem}"
    echo "Disk: ${disk}"
  }

  alias localip="ipconfig getifaddr en0"
  alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}'"
  alias flushdns="sudo dscacheutil -flushcache"
fi

