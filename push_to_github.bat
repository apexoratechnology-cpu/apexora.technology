@echo off
setlocal enabledelayedexpansion

:: ==============================================================================
:: GITHUB REPOSITORY URL:
:: ==============================================================================
set "GITHUB_REPO_URL=https://github.com/apexoratechnology-cpu/apexora.technology.git"
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

:: Ensure remote origin is set
git remote get-url origin >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    git remote set-url origin %GITHUB_REPO_URL%
) else (
    git remote add origin %GITHUB_REPO_URL%
)

echo.
echo [*] Remote Origin: %GITHUB_REPO_URL%
echo [*] Pushing code to GitHub (branch: main)...
echo.

git push -u origin main
if %ERRORLEVEL% EQU 0 goto :success

echo.
echo -------------------------------------------------------------------
echo [*] Standard push was rejected because the remote GitHub repo
echo     already has an existing file (like a default README/License).
echo [*] Synchronizing with remote (git pull --rebase)...
echo -------------------------------------------------------------------
echo.

git pull origin main --rebase --allow-unrelated-histories
if %ERRORLEVEL% EQU 0 (
    echo [*] Rebase successful! Now pushing your website...
    git push -u origin main
    if !ERRORLEVEL! EQU 0 goto :success
)

echo.
echo -------------------------------------------------------------------
echo [*] Notice: Remote GitHub repository still has conflicting commits.
echo [*] For a newly created website repository, a force push replaces
echo     the blank template on GitHub with your complete website files.
echo -------------------------------------------------------------------
echo.
set /p FORCE_CHOICE="Do you want to overwrite the remote GitHub repo with your website files? (Y/N): "
if /i "!FORCE_CHOICE!"=="Y" (
    echo.
    echo [*] Force pushing website to GitHub...
    git push -u origin main --force
    if !ERRORLEVEL! EQU 0 goto :success
)

echo.
echo [!] Push could not be completed automatically.
echo Please check your GitHub permissions or credentials, or run:
echo     git push -u origin main --force
pause
exit /b 1

:success
echo.
echo ===================================================
echo [SUCCESS] Your website is successfully pushed to GitHub!
echo.
echo Next step: Enable GitHub Pages for free live hosting:
echo 1. Go to: https://github.com/apexoratechnology-cpu/apexora.technology/settings/pages
echo 2. Under 'Build and deployment' -^> 'Branch':
echo    Select 'main' and '/ (root)'
echo 3. Click 'Save'!
echo.
echo Your website will be live in 1-2 minutes at:
echo https://apexoratechnology-cpu.github.io/apexora.technology/
echo ===================================================
echo.
pause
