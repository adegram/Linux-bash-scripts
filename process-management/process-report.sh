#!/usr/bin/env bash
set -euo pipefail
limit=${1:-10}; [[ "$limit" =~ ^[0-9]+$ ]] && (( limit > 0 )) || { echo "Usage: $0 [number-of-processes]" >&2; exit 2; }
ps -eo pid,ppid,comm,%cpu,%mem --sort=-%cpu | head -n "$((limit+1))"
