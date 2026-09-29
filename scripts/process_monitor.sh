#!/bin/bash

# Load monitoring configuration
source "$(dirname "$0")/../config/thresholds.conf"

echo "Monitoring process: ${PROCESS_NAME}"

# Check whether the process is running
if pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Status: RUNNING"
    echo "INFO: ${PROCESS_NAME} process is running normally"
else
    echo "Status: NOT RUNNING"
    echo "ALERT: ${PROCESS_NAME} process is not running"
fi