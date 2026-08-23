@echo off
:: Minecraft Unlocker - Uninstaller
title Minecraft Unlocker - Uninstaller
color 0C

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║       MINECRAFT UNLOCKER - UNINSTALLER              ║
echo  ╚══════════════════════════════════════════════════════╝
echo.

set "INSTALL_DIR=%APPDATA%\minecraft unlocker"

if not exist "%INSTALL_DIR%" (
    echo [!] Minecraft Unlocker is not installed.
    pause
    exit /b
)

echo [!] This will remove Minecraft Unlocker from your system.
echo     Install location: %INSTALL_DIR%
echo.
set /p confirm="Are you sure? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo Cancelled.
    pause
    exit /b
)

echo.
echo [1/3] Closing Minecraft Unlocker...
taskkill /f /im minecraft_unlocker.exe >nul 2>&1
timeout /t 1 /nobreak >nul

echo [2/3] Removing files...
rmdir /s /q "%INSTALL_DIR%" >nul 2>&1
echo       Removed install directory.

echo [3/3] Removing desktop shortcut...
del "%USERPROFILE%\Desktop\Minecraft Unlocker.lnk" >nul 2>&1
echo       Done.

echo.
echo  ╔══════════════════════════════════════════════════════╗
echo  ║       UNINSTALL COMPLETE                            ║
echo  ╚══════════════════════════════════════════════════════╝
echo.
pause
exit /b 0