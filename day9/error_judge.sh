#!/bin/bash

# Day6 のログを対象にする（存在しない場合に備えて相対パス）
TARGET="../day6/logs/*.log"

# ERROR件数を数える
COUNT=$(grep "ERROR" $TARGET | wc -l)

echo "ERROR 件数:$COUNT"

# もし3件以上なら危険、そうでなければOK
if [ "$COUNT" -ge 3 ]; then
    echo "🚨 NG：ERROR が多いです（要確認）"
else
    echo "✅ OK：ERROR は少なめです"
fi

