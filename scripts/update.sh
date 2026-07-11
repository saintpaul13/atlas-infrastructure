#!/bin/bash

set -e

echo "=== Atlas Update ==="

sudo apt update
sudo apt -y upgrade

docker image prune -f

echo
echo "Update complete."
