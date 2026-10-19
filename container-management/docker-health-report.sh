#!/usr/bin/env bash
# Summarize Docker container status and show containers reporting unhealthy.
set -euo pipefail
command -v docker >/dev/null 2>&1 || { echo 'docker CLI is required.' >&2; exit 2; }
docker info >/dev/null 2>&1 || { echo 'Cannot access the Docker daemon; check service status and permissions.' >&2; exit 1; }
printf '=== Docker Container Report ===\n'
docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'
printf '\n=== Unhealthy containers ===\n'
found=0
while IFS= read -r id; do
  [[ -n "$id" ]] || continue
  status=$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}no-healthcheck{{end}}' "$id")
  if [[ "$status" == unhealthy ]]; then docker inspect --format '{{.Name}}: {{.State.Health.Status}}' "$id"; found=1; fi
done < <(docker ps -aq)
(( found == 0 )) && echo 'No containers are marked unhealthy.'
