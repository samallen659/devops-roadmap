#!/usr/bin/env bash

echo "CPU Usage"
CPU_FREE=$(top -bn1 | grep "Cpu(s)" | tr -s " " | cut -d " " -f 8)
echo "$CPU_FREE%"
echo

MEMORY=$(free -m | grep "Mem" | tr -s " ")
TOTAL_MEMORY=$(echo "$MEMORY" | cut -d ' ' -f 2)
USED_MEMORY=$(echo "$MEMORY" | cut -d ' ' -f 3)
MEMORY_PERCENT=$(echo "scale=3;(($USED_MEMORY / $TOTAL_MEMORY) * 100)" | bc | sed 's/..$//')

echo "Memory Usage"
echo -e "TOTAL: $TOTAL_MEMORY\tUSED: $USED_MEMORY\tUSED_PERCENT: $MEMORY_PERCENT%"
echo

DISK_USAGE=$(df -h | grep "/" -w)
TOTAL_DISK=$(echo $DISK_USAGE | cut -d " " -f 2)
USED_DISK=$(echo $DISK_USAGE | cut -d " " -f 3)
DISK_PERCENT=$(echo $DISK_USAGE | cut -d " " -f 5)

echo "Disk Usage"
echo -e "TOTAL: $TOTAL_DISK\tUSED: $USED_DISK\tUSED_PERCENT: $DISK_PERCENT"
echo

echo "Top 5 Processes by Memory"
ps aux --sort -%mem | head -n6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
