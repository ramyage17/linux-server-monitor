#!/bin/bash

#Get current CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

#Remove deciaml places
CPU_USAGE=${CPU_USAGE%.*}

echo "CPU Usage: ${CPU_USAGE}%"

#Load monitoring thresholds
source "$(dirname "$0")/../config/thresholds.conf"


#Check CPU usage against threshold
if ((CPU_USAGE >= CPU_THRESHOLD));
then
 echo "ALERT : CPU usange is above ${CPU_THRESHOLD}%"
 else
  echo "INFO : CPU usage is within normal range"
  fi