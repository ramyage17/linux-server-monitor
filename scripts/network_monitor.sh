#!/bin/bash

# Host used to test network connectivity
TARGET_HOST="192.0.2.1"

echo "Checking network connectivity..."

# Send 3 ping packets and check the result
if ping -c 3 -W 2 "$TARGET_HOST" > /dev/null 2>&1; then
    echo "Network Status: CONNECTED"
    echo "INFO: Network connectivity is available"
else
    echo "Network Status: DISCONNECTED"
    echo "ALERT: Network connectivity is unavailable"
fi