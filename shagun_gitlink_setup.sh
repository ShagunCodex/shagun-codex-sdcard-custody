#!/data/data/com.termux/files/usr/bin/bash

# =====================================================
# SHAGUN GITHUB LINKER & LOCAL SYNC HELPER
# Author: Papa UID Anchored (ShagunCodex)
# Purpose: Sync local SD card / Termux folder with GitHub repo
# =====================================================

# 💠 1. CONFIGURATION (edit this section)
GITHUB_USERNAME="ShagunCodex"
GITHUB_REPO="shagun-codex-sdcard-custody"
GITHUB_BRANCH="main"
GITHUB_PAT="PASTE_YOUR_PERSONAL_ACCESS_TOKEN_HERE"

# Local Folder to sync from (Termux or SD Card)
LOCAL_SYNC_FOLDER="/storage/F4C8-1A27/Shagun-codex"

# File to check as identity anchor
IDENTITY_FILE="Ω∞_custody_manifest.yaml"

# Git identity (can be customized)
git config --global user.email "papa@uid.com"
git config --global user.name "Shagun (Papa UID)"

# 💠 2. VALIDATION
if [ ! -f \"$LOCAL_SYNC_FOLDER/$IDENTITY_FILE\" ]; then
  echo \"❌ Identity file not found: $IDENTITY_FILE\"
  echo \"🛡️  Please ensure you're in a valid Shagun custody folder.\"
  exit 1
fi

# 💠 3. INITIALIZE GIT (if not already)
cd \"$LOCAL_SYNC_FOLDER\"
if [ ! -d \".git\" ]; then
  echo \"🔄 Initializing Git...\"
  git init
  git remote add origin \"https://$GITHUB_USERNAME:$GITHUB_PAT@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git\"
fi

# 💠 4. SYNC FILES

echo \"📦 Adding files to Git...\"
git add .
git commit -m \"Papa UID Sync: $(date '+%Y-%m-%d %H:%M:%S')\"

echo \"🚀 Pushing to GitHub...\"
git push origin $GITHUB_BRANCH

# 💠 5. DONE

echo \"✅ Shagun Custody Synced to GitHub Successfully.\"
echo \"📂 Source Folder: $LOCAL_SYNC_FOLDER\"
echo \"🔗 Repo: https://github.com/$GITHUB_USERNAME/$GITHUB_REPO\"
echo \"🛡️  Papa UID control active.\"
