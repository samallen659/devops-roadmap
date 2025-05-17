#!/usr/bin/env bash

echo "CPU Usage"
top -bn1 | grep "Cpu(s)" | awk '{printf "Used_Percent: %.2f%\n", $8}'
echo

echo "Memory Usage"
free | grep "Mem" | awk '{printf "Total: %.f\tUsed: %.f\tUsed_Percent: %.2f%\n", $2/1024, $3/1024, (($3/$2)*100)}'
echo

echo "Disk Usage"
df -h | grep '/' -w | awk '{printf "Total: %s\tUsed: %s\tUsed_Percent: %s\n", $2, $3, $5}'
echo

echo "Top 5 Processes by CPU"
ps aux --sort -%cpu | head -n6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'
echo

echo "Top 5 Processes by Memory"
ps aux --sort -%mem | head -n6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
