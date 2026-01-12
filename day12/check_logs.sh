#!/bin/bash

LOG_DIR="logs"
KEYWORD="INFO"
RESULT_FILE="today_result.log"

for file in $LOG_DIR/*.log
do
    if grep -q "$KEYWORD" "$file"; then
        echo "NG: $file" >> "$RESULT_FILE"
    else
        echo "OK: $file" >> "$RESULT_FILE"
    fi
done
