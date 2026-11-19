$GITHUB_REPO_URL = "https://github.com/apexoratechnology-cpu/apexora.technology.git"

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "         APEXORA.TECH - Push to GitHub" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Git is not installed or not in your PATH." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

if (-not (Test-Path ".git")) {
    Write-Host "[*] Initializing Git repository..." -ForegroundColor Yellow
    git init
    git branch -M main
}

Write-Host "[*] Staging files..." -ForegroundColor Yellow
git add .

Write-Host "[*] Checking commit status..." -ForegroundColor Yellow
git commit -m "Deploy APEXORA.TECH official website" 2>$null

$origin = git remote get-url origin 2>$null
if ($origin) {
    git remote set-url origin $GITHUB_REPO_URL
} else {
    git remote add origin $GITHUB_REPO_URL
}

Write-Host "[*] Remote Origin: $GITHUB_REPO_URL" -ForegroundColor Cyan
Write-Host "[*] Pushing to GitHub (branch: main)..." -ForegroundColor Yellow

git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[*] Standard push was rejected because remote has existing commits/README." -ForegroundColor Yellow
    Write-Host "[*] Attempting rebase pull (git pull origin main --rebase)..." -ForegroundColor Yellow
    git pull origin main --rebase --allow-unrelated-histories
    git push -u origin main
}

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[*] For a newly created repository, force push will overwrite the blank README with your website files." -ForegroundColor Yellow
    $force = Read-Host "Do you want to force push your website to GitHub? (Y/N)"
    if ($force -eq 'Y' -or $force -eq 'y') {
        git push -u origin main --force
    }
}

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "===================================================" -ForegroundColor Green
    Write-Host "[SUCCESS] Pushed successfully to GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next step: Enable GitHub Pages for free hosting:" -ForegroundColor Cyan
    Write-Host "1. Go to: https://github.com/apexoratechnology-cpu/apexora.technology/settings/pages"
    Write-Host "2. Under Branch, select 'main' and '/ (root)'"
    Write-Host "3. Click Save!"
    Write-Host ""
    Write-Host "Your live website will be at:" -ForegroundColor Green
    Write-Host "https://apexoratechnology-cpu.github.io/apexora.technology/" -ForegroundColor Green
    Write-Host "===================================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "[!] Push could not be completed. You can run manually:" -ForegroundColor Red
    Write-Host "    git push -u origin main --force" -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press Enter to exit"
