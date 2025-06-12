#!/usr/bin/env bash
set -e

# 读取 .env
export $(grep -v '^#' ../.env | xargs)

# 添加 docs/ 和 static/img/ 的所有改动
git add docs/ static/img/

# 提交并附带时间戳
git commit -m "docs: sync update $(date '+%Y-%m-%d %H:%M')"

# 推送到远端
git push "$GIT_REMOTE" HEAD:"$GIT_BRANCH"

echo "✅ 已推送至 $GIT_REMOTE 分支 $GIT_BRANCH"
