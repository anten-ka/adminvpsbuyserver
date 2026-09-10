#!/bin/bash
cd "$(dirname "$0")" || exit 1
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin
git init -b main >/dev/null 2>&1
git add README.md skills
git commit -m "adminvps-vps-order: навык покупки VPS на AdminVPS + README" >/dev/null 2>&1
git branch -M adminvpsbuyserver
TOKEN=$(gh auth token 2>/dev/null)
if [ -z "$TOKEN" ]; then echo "NO_TOKEN"; exit 1; fi
git push -q "https://x-access-token:${TOKEN}@github.com/anten-ka/adminvpsbuyserver.git" adminvpsbuyserver:adminvpsbuyserver 2>&1 | grep -v "x-access-token" | tail -3
echo "PUSH_EXIT=$?"
git log --oneline -1
