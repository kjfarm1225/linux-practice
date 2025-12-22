# Day5 学習記録：ログ操作・エラー解析（応用編）

## 📅 学習日
2024-12-xx

## 📂 作業ディレクトリ
~/linux-practice/day5

yaml
コードをコピーする

---

## 🎯 今日の学習目的

- ログファイルを使った **実務レベルの調査操作** を身につける
- エラーの抽出・保存・件数確認・リアルタイム監視を理解する
- 標準出力 / 標準エラー / リダイレクトの考え方を理解する

---

## 📝 使用したサンプルログ

```text
2024-12-01 10:00 INFO  Server started
2024-12-01 10:01 INFO  User login success
2024-12-01 10:02 ERROR Database connection failed
2024-12-01 10:03 WARN  Disk usage high
2024-12-01 10:04 ERROR Timeout occurred
2024-12-01 10:05 INFO  Request completed
2024-12-01 10:06 ERROR File not found
2024-12-01 10:07 INFO  Logout success
🔍 実施した主なコマンド
1️⃣ ログ全体の確認
bash
コードをコピーする
cat app.log
ファイル内容をすべて表示

調査前の基本動作

2️⃣ ERROR のみ抽出
bash
コードをコピーする
grep "ERROR" app.log
障害発生箇所の特定

3️⃣ ERROR をファイルに保存
bash
コードをコピーする
grep "ERROR" app.log > error.log
> は上書き保存

エラー報告用ログの作成

4️⃣ WARN と ERROR を同時に抽出
bash
コードをコピーする
grep -E "ERROR|WARN" app.log
OR 条件検索

実務で非常によく使う

5️⃣ ERROR 件数のカウント
bash
コードをコピーする
grep "ERROR" app.log | wc -l
障害件数の集計

6️⃣ ERROR 以外を表示
bash
コードをコピーする
grep -v "ERROR" app.log
正常ログのみ確認したいとき

7️⃣ 行番号付きで ERROR 表示
bash
コードをコピーする
grep -n "ERROR" app.log
報告・解析時に便利

8️⃣ 大文字・小文字を区別しない検索
bash
コードをコピーする
grep -i "error" app.log
ERROR / Error / error の揺れ対策

9️⃣ 最新ログのみ表示
bash
コードをコピーする
tail -n 3 app.log
直近のログ確認（超頻出）

🔟 リアルタイム監視（疑似）
bash
コードをコピーする
tail -f app.log | grep "ERROR"
障害監視の基本形

終了は Ctrl + C

⚠️ 標準出力・標準エラーの理解
エラーだけをファイルに保存
bash
コードをコピーする
ls nofile.txt 2> err.log
記号	意味
>	標準出力
2>	標準エラー
>>	追記

🧠 学んだ重要ポイント
grep はログ調査の主役

|（パイプ）はコマンドをつなぐ

tail -f は監視コマンド

エラーは 保存・件数・抽出 が基本

ログ解析は「読む → 探す → 分ける」

✅ 今日できるようになったこと
エラーログの抽出と保存

エラー件数の集計

リアルタイムログ監視

標準出力と標準エラーの違い理解

🚀 次の学習予定
Day6：find × grep（大量ログ検索）

Day7：ログ集計・頻出エラー分析

実務想定トラブルシューティング演習

✍️ ひとことメモ
Linux だけで「調査 → 抽出 → 報告」までできる感覚が少し分かった。