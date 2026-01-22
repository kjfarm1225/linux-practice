#!/bin/bash

# =====
# ①引数チェック
# =====
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "使い方：./check_logs.sh <log_dir> <keyword>"
  exit 1
fi

LOG_DIR="$1"
KEYWORD="$2"
RESULT_FILE="result.log"

# =====
# ②ディレクトリ存在チェック
# =====
if [ ! -d "$LOG_DIR" ]; then
  echo "エラー：ログディレクトリが存在しません -> $LOG_DIR"
  exit 1
fi

# =====
# ③.Logファイル存在チェック
# =====
if ! ls "$LOG_DIR"/*.log > /dev/null 2>&1; then
  echo "エラー：log ファイルが見つかりません -> $LOG_DIR"
  exit 1
fi

# =====
# ④ 結果ファイル初期化
# =====
> "$RESULT_FILE"

# =====
# ログ判定処理
# =====
for file in "$LOG_DIR"/*.log
do
  if grep -q "$KEYWORD" "$file"; then
    echo "NG: $file" >> "$RESULT_FILE"
  else
    echo "OK: $file" >> "$RESULT_FILE"
  fi
done
