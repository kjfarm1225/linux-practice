#!/bin/bash

DIR="logs"

if [ -d "$DIR" ]; then
    echo "✅ $DIR フォルダはすでにあります"
else
    echo "❌ $DIR フォルダがないので作成します"
    mkdir "$DIR"
fi

