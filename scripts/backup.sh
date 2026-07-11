#!/bin/bash

set -e

BACKUP_DIR="/opt/atlas/backups/config"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/atlas-$DATE.tar.gz" \
    /opt/atlas/compose \
    /opt/atlas/documentation \
    /opt/atlas/scripts \
    /opt/atlas/README.md \
    /opt/atlas/.gitignore

echo "Backup created:"
ls -lh "$BACKUP_DIR" | tail -1

