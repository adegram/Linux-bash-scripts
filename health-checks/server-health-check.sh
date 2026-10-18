#!/usr/bin/env bash
# Report CPU load, memory, disk, uptime, and key service status.

###########################
#
# Script: server-health-check.sh
# Description: Script to perform server monitoring
# Author: Adedoyin Ogunsola
#
#############################


set -euo pipefail

DISK_THRESHOLD=${DISK_THRESHOLD:-85}
MEMORY_THRESHOLD=${MEMORY_THRESHOLD:-90}
command -v df >/dev/null && command -v awk >/dev/null || { echo 'Required commands: df, awk' >&2; exit 2; }

printf '=== Server Health Report ===\nHost: %s\nTime: %s\n' "$(hostname)" "$(date -Is)"
printf '\n-- Uptime/load --\n'; uptime
printf '\n-- Memory --\n'
if command -v free >/dev/null 2>&1; then
  free -h
  mem_pct=$(free | awk '/Mem:/ { if ($2>0) printf "%.0f", $3/$2*100; else print 0 }')
  (( mem_pct >= MEMORY_THRESHOLD )) && echo "WARNING: memory usage is ${mem_pct}% (threshold ${MEMORY_THRESHOLD}%)." >&2 || true
else
  echo 'free command unavailable; skipping memory percentage check.'
fi
printf '\n-- Filesystems --\n'
df -P -h
while read -r mount pct; do
  [[ "$pct" =~ ^[0-9]+$ ]] || continue
  (( pct >= DISK_THRESHOLD )) && printf 'WARNING: %s usage is %s%% (threshold %s%%).\n' "$mount" "$pct" "$DISK_THRESHOLD" >&2 || true
done < <(df -P | awk 'NR>1 {gsub(/%/,"",$5); print $6, $5}')
printf '\n-- Failed systemd services (if systemctl exists) --\n'
if command -v systemctl >/dev/null 2>&1; then systemctl --failed --no-legend || true; else echo 'systemctl not available.'; fi
