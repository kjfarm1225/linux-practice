# Day13 学習記録：引数を使ったログチェック

## 今日のテーマ
引数を使って、使い回せるスクリプトを書く

## 実施内容
- $1 でログディレクトリを受け取った
- $2 で検索キーワードを受け取った
- スクリプトを編集せずに使えるようになった

## 使用スクリプト
```bash
#!/bin/bash

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
