#!/bin/bash

# Check if directory was passed as an argument
if [ -z "$1" ]; then
  DIR="."
else
  DIR="$1"
fi

# Colours
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Colour

# Recursively print tree
print_tree() {
  local directory="$1"
  local prefix="$2"

  # Get list of files and directories
  local entries=()
  while IFS= read -r -d $'\0'; do
    entries+=("$REPLY")
  done < <(find "$directory" -mindepth 1 -maxdepth 1 -print0 | sort -z)

  local count=${#entries[@]}
  for i in "${!entries[@]}"; do
    local base=$(basename "${entries[$i]}")
    local full_path="${entries[$i]}"
    local connector="├──"

    if [ $((i+1)) -eq $count ]; then
      connector="└──"
    fi

    if [ -d "$full_path" ]; then
      echo -e "${prefix}${connector} ${BLUE}${base}${NC}"
      print_tree "$full_path" "${prefix}$( [ $((i+1)) -eq $count ] && echo "    " || echo "│   ")"
    else
      echo -e "${prefix}${connector} ${YELLOW}${base}${NC}"
    fi
  done
}

# Starting point
echo -e "${BLUE}${DIR}${NC}"
print_tree "$DIR" ""
