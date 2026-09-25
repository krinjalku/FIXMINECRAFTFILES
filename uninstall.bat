@echo off
echo ====================================
echo   Errorlauncher - Uninstaller
echo   by errortechh
echo ====================================
echo.

set INSTALL_DIR=%APPDATA%\errorlauncher
set OLD_DIR=%APPDATA%\minecraft unlocker

echo Removing install directory...
if exist "%INSTALL_DIR%" rmdir /s /q "%INSTALL_DIR%"
if exist "%OLD_DIR%" rmdir /s /q "%OLD_DIR%"

echo Removing desktop shortcuts...
if exist "%USERPROFILE%\Desktop\Errorlauncher.lnk" del /f "%USERPROFILE%\Desktop\Errorlauncher.lnk"
if exist "%USERPROFILE%\Desktop\Minecraft Unlocker.lnk" del /f "%USERPROFILE%\Desktop\Minecraft Unlocker.lnk"

echo Removing Defender exclusions...
powershell -NoProfile -Command "Remove-MpPreference -ExclusionPath '%INSTALL_DIR%' -ErrorAction SilentlyContinue" 2>nul
powershell -NoProfile -Command "Remove-MpPreference -ExclusionPath '%OLD_DIR%' -ErrorAction SilentlyContinue" 2>nul

echo.
echo ====================================
echo   Uninstall complete!
echo ====================================
echo.
pause
