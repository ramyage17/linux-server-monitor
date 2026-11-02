#!/bin/bash

# Load centralized logging function
source "$(dirname "$0")/logger.sh"

# Get system uptime
UPTIME=$(uptime -p)

echo "System Uptime: ${UPTIME}"

# Display and record monitoring status
echo "INFO: System uptime monitoring completed successfully"
log_message "UPTIME" "INFO" "System uptime: ${UPTIME}"