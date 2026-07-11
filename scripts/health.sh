#!/bin/bash

echo "========================================"
echo "Atlas Health Report"
echo "========================================"

echo
echo "Hostname:"
hostname

echo
echo "Uptime:"
uptime

echo
echo "Disk Usage:"
df -h /

echo
echo "Memory:"
free -h

echo
echo "Docker Containers:"
docker ps --format "table {{.Names}}\t{{.Status}}"

echo
echo "Git Status:"
cd /opt/atlas
git status --short

echo
echo "Public IP:"
curl -4 ifconfig.me
echo
