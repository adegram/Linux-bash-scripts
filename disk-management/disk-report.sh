#!/usr/bin/env bash

##############################################
# Script: disk-report.sh
# Description: Disk usage monitoring utility
# Author: Adedoyin Ogunsola
##############################################

set -euo pipefail
threshold=${1:-85}; [[ "$threshold" =~ ^[0-9]+$ ]] && (( threshold <= 100 )) || { echo "Usage: $0 [threshold-percent 0-100]" >&2; exit 2; }
printf 'Filesystem usage (threshold %s%%)\n' "$threshold"
df -P -h | awk -v threshold="$threshold" 'NR==1 {print; next} {gsub(/%/, "", $5); print; if ($5+0 >= threshold) printf "WARNING: %s is at %s%%\n", $6, $5 > "/dev/stderr"}'
