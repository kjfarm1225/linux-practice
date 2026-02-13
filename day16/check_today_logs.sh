#!/bin/bash

# =========================
# ① 今日の日付取得
# =========================
TODAY=$(date +%Y%m%d)

LOG_DIR="logs/$TODAY"
KEYWORD="$1"
RESULT_FILE="result.log"

# =========================
# ② 引数チェック
# =========================
if [ -z "$KEYWORD" ]; then
    echo "使い方: ./check_today_logs.sh <keyword>"
    exit 1
fi

# =========================
# ③ ディレクトリ存在チェック
# =========================
if [ ! -d "$LOG_DIR" ]; then
    echo "エラー：今日のログフォルダがありません -> $LOG_DIR"
    exit 1
fi

# =========================
# ④ log ファイル存在チェック
# =========================
if ! ls "$LOG_DIR"/*.log > /dev/null 2>&1; then
    echo "エラー：log ファイルがありません -> $LOG_DIR"
   exit 1
fi

# =========================
# ⑤ 結果初期化
# =========================
> "$RESULT_FILE"

# =========================
# ⑥ 判定処理
# =========================
for file in "$LOG_DIR"/*.log

do
    if grep -q "$KEYWORD" "$file"; then
        echo "NG: $file" >> "$RESULT_FILE"
    else
        echo "OK: $file" >> "$RESULT_FILE"
    fi
done

echo "完了：result.log に出力しました"
