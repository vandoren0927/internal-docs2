#!/usr/bin/env bash
set -e

# 读取 .env
export $(grep -v '^#' ../.env | xargs)

# 同步 docs-src 到 docs
rsync -av --prune-empty-dirs \
  --include='*/' --include='*.md' --exclude='*' \
  docs-src/ docs/

# 同步多媒体到 static/img
rsync -av --prune-empty-dirs \
  --include='*/' --include='*.png' --include='*.jpg' \
  --include='*.gif' --include='*.mp4' --exclude='*' \
  docs-src/ static/img/

# 本地 build
yarn build

# （可选）复制到本地静态服务器目录
cp -R build/* "$OUTPUT_PATH"

echo "✅ 本地同步 & Build 完成，输出目录：$OUTPUT_PATH"
