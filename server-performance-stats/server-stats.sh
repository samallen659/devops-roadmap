#!/usr/bin/env bash

CPU_FREE=$(top -bn1 | grep "Cpu(s)" | tr -s " " | cut -d " " -f 8)
echo $CPU_FREE
