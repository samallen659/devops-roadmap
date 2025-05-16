#!/usr/bin/env bash

echo "CPU USAGE"
CPU_FREE=$(top -bn1 | grep "Cpu(s)" | tr -s " " | cut -d " " -f 8)
echo "$CPU_FREE%"
echo

MEMORY=$(free -m | grep "Mem" | tr -s " ")
TOTAL_MEMORY=$(echo "$MEMORY" | cut -d ' ' -f 2)
USED_MEMORY=$(echo "$MEMORY" | cut -d ' ' -f 3)
USED_PERCENT=$(echo "scale=3;(($USED_MEMORY / $TOTAL_MEMORY) * 100)" | bc | sed 's/..$//')

echo "MEMORY USAGE"
echo -e "TOTAL: $TOTAL_MEMORY\tUSED_MEMORY: $USED_MEMORY\tUSED_PERCENT: $USED_PERCENT%"
echo
