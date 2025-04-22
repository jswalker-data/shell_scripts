# Requirements

To use the `blame_count.sh` script:

- A Unix-like shell (Linux, macOS, WSL, or Git Bash for Windows)
- `git` installed and available in your `PATH`
- Run the script from the root of a Git repository

Optional:
- Tweak the `sed` command to normalise your team's names (e.g. "Josh Walker" → "Josh")

### Features

- Works on one or more folders passed as arguments
- Displays a clean summary per folder
- Supports `--help` for usage instructions