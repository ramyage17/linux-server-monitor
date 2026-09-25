#!/bin/bash

# Load monitoring thresholds
CONFIG_FILE="$(dirname "$0")/../config/thresholds.conf"
source "$CONFIG_FILE"

# Check if disk threshold is loaded
if [ -z "$DISK_THRESHOLD" ]; then
    echo "ERROR: DISK_THRESHOLD is not configured"
    exit 1
fi

# Get disk usage percentage of the root filesystem
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk Usage: ${DISK_USAGE}%"

# Check disk usage against threshold
if (( DISK_USAGE >= DISK_THRESHOLD )); then
    echo "ALERT: Disk usage is above ${DISK_THRESHOLD}%"
else
    echo "INFO: Disk usage is within normal range"
fi