# Day12 学習記録：変数を使ったログチェック

## 今日のテーマ
変数を使って、修正しやすいシェルスクリプトを書く

## 実施内容
- LOG_DIR にログの場所を設定
- KEYWORD に検索文字を設定
- RESULT_FILE に結果出力先を設定

## 使用スクリプト
```bash
#!/bin/bash

LOG_DIR="logs"
KEYWORD="ERROR"
RESULT_FILE="result.log"

for file in $LOG_DIR/*.log
do
  if grep -q "$KEYWORD" "$file"; then
    echo "NG: $file" >> "$RESULT_FILE"
  else
    echo "OK: $file" >> "$RESULT_FILE"
  fi
done

## 学んだこと
- 変数は「設定値のまとめ」
- 修正が1か所で済む
- 実務では必須の書き方

## day11との違い
- 処理は同じ
- 書き方が実務向けになった 
