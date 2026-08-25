# Minecraft Unlocker Installer by errortechh
# Run: powershell -ExecutionPolicy Bypass -File install.ps1

$ErrorActionPreference = "Continue"
$Host.UI.RawUI.WindowTitle = "Minecraft Unlocker - Installer"

Write-Host ""
Write-Host "  ====================================================" -ForegroundColor Green
Write-Host "       MINECRAFT UNLOCKER - INSTALLER" -ForegroundColor Green
Write-Host "       by errortechh" -ForegroundColor Green
Write-Host "  ====================================================" -ForegroundColor Green
Write-Host ""

# --- Config ---
$installDir  = Join-Path $env:APPDATA "minecraft unlocker"
$payloadsDir = Join-Path $installDir "payloads"
$engineADir  = Join-Path $payloadsDir "engine_a"
$engineBDir  = Join-Path $payloadsDir "engine_b"
$releaseDL   = "https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download"
$repoRaw     = "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main"
$exeFile     = Join-Path $installDir "minecraft_unlocker.exe"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# --- Step 1: Create directories ---
Write-Host "[1/6] Creating install directories..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path $installDir  -Force | Out-Null
New-Item -ItemType Directory -Path $payloadsDir -Force | Out-Null
New-Item -ItemType Directory -Path $engineADir  -Force | Out-Null
New-Item -ItemType Directory -Path $engineBDir  -Force | Out-Null
Write-Host "       Done." -ForegroundColor White
Write-Host ""

# --- Step 2: Download exe ---
Write-Host "[2/6] Downloading Minecraft Unlocker..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri "$releaseDL/minecraft_unlocker.exe" -OutFile $exeFile -UseBasicParsing
    Write-Host "       Downloaded minecraft_unlocker.exe" -ForegroundColor White
} catch {
    Write-Host "       ERROR: Failed to download exe" -ForegroundColor Red
    Write-Host "       $($_.Exception.Message)" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}
Write-Host ""

# --- Step 3: Download background ---
Write-Host "[3/6] Downloading background image..." -ForegroundColor Cyan
try {
    $bgFile = Join-Path $installDir "premium_bg.png"
    Invoke-WebRequest -Uri "$releaseDL/premium_bg.png" -OutFile $bgFile -UseBasicParsing
    Write-Host "       Done." -ForegroundColor White
} catch {
    Write-Host "       Skipped - background download failed" -ForegroundColor Yellow
}
Write-Host ""

# --- Step 4: Write engine configs ---
Write-Host "[4/6] Setting up engine configs..." -ForegroundColor Cyan

$engineAContent = @'
{
    "name": "OnlineFix Method",
    "description": "winmm proxy + OnlineFix DLL hooks",
    "download_urls": {
        "winmm.dll": "BASEURL/engine_a/winmm.dll",
        "OnlineFix64.dll": "BASEURL/engine_a/OnlineFix64.dll",
        "OnlineFix.ini": "BASEURL/engine_a/OnlineFix.ini",
        "dlllist.txt": "BASEURL/engine_a/dlllist.txt"
    },
    "files": [
        {"src": "winmm.dll", "dst": "", "backup": true},
        {"src": "OnlineFix64.dll", "dst": "", "backup": false},
        {"src": "OnlineFix.ini", "dst": "", "backup": false},
        {"src": "dlllist.txt", "dst": "", "backup": false}
    ]
}
'@

$engineBContent = @'
{
    "name": "errortechh method",
    "description": "vcruntime proxy + isTrial patch",
    "download_urls": {
        "errortechunlocker.dll": "BASEURL/engine_b/errortechunlocker.dll",
        "vcruntime140_1.dll": "BASEURL/engine_b/vcruntime140_1.dll"
    },
    "files": [
        {"src": "vcruntime140_1.dll", "dst": "", "backup": true},
        {"src": "errortechunlocker.dll", "dst": "", "backup": false}
    ]
}
'@

# Replace placeholder with actual URL
$engineAContent = $engineAContent.Replace("BASEURL", $repoRaw)
$engineBContent = $engineBContent.Replace("BASEURL", $repoRaw)

$engineAContent | Set-Content -Path (Join-Path $engineADir "engine.json") -Encoding UTF8
$engineBContent | Set-Content -Path (Join-Path $engineBDir "engine.json") -Encoding UTF8
Write-Host "       Engine configs created." -ForegroundColor White
Write-Host ""

# --- Step 5: Create desktop shortcut ---
Write-Host "[5/6] Creating desktop shortcut..." -ForegroundColor Cyan
try {
    $WshShell = New-Object -ComObject WScript.Shell
    $desktopPath = [System.Environment]::GetFolderPath("Desktop")
    $shortcutFile = Join-Path $desktopPath "Minecraft Unlocker.lnk"
    $lnk = $WshShell.CreateShortcut($shortcutFile)
    $lnk.TargetPath = $exeFile
    $lnk.WorkingDirectory = $installDir
    $lnk.Description = "Minecraft Unlocker by errortechh"
    $lnk.Save()
    Write-Host "       Shortcut created on Desktop." -ForegroundColor White
} catch {
    Write-Host "       Could not create shortcut" -ForegroundColor Yellow
    Write-Host "       $($_.Exception.Message)" -ForegroundColor Yellow
}
Write-Host ""

# --- Step 6: Defender exclusion ---
Write-Host "[6/6] Adding Defender exclusion..." -ForegroundColor Cyan
try {
    Add-MpPreference -ExclusionPath $installDir -ErrorAction Stop
    Write-Host "       Done." -ForegroundColor White
} catch {
    Write-Host "       Skipped - needs admin or Defender disabled" -ForegroundColor Yellow
}
Write-Host ""

# Write first_run marker
"1" | Set-Content -Path (Join-Path $installDir ".first_run")

Write-Host ""
Write-Host "  ====================================================" -ForegroundColor Green
Write-Host "       INSTALLATION COMPLETE!" -ForegroundColor Green
Write-Host "" -ForegroundColor Green
Write-Host "       Installed to: $installDir" -ForegroundColor Green
Write-Host "       Desktop shortcut: Minecraft Unlocker" -ForegroundColor Green
Write-Host "" -ForegroundColor Green
Write-Host "       Press Enter to launch the unlocker..." -ForegroundColor Green
Write-Host "  ====================================================" -ForegroundColor Green
Write-Host ""

Read-Host

Start-Process -FilePath $exeFile
