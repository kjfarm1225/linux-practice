#!/bin/bash

#引数を受け取る
LOG_DIR="$1"
KEYWORD="$2"
RESULT_FILE="result.log"

for file in $LOG_DIR/*.log
do
  if grep -q "$KEYWORD" "$file"; then
    echo "NG: $file" >> "$RESULT_FILE"
  else
    echo "OK: $file" >> "$RESULT_FILE"
  fi
done

