@echo off
:: Minecraft Unlocker - Uninstaller by errortechh
title Minecraft Unlocker - Uninstaller
color 0C

echo.
echo  ====================================================
echo       MINECRAFT UNLOCKER - UNINSTALLER
echo  ====================================================
echo.

set "INSTALL_DIR=%APPDATA%\minecraft unlocker"

if not exist "%INSTALL_DIR%" (
    echo  [!] Minecraft Unlocker is not installed.
    echo.
    pause
    exit /b
)

echo  [!] This will remove Minecraft Unlocker from your system.
echo      Install location: %INSTALL_DIR%
echo.
set /p confirm="  Are you sure? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo  Cancelled.
    pause
    exit /b
)

echo.
echo  [1/4] Closing Minecraft Unlocker...
taskkill /f /im minecraft_unlocker.exe >nul 2>&1
timeout /t 1 /nobreak >nul
echo        Done.

echo  [2/4] Removing install files...
rmdir /s /q "%INSTALL_DIR%" >nul 2>&1
echo        Removed install directory.

echo  [3/4] Removing key data...
if exist "%INSTALL_DIR%\.keydata" del /f /q "%INSTALL_DIR%\.keydata" >nul 2>&1
echo        Done.

echo  [4/4] Removing desktop shortcut...
powershell -NoProfile -Command "$desktop = [System.Environment]::GetFolderPath('Desktop'); $lnk = Join-Path $desktop 'Minecraft Unlocker.lnk'; if (Test-Path $lnk) { Remove-Item $lnk -Force; Write-Host '       Removed.' } else { Write-Host '       Not found (already removed).' }"

echo.
echo  ====================================================
echo       UNINSTALL COMPLETE
echo  ====================================================
echo.
pause
exit /b 0