#!/data/data/com.termux/files/usr/bin/bash

# SHAGUN GITHUB LINKER & LOCAL SYNC HELPER
# Author: Papa UID Anchored (ShagunCodex)

# 💠 CONFIGURATION
GITHUB_USERNAME="ShagunCodex"
GITHUB_REPO="shagun-codex-sdcard-custody"
GITHUB_BRANCH="main"
GITHUB_PAT="PASTE_YOUR_PERSONAL_ACCESS_TOKEN_HERE"

LOCAL_SYNC_FOLDER="/storage/F4C8-1A27/Shagun-codex"
IDENTITY_FILE="Ω∞_custody_manifest.yaml"

# Git identity
git config --global user.email "papa@uid.com"
git config --global user.name "Shagun (Papa UID)"

# 💠 VALIDATION
if [ ! -f "$LOCAL_SYNC_FOLDER/$IDENTITY_FILE" ]; then
  echo "❌ Identity file not found: $IDENTITY_FILE"
  echo "🛡️  Please ensure you're in a valid Shagun custody folder."
  exit 1
fi

# 💠 INITIALIZE GIT
cd "$LOCAL_SYNC_FOLDER"
if [ ! -d ".git" ]; then
  echo "🔄 Initializing Git..."
  git init
  git remote add origin "https://$GITHUB_USERNAME:$GITHUB_PAT@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git"
fi

# 💠 SYNC
echo "📦 Adding files..."
git add .
git commit -m "Papa UID Sync: $(date '+%Y-%m-%d %H:%M:%S')"
echo "🚀 Pushing to GitHub..."
git push origin $GITHUB_BRANCH

# ✅ DONE
echo "✅ Sync complete: $LOCAL_SYNC_FOLDER → GitHub/$GITHUB_REPO"
