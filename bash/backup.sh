#!/bin/bash

backup_dir="backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"
cp data/*.csv "$backup_dir"
echo "Backup completed to $backup_dir"
