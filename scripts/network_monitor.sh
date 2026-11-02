#!/bin/bash

# Load centralized logging function
source "$(dirname "$0")/logger.sh"

# Host used to test network connectivity
TARGET_HOST="8.8.8.8"

echo "Checking network connectivity..."

# Send 3 ping packets and check the result
if ping -c 3 -W 2 "$TARGET_HOST" > /dev/null 2>&1; then
    echo "Network Status: CONNECTED"
    echo "INFO: Network connectivity is available"
    log_message "NETWORK" "INFO" "Network connectivity is available"
else
    echo "Network Status: DISCONNECTED"
    echo "ALERT: Network connectivity is unavailable"
    log_message "NETWORK" "ALERT" "Network connectivity is unavailable"
fi