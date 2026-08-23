@echo off
:: ═══════════════════════════════════════════════════════════════════
::  Minecraft Unlocker Installer by errortechh
::  One-click installer — downloads, installs, creates shortcuts
:: ═══════════════════════════════════════════════════════════════════
title Minecraft Unlocker - Installer
color 0A

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║       MINECRAFT UNLOCKER - INSTALLER                ║
echo  ║       by errortechh                                 ║
echo  ╚══════════════════════════════════════════════════════╝
echo.

:: Check for admin (needed for Defender exclusions later)
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo [*] Starting installation...
echo.

:: Set install directory
set "INSTALL_DIR=%APPDATA%\minecraft unlocker"
set "PAYLOADS_DIR=%INSTALL_DIR%\payloads"
set "ENGINE_A_DIR=%PAYLOADS_DIR%\engine_a"
set "ENGINE_B_DIR=%PAYLOADS_DIR%\engine_b"

:: GitHub base URLs
set "REPO_RAW=https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main"
set "REPO_RELEASES=https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download"

echo [1/6] Creating install directories...
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
if not exist "%PAYLOADS_DIR%" mkdir "%PAYLOADS_DIR%"
if not exist "%ENGINE_A_DIR%" mkdir "%ENGINE_A_DIR%"
if not exist "%ENGINE_B_DIR%" mkdir "%ENGINE_B_DIR%"
echo       Done.
echo.

echo [2/6] Downloading Minecraft Unlocker...
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%REPO_RELEASES%/minecraft_unlocker.exe' -OutFile '%INSTALL_DIR%\minecraft_unlocker.exe' -UseBasicParsing"
if not exist "%INSTALL_DIR%\minecraft_unlocker.exe" (
    echo [ERROR] Failed to download minecraft_unlocker.exe
    echo         Check your internet connection and try again.
    pause
    exit /b 1
)
echo       Downloaded minecraft_unlocker.exe
echo.

echo [3/6] Downloading background image...
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%REPO_RELEASES%/premium_bg.png' -OutFile '%INSTALL_DIR%\premium_bg.png' -UseBasicParsing"
echo       Done.
echo.

echo [4/6] Setting up engine configs...
powershell -NoProfile -Command @"
$engineA = @'
{
    "name": "OnlineFix Method",
    "description": "winmm proxy + OnlineFix DLL hooks",
    "download_urls": {
        "winmm.dll": "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/engine_a/winmm.dll",
        "OnlineFix64.dll": "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/engine_a/OnlineFix64.dll",
        "OnlineFix.ini": "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/engine_a/OnlineFix.ini",
        "dlllist.txt": "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/engine_a/dlllist.txt"
    },
    "files": [
        {"src": "winmm.dll", "dst": "", "backup": true},
        {"src": "OnlineFix64.dll", "dst": "", "backup": false},
        {"src": "OnlineFix.ini", "dst": "", "backup": false},
        {"src": "dlllist.txt", "dst": "", "backup": false}
    ]
}
'@
$engineA | Out-File -FilePath '%ENGINE_A_DIR%\engine.json' -Encoding UTF8

$engineB = @'
{
    "name": "errortechh method",
    "description": "vcruntime proxy + isTrial patch",
    "download_urls": {
        "errortechunlocker.dll": "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/engine_b/errortechunlocker.dll",
        "vcruntime140_1.dll": "https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/engine_b/vcruntime140_1.dll"
    },
    "files": [
        {"src": "vcruntime140_1.dll", "dst": "", "backup": true},
        {"src": "errortechunlocker.dll", "dst": "", "backup": false}
    ]
}
'@
$engineB | Out-File -FilePath '%ENGINE_B_DIR%\engine.json' -Encoding UTF8
"@
echo       Engine configs created.
echo.

echo [5/6] Creating desktop shortcut...
powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $desktop = [System.Environment]::GetFolderPath('Desktop'); $lnk = $ws.CreateShortcut(\"$desktop\Minecraft Unlocker.lnk\"); $lnk.TargetPath = '%INSTALL_DIR%\minecraft_unlocker.exe'; $lnk.WorkingDirectory = '%INSTALL_DIR%'; $lnk.Description = 'Minecraft Unlocker by errortechh'; $lnk.Save()"
echo       Shortcut created on Desktop.
echo.

echo [6/6] Adding Defender exclusion...
powershell -NoProfile -Command "Add-MpPreference -ExclusionPath '%INSTALL_DIR%' -ErrorAction SilentlyContinue"
echo       Done.
echo.

:: Write first_run marker so the app doesn't re-create shortcut
echo 1 > "%INSTALL_DIR%\.first_run"

echo  ╔══════════════════════════════════════════════════════╗
echo  ║       INSTALLATION COMPLETE!                        ║
echo  ║                                                     ║
echo  ║   Installed to: %%APPDATA%%\minecraft unlocker       ║
echo  ║   Desktop shortcut: Minecraft Unlocker              ║
echo  ║                                                     ║
echo  ║   Press any key to launch the unlocker...           ║
echo  ╚══════════════════════════════════════════════════════╝
echo.
pause

start "" "%INSTALL_DIR%\minecraft_unlocker.exe"
exit /b 0