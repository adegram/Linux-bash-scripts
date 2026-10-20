#!/usr/bin/env bash
# Quick DNS and TCP connectivity diagnostic for a hostname and port.
set -euo pipefail
[[ $# -ge 1 && $# -le 2 ]] || { echo "Usage: $0 HOSTNAME [PORT]" >&2; exit 2; }
host=$1; port=${2:-443}
[[ "$port" =~ ^[0-9]+$ ]] && (( port >= 1 && port <= 65535 )) || { echo 'Port must be between 1 and 65535.' >&2; exit 2; }
printf 'Host: %s\nPort: %s\n' "$host" "$port"
if command -v getent >/dev/null 2>&1; then
  echo '\nDNS lookup:'; getent ahosts "$host" | awk '!seen[$1]++ {print $1}' || { echo 'DNS lookup failed.' >&2; exit 1; }
else
  echo 'getent not found; DNS check skipped.'
fi
if command -v nc >/dev/null 2>&1; then
  echo '\nTCP connection:'; nc -z -v -w 5 "$host" "$port"
elif command -v bash >/dev/null 2>&1; then
  echo '\nTCP connection:'; timeout 5 bash -c ':</dev/tcp/$1/$2' _ "$host" "$port" && echo 'TCP connection succeeded.' || { echo 'TCP connection failed.' >&2; exit 1; }
else
  echo 'Neither nc nor a usable bash /dev/tcp check is available.' >&2; exit 2
fi
