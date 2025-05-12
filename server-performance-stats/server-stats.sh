#!/usr/bin/env bash

echo "CPU USAGE"
CPU_FREE=$(top -bn1 | grep "Cpu(s)" | tr -s " " | cut -d " " -f 8)
echo "$CPU_FREE%"
echo ""

MEMORY=$(free -m | grep Mem | tr -s " ")
