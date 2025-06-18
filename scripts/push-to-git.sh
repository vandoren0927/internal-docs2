# scripts/push-to-git.sh
#!/usr/bin/env bash
set -e

# 切到專案根目錄
cd "$(dirname "$0")/.."

# 載入 .env 變數
export $(grep -v '^#' .env | xargs)

# 新增 docs/ 和 static/img/ 的所有變更
git add docs/ static/img/

# 提交並附帶時間戳
npm run commit

# 推送到遠端
git push "$GIT_REMOTE" HEAD:"$GIT_BRANCH"

echo "✅ 已推送至 $GIT_REMOTE 分支 $GIT_BRANCH"
