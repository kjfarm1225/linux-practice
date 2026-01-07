#!/bin/bash

FILE="note.txt"

if [ -f "$FILE" ]; then
  echo "✅ $FILE は存在します"
else
  echo "❌ $FILE は存在しません（作成します）"
  echo "Day9: created by script" > "$FILE"
fi
