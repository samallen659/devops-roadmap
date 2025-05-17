#!/usr/bin/env bash

echo "CPU Usage"
CPU_FREE=$(top -bn1 | grep "Cpu(s)" | tr -s " " | cut -d " " -f 8)
echo "$CPU_FREE%"
echo

echo "Memory Usage"
free | grep "Mem" | awk '{printf "Total: %.f\tUsed: %.f\tUsed_Percent: %.2f%\n", $2/1024, $3/1024, (($3/$2)*100)}'
echo

DISK_USAGE=$(df -h | grep "/" -w)
TOTAL_DISK=$(echo $DISK_USAGE | cut -d " " -f 2)
USED_DISK=$(echo $DISK_USAGE | cut -d " " -f 3)
DISK_PERCENT=$(echo $DISK_USAGE | cut -d " " -f 5)

echo "Disk Usage"
echo -e "TOTAL: $TOTAL_DISK\tUSED: $USED_DISK\tUSED_PERCENT: $DISK_PERCENT"
echo

echo "Top 5 Processes by CPU"
ps aux --sort -%cpu | head -n6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'
echo

echo "Top 5 Processes by Memory"
ps aux --sort -%mem | head -n6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
