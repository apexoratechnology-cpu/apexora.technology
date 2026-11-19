# ==============================================================================
# 👉 PASTE YOUR GITHUB REPOSITORY URL BETWEEN THE QUOTES BELOW:
# Example: $GITHUB_REPO_URL = "https://github.com/your-username/apexora-tech.git"
# ==============================================================================
$GITHUB_REPO_URL = ""
# ==============================================================================

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
Write-Host "[*] Checking commit status..." -ForegroundColor Yellow
git commit -m "Deploy APEXORA.TECH official website" 2>$null

# Check origin URL
if ([string]::IsNullOrWhiteSpace($GITHUB_REPO_URL)) {
    $origin = git remote get-url origin 2>$null
    if (-not $origin) {
        Write-Host ""
        Write-Host "No remote GitHub repository linked yet." -ForegroundColor Yellow
        Write-Host "Please create a new repository on GitHub: https://github.com/new"
        $GITHUB_REPO_URL = Read-Host "Enter your GitHub Repository URL (e.g., https://github.com/username/repo.git)"
        if ([string]::IsNullOrWhiteSpace($GITHUB_REPO_URL)) {
            Write-Host "[ERROR] No URL entered. Aborting." -ForegroundColor Red
            Read-Host "Press Enter to exit"
            exit 1
        }
    }
}

if (-not [string]::IsNullOrWhiteSpace($GITHUB_REPO_URL)) {
    $origin = git remote get-url origin 2>$null
    if ($origin) {
        Write-Host "[*] Updating remote origin URL to: $GITHUB_REPO_URL" -ForegroundColor Yellow
        git remote set-url origin $GITHUB_REPO_URL.Trim()
    } else {
        Write-Host "[*] Adding remote origin: $GITHUB_REPO_URL" -ForegroundColor Yellow
        git remote add origin $GITHUB_REPO_URL.Trim()
    }
}

Write-Host ""
Write-Host "[*] Current Remote Origin:" -ForegroundColor Cyan
git remote -v

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
