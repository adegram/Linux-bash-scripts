#!/usr/bin/env bash

##############################################
# Script: disk-report.sh
# Description: Users Auditing
# Author: Adedoyin Ogunsola
##############################################

set -euo pipefail
if [[ -r /etc/passwd ]]; then awk -F: '$3 >= 1000 && $1 != "nobody" {printf "%-24s uid=%-6s home=%s shell=%s\n", $1, $3, $6, $7}' /etc/passwd; else echo 'Cannot read /etc/passwd' >&2; exit 1; fi
printf '\nCurrent sessions:\n'; who
