@echo off
:: Minecraft Unlocker Installer - Launcher
:: Downloads and runs the PowerShell installer
title Minecraft Unlocker - Installer
color 0A

echo.
echo  [*] Starting Minecraft Unlocker Installer...
echo.

:: Download the PS1 installer from GitHub and run it
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ps1 = Join-Path $env:TEMP 'mc_unlocker_install.ps1'; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/install.ps1' -OutFile $ps1 -UseBasicParsing; & $ps1; Remove-Item $ps1 -Force -ErrorAction SilentlyContinue"

if %errorLevel% neq 0 (
    echo.
    echo  [ERROR] Installation failed. Check your internet connection.
    echo.
    pause
)