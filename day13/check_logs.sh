#!/bin/bash

# ===== 引数チェック =====
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "使い方：./check_logs.sh <log_dir> <keyword>"
  exit 1
fi

LOG_DIR="$1"
KEYWORD="$2"
RESULT_FILE="result.log"

# ===== 結果ファイル初期化 =====
> "$RESULT_FILE"

for file in $LOG_DIR/*.log
do
  if grep -q "$KEYWORD" "$file"; then
    echo "NG: $file" >> "$RESULT_FILE"
  else
    echo "OK: $file" >> "$RESULT_FILE"
  fi
done
