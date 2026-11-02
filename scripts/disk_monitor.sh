#!/bin/bash

# Load monitoring configuration
CONFIG_FILE="$(dirname "$0")/../config/thresholds.conf"
source "$CONFIG_FILE"

# Load centralized logging function
source "$(dirname "$0")/logger.sh"

# Check if disk threshold is loaded
if [ -z "$DISK_THRESHOLD" ]; then
    echo "ERROR: DISK_THRESHOLD is not configured"
    log_message "DISK" "ERROR" "DISK_THRESHOLD is not configured"
    exit 1
fi

# Get disk usage percentage of the root filesystem
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk Usage: ${DISK_USAGE}%"

# Check disk usage against threshold
if (( DISK_USAGE >= DISK_THRESHOLD )); then
    echo "ALERT: Disk usage is above ${DISK_THRESHOLD}%"
    log_message "DISK" "ALERT" "Disk usage is above ${DISK_THRESHOLD}%"
else
    echo "INFO: Disk usage is within normal range"
    log_message "DISK" "INFO" "Disk usage is within normal range"
fi