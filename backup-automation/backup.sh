#!/usr/bin/bash
#############################################
# Script: backup.sh
# Description: Automated directory backup
# Author: Adedoyin Ogunsola
#############################################
set -euo pipefail

usage(){ echo "Usage: $0 SOURCE_DIR DEST_DIR" >&2; exit 2; }
[[ $# == 2 ]] || usage
[[ -d "$1" ]] || { echo "Source directory does not exist: $1" >&2; exit 1; }
src=$(cd "$1" && pwd -P)
dest_parent=$(dirname "$2")
[[ -d "$dest_parent" ]] || { echo "Destination parent must already exist: $dest_parent" >&2; exit 1; }
dest_parent=$(cd "$dest_parent" && pwd -P)
dest="$dest_parent/$(basename "$2")"
[[ "$src" != "$dest" && "$src" != "$dest"/* ]] || { echo "Destination must not be the source or inside it" >&2; exit 1; }
mkdir -p "$dest"; stamp=$(date -u +%Y%m%dT%H%M%SZ); archive="$dest/$(basename "$src")-$stamp.tar.gz"
tar -czf "$archive" -C "$(dirname "$src")" "$(basename "$src")"
sha256sum "$archive" > "$archive.sha256"
echo "Backup created: $archive"
