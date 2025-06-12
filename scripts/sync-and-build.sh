# scripts/sync-and-build.sh
#!/usr/bin/env bash
set -e

# 切到專案根目錄
cd "$(dirname "$0")/.."

# 載入 .env 變數
export $(grep -v '^#' .env | xargs)

# 複製所有文件到 docs/
cp -R docs-src/. docs/

# 複製所有文件到 static/img/
cp -R docs-src/. static/img/

# 建置 Docusaurus
npm run build

# 將輸出複製到靜態伺服器目錄
cp -R build/* "$OUTPUT_PATH"

echo "✅ 本地同步 & Build 完成，輸出目錄：$OUTPUT_PATH"


