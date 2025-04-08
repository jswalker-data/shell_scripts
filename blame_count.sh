#!/bin/bash

#Creates a table that display the blame count or git contributions in folders
blame_count() {
  local folder="$1"
  echo ""
  echo"$folder"
  echo"--------------------"
  echo""
  git ls-files -z "$folder" \
    | xargs -0 -I {} bash -c 'git blame --line-porcelain "$" \
      | awk '\''/^author / { author = substr($0, 8) } /^\t/ { line = substr($0, 2); if (line ~ /[^[:space:]]/) print author }'\''' _ {} \
    #Add in as many people as needed
    | sed \
      -e 's/Josh Walker\s*$/Josh/' \
    | sort \
    | uniq -c \
    | sort -nr
}
#Run for as many folders
blame_count 'Example'
