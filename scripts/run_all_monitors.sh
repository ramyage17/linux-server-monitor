#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of monitoring scripts
MONITORS=(
    "server_monitor.sh"
    "memory_monitor.sh"
    "disk_monitor.sh"
    "uptime_monitor.sh"
    "process_monitor.sh"
    "network_monitor.sh"
)

echo "===================================="
echo "   LINUX SERVER MONITORING SYSTEM"
echo "===================================="

# Execute each monitoring script
for monitor in "${MONITORS[@]}"; do
    echo
    echo "------------------------------------"
    echo "Running: ${monitor}"
    echo "------------------------------------"

    bash "${SCRIPT_DIR}/${monitor}"
done

echo
echo "===================================="
echo " All monitoring checks completed!"
echo "===================================="
