#!/bin/bash

# Load monitoring thresholds
source "$(dirname "$0")/../config/thresholds.conf"

# Get memory usage percentage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2) * 100}')

echo "Memory Usage: ${MEMORY_USAGE}%"

# Check memory usage against threshold
if (( MEMORY_USAGE >= MEMORY_THRESHOLD )); then
    echo "ALERT: Memory usage is above ${MEMORY_THRESHOLD}%"
else
    echo "INFO: Memory usage is within normal range"
fi