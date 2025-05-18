#!/usr/bin/env bash

if [ "$1" == "" ]; then
  echo ERROR: Path to nginx log required
  exit 1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1};' nginx.log | sort | uniq -c | sort -nr | head -n5 | awk '{printf "%s - %d requests\n", $2, $1}'
echo
