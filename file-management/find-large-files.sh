#!/usr/bin/env bash
##############################################
# Script: find-large-files.sh
# Description: Find large files in a directory
# Author: Adedoyin Ogunsola
##############################################

set -euo pipefail

[[ $# == 2 ]] || { echo "Usage: $0 DIRECTORY MIN_SIZE (for example 100M)" >&2; exit 2; }
dir=$(realpath "$1"); size=$2
[[ -d "$dir" ]] || { echo "Not a directory: $dir" >&2; exit 1; }
find "$dir" -type f -size "+$size" -print0 | while IFS= read -r -d '' file; do du -h "$file"; done | sort -h
