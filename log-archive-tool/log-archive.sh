#!/usr/bin/env bash

if [ "$1" == '' ]; then
  echo ERROR: Path to logs required
  exit 1
fi

DATE_TIME=$(date +"%Y%m%d_%H%M%S")
FILE_NAME="logs_archive_$DATE_TIME.tar.gz"

tar czf "$FILE_NAME" "$1"

mv "$FILE_NAME" /var/log/"$FILE_NAME"
