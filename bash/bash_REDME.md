# 🐚 Bash Scripts

This folder contains a variety of shell scripts designed to automate common tasks and streamline developer workflows.

---

## 📜 Scripts

### 🔍 `blame_count.sh`
Displays a count of lines each contributor is responsible for in one or more folders of a Git repository.

- Requires: `git`, `awk`, `sed`
- Example usage:
  ```bash
  bash blame_count.sh src tests
  ```

---

### 🧠 `insert_future_annotation.sh`
Inserts `from __future__ import annotations` into Python files.

- Preserves top-level docstrings (if present)
- Only inserts if the line is not already present
- Recursively modifies all `.py` files in a directory

**Usage:**

```bash
bash insert_future_annotation.sh [optional_folder]
```

If no folder is provided, it defaults to the root of the current Git repository.

---

## 🔧 Dependencies

All scripts are written in Bash and rely on standard Unix utilities:

- `bash`, `find`, `awk`, `grep`, `sed`
- Compatible with Linux, macOS, and WSL environments