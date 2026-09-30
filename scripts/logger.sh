#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${SCRIPT_DIR}/../logs/monitoring.log"

log_message() {
    local component="$1"
    local level="$2"
    local message="$3"

    echo "$(date '+%Y-%m-%d %H:%M:%S') | ${component} | ${level} | ${message}" >> "$LOG_FILE"
}