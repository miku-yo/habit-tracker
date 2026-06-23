# Habit Tracker - GitHub Pages setup
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$GH_USER = "miku-yo"
$REPO = "habit-tracker"
$PAGES_URL = "https://$GH_USER.github.io/$REPO/"

Write-Host ""
Write-Host "Habit Tracker - GitHub Pages"
Write-Host "============================"
Write-Host ""
Write-Host "Fixed URL: $PAGES_URL"
Write-Host ""

if (-not (Test-Path .git)) { git init }

git add .
$status = git status --porcelain
if ($status) {
  git commit -m "Publish habit tracker to GitHub Pages"
} else {
  Write-Host "No changes to commit."
}

git branch -M main

git remote remove origin 2>$null
git remote add origin "https://github.com/$GH_USER/$REPO.git"

Write-Host "Uploading to GitHub..."
git push -u origin main

if ($LASTEXITCODE -ne 0) {
  Write-Host ""
  Write-Host "Push failed. Check:"
  Write-Host "  - Repo exists: https://github.com/$GH_USER/$REPO"
  Write-Host "  - You are logged in to GitHub (browser may open)"
  Read-Host "Press Enter to exit"
  exit 1
}

$PAGES_URL | Out-File -FilePath "public-url.txt" -Encoding utf8

Write-Host ""
Write-Host "Upload done!"
Write-Host ""
Write-Host "Last step (once):"
Write-Host "  1. Open: https://github.com/$GH_USER/$REPO/settings/pages"
Write-Host "  2. Build and deployment > Source > GitHub Actions"
Write-Host "  3. Wait 2-3 minutes"
Write-Host ""
Write-Host "Your URL: $PAGES_URL"
Write-Host ""

Start-Process "https://github.com/$GH_USER/$REPO/settings/pages"
Read-Host "Press Enter to exit"
