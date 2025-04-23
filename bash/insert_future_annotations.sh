#!/bin/bash

# insert_future_annotation.sh
# Inserts 'from __future__ import annotations' after a top-level docstring if present, or at the top otherwise.

# Move to the root of the git repo
cd "$(git rev-parse --show-toplevel)" || exit 1

# Set target directory (default to current folder if not provided)
TARGET_DIR="${1:-.}"

find "$TARGET_DIR" -type f -name "*.py" | while read -r file; do
    if ! grep -q "from __future__ import annotations" "$file"; then
        awk '
        BEGIN { in_docstring = 0; first_line_processed = 0; inserted = 0; }
        {
            if (!first_line_processed) {
                if ($0 ~ /^"""/) {
                    in_docstring = 1;
                    print $0;
                    first_line_processed = 1;
                    next;
                } else {
                    print "from __future__ import annotations\n";
                    inserted = 1;
                    first_line_processed = 1;
                }
            }

            if (in_docstring) {
                print $0;
                if ($0 ~ /"""$/ && length($0) > 3) {
                    in_docstring = 0;
                    if (!inserted) {
                        print "\nfrom __future__ import annotations\n";
                        inserted = 1;
                    }
                }
            } else {
                print $0;
            }
        }' "$file" > tmpfile && mv tmpfile "$file"
        echo "✅ Modified: $file"
    else
        echo "✔️ Already contains annotation: $file"
    fi
done
