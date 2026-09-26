#!/usr/bin/env bash
set -euo pipefail
printf 'Hostname: '; hostname
printf 'Kernel: '; uname -sr
printf 'Uptime: '; uptime
printf '\nMemory:\n'; if command -v free >/dev/null 2>&1; then free -h; else vm_stat; fi
printf '\nDisk:\n'; df -h
