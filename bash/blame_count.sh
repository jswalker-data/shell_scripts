#!/bin/bash

# blame_count.sh
# Displays a sorted count of lines each contributor is responsible for in one or more folders of a Git repository.

show_help() {
  echo "Usage: bash blame_count.sh [folder1] [folder2] ..."
  echo ""
  echo "Options:"
  echo "  --help         Show this help message and exit"
  echo ""
  echo "Examples:"
  echo "  bash blame_count.sh src"
  echo "  bash blame_count.sh src tests"
}

blame_count() {
  local folder="$1"

  echo ""
  echo "📁 Folder: $folder"
  echo "--------------------"
  echo ""

  git ls-files -z "$folder" \
    | xargs -0 -I {} bash -c 'git blame --line-porcelain "$1" \
      | awk '\''/^author / { author = substr($0, 8) } /^\t/ { line = substr($0, 2); if (line ~ /[^[:space:]]/) print author }'\''' _ {} \
    | sed -e 's/Josh Walker\s*$/Josh/' \
    | sort \
    | uniq -c \
    | sort -nr
}

# Handle arguments
if [[ "$1" == "--help" ]]; then
  show_help
  exit 0
fi

if [ "$#" -eq 0 ]; then
  blame_count "."
else
  for folder in "$@"; do
    blame_count "$folder"
  done
fi
blame_count "$1"