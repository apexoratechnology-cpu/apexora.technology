Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "         APEXORA.TECH - Push to GitHub" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan
Write-Host ""

# Check if git exists
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Git is not installed or not in your PATH." -ForegroundColor Red
    Write-Host "Please download Git from https://git-scm.com/ and install it."
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "[*] Initializing Git repository..." -ForegroundColor Yellow
    git init
    git branch -M main
}

# Stage all files
Write-Host "[*] Staging files..." -ForegroundColor Yellow
git add .

# Commit
Write-Host "[*] Committing files..." -ForegroundColor Yellow
git commit -m "Deploy APEXORA.TECH official website" 2>$null

# Check origin
$origin = git remote get-url origin 2>$null
if (-not $origin) {
    Write-Host ""
    Write-Host "No remote GitHub repository linked yet." -ForegroundColor Yellow
    Write-Host "Please create a new repository on GitHub: https://github.com/new"
    $repoUrl = Read-Host "Enter your GitHub Repository URL (e.g., https://github.com/username/repo.git)"
    if ([string]::IsNullOrWhiteSpace($repoUrl)) {
        Write-Host "[ERROR] No URL entered. Aborting." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    git remote add origin $repoUrl.Trim()
}

Write-Host ""
Write-Host "[*] Pushing to GitHub (branch: main)..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "===================================================" -ForegroundColor Green
    Write-Host "[SUCCESS] Pushed successfully to GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next step: Enable GitHub Pages for free hosting:" -ForegroundColor Cyan
    Write-Host "1. Go to your repo on GitHub.com"
    Write-Host "2. Go to Settings -> Pages"
    Write-Host "3. Under Branch, select 'main' and '/ (root)'"
    Write-Host "4. Click Save!"
    Write-Host "===================================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "[!] Push failed. If the repo already has commits, run:" -ForegroundColor Red
    Write-Host "    git pull origin main --rebase"
    Write-Host "    and run this script again."
}

Write-Host ""
Read-Host "Press Enter to exit"
