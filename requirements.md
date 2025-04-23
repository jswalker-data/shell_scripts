# Requirements

This repository contains standalone scripts written in Bash, PowerShell, and other scripting languages.

## General

These scripts are designed to run independently and require:

- A Unix-like shell (Linux, macOS, WSL, or Git Bash for Windows)
- Standard shell utilities (`bash`, `find`, `grep`, `sed`, etc.)
- `git` (for git-related scripts such as `blame_count.sh`)

## Script-Specific Dependencies

Some scripts have additional requirements, noted either:
- At the top of the script as comments
- In a small README in their respective folder (if needed)

For example:
- `add_annotation.sh` uses `find`, `grep`, and `sed`
- Python is not required to run these scripts, but they often modify Python files