#!/usr/bin/env bash

if [ "$1" == "" ]; then
  echo ERROR: Path to nginx log required
  exit 1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1};' nginx.log | sort | uniq -c | sort -nr | head -n5 | awk '{printf "%s - %d requests\n", $2, $1}'
echo

echo "Top 5 most requested paths:"
awk '$7 ~ /^\// {print $7};' nginx.log | sort | uniq -c | sort -nr | head -n5 | awk '{printf "%s - %d requests\n", $2, $1}'
echo

echo "Top 5 response status codes:"
awk '$9 ~ /^[0-9]{3}$/ {print $9}' nginx.log | sort -n | uniq -c | sort -nr | head -n5 | awk '{printf "%d - %d requests\n", $2, $1}'
