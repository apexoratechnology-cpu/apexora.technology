@echo off
setlocal enabledelayedexpansion

echo ===================================================
echo         APEXORA.TECH - Push to GitHub
echo ===================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed or not found in PATH!
    echo Please download and install Git from https://git-scm.com/
    pause
    exit /b 1
)

:: Check if .git directory exists, if not initialize
if not exist ".git" (
    echo [*] Initializing Git repository...
    git init
    git branch -M main
)

:: Stage all files
echo [*] Staging all files...
git add .

:: Commit
echo [*] Committing files...
git commit -m "Deploy APEXORA.TECH official website" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [*] Working tree clean or changes already committed.
)

:: Check remote origin
git remote get-url origin >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo No remote GitHub repository linked yet.
    echo Please create a new empty repository at https://github.com/new
    echo.
    set /p REPO_URL="Enter your GitHub Repository URL (e.g., https://github.com/username/repo.git): "
    if "!REPO_URL!"=="" (
        echo [ERROR] No URL provided. Aborting.
        pause
        exit /b 1
    )
    git remote add origin !REPO_URL!
)

echo.
echo [*] Pushing to GitHub (branch: main)...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===================================================
    echo [SUCCESS] Your code has been pushed to GitHub!
    echo.
    echo Next step: Enable GitHub Pages for free hosting:
    echo 1. Go to your repo on GitHub.com
    echo 2. Go to Settings -^> Pages
    echo 3. Under Branch, select 'main' and '/ (root)'
    echo 4. Click Save!
    echo ===================================================
) else (
    echo.
    echo [!] Push failed. If the remote repository already contains commits,
    echo     try: git pull origin main --rebase
    echo     and then run this script again.
)

echo.
pause

