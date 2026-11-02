#!/bin/bash

# Load monitoring thresholds
source "$(dirname "$0")/../config/thresholds.conf"

# Load centralized logging function
source "$(dirname "$0")/logger.sh"

# Get current CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Remove decimal places
CPU_USAGE=${CPU_USAGE%.*}

echo "CPU Usage: ${CPU_USAGE}%"

# Check CPU usage against threshold
if (( CPU_USAGE >= CPU_THRESHOLD )); then
    echo "ALERT: CPU usage is above ${CPU_THRESHOLD}%"
    log_message "CPU" "ALERT" "CPU usage is above ${CPU_THRESHOLD}%"
else
    echo "INFO: CPU usage is within normal range"
    log_message "CPU" "INFO" "CPU usage is within normal range"
fi