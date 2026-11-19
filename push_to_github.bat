@echo off
setlocal enabledelayedexpansion

:: ==============================================================================
:: 👉 PASTE YOUR GITHUB REPOSITORY URL BETWEEN THE QUOTES BELOW:
:: Example: set "GITHUB_REPO_URL=https://github.com/your-username/apexora-tech.git"
:: ==============================================================================
set "GITHUB_REPO_URL="
:: ==============================================================================

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

:: Commit if there are changes
echo [*] Checking commit status...
git commit -m "Deploy APEXORA.TECH official website" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [*] Committed changes successfully.
) else (
    echo [*] Working tree clean or changes already committed.
)

:: If GITHUB_REPO_URL was not pasted above, check if origin exists or prompt user
if "%GITHUB_REPO_URL%"=="" (
    git remote get-url origin >nul 2>nul
    if %ERRORLEVEL% NEQ 0 (
        echo.
        echo -------------------------------------------------------------------
        echo No GitHub URL specified in this file or configured in git.
        echo Please create an empty repository on GitHub: https://github.com/new
        echo -------------------------------------------------------------------
        echo.
        set /p GITHUB_REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/username/repo.git): "
        if "!GITHUB_REPO_URL!"=="" (
            echo.
            echo [ERROR] No GitHub URL provided. Aborting.
            pause
            exit /b 1
        )
    )
)

:: Set or update remote origin
if not "%GITHUB_REPO_URL%"=="" (
    git remote get-url origin >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        echo [*] Updating remote origin URL to: %GITHUB_REPO_URL%
        git remote set-url origin %GITHUB_REPO_URL%
    ) else (
        echo [*] Adding remote origin: %GITHUB_REPO_URL%
        git remote add origin %GITHUB_REPO_URL%
    )
)

echo.
echo [*] Current Remote Origin:
git remote -v
echo.
echo [*] Pushing code to GitHub (branch: main)...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===================================================
    echo [SUCCESS] Your code has been pushed to GitHub!
    echo.
    echo Next step: Enable GitHub Pages for free hosting:
    echo 1. Go to your repository on GitHub.com
    echo 2. Click Settings -^> Pages (in the left menu)
    echo 3. Under Branch, select 'main' and '/ (root)'
    echo 4. Click Save!
    echo ===================================================
) else (
    echo.
    echo [!] Push failed.
    echo If your GitHub repo already contains an existing README or commit,
    echo run this command to merge before pushing:
    echo     git pull origin main --rebase
    echo and then run this script again.
)

echo.
pause
