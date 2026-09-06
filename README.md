# Minecraft Unlocker by errortechh

A powerful tool to unlock Minecraft for Windows (Bedrock Edition) with multi-engine support, SHA256 verification, offline caching, ARM64 support, and 13-language UI.

## 🚀 Quick Install

1. Download [`mc_installer.exe`](https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download/mc_installer.exe)
2. Run it (right-click → **Run as Administrator** for best results)
3. Done! Everything is set up automatically.

## 📦 What the Installer Does

- Downloads `minecraft_unlocker.exe` to `%APPDATA%\minecraft unlocker\`
- Sets up engine configs for three unlock methods:
  - **Engine A — OnlineFix Method** — winmm proxy + OnlineFix DLL hooks
  - **Engine B — errortechh Method** — vcruntime proxy + isTrial patch
  - **Engine C — winmm.dll Method** — winmm proxy + license hook (x64/ARM64)
- Creates a **desktop shortcut**
- Adds Windows Defender exclusion
- Launches the unlocker when done

## 🎮 Three Unlock Engines

| Engine | Method | Architecture | Source |
|--------|--------|-------------|--------|
| **Engine A** | OnlineFix winmm proxy | x64 | OnlineFix DLLs |
| **Engine B** | vcruntime proxy + isTrial patch | x64 | Custom errortechh DLLs |
| **Engine C** | winmm.dll license hook | x64 + ARM64 | CoelhoFZ method |

> **Engine C** auto-detects your game's architecture (x64 vs ARM64) and downloads the correct DLL automatically.

## 🔑 Key System

The unlocker uses a key system to verify access:

1. Open the unlocker — you'll see a **"KEY REQUIRED"** screen with your **HWID**
2. Click **"Get Key"** — completes the verification process via work.ink
3. After completing the tasks, you'll receive a **16-character key** locked to your machine
4. Paste the key in the app and click **"Activate"**
5. The key is valid for **7 days**, then you'll need a new one

> **Note:** Each key is locked to your machine's HWID (Hardware ID). Keys cannot be shared between different computers.

## 🛡️ Security & Integrity

- **SHA256 Hash Verification** — every downloaded DLL is verified against expected hashes before installation
- **HWID-locked keys** — keys only work on the machine they were generated for
- **Token-gated access** — key page requires a valid work.ink completion token
- **Encrypted URLs** — all sensitive URLs are XOR-encrypted in the binary
- **Anti-debug** — detects debuggers, reverse engineering tools, and VMs
- **Embedded assets** — background image compiled into the exe, no external downloads needed

## 💾 Offline Cache

After the first successful download, all validated DLL files are cached locally in `%APPDATA%\minecraft unlocker\cache\`. If GitHub is unreachable or a download fails, the unlocker automatically falls back to the cached version — so it works offline too.

## 🏗️ ARM64 Support

Engine C supports **Windows on ARM (ARM64)** natively. The unlocker reads the PE header of `Minecraft.Windows.exe` to detect whether the game is x64 or ARM64, then downloads the correct DLL variant automatically.

## 🌍 Multi-Language Support

The unlocker auto-detects your system language and displays the UI accordingly. Supported languages:

| Language | Code |
|----------|------|
| English | `en` |
| Português | `pt` |
| Español | `es` |
| Français | `fr` |
| 中文 (Chinese) | `zh` |
| हिन्दी (Hindi) | `hi` |
| العربية (Arabic) | `ar` |
| Русский (Russian) | `ru` |
| Deutsch (German) | `de` |
| 日本語 (Japanese) | `ja` |
| 한국어 (Korean) | `ko` |
| Bahasa Indonesia | `id` |
| Türkçe (Turkish) | `tr` |

## 🗑️ Uninstall

1. Download [`uninstall.bat`](https://raw.githubusercontent.com/krinjalku/FIXMINECRAFTFILES/main/uninstall.bat) and run it
2. Or manually delete `%APPDATA%\minecraft unlocker\` and the desktop shortcut

## ✨ Features

- 🎮 **Game detection** — auto-detects Minecraft installation
- 📥 **Auto-download** — downloads unlock files from GitHub on every use
- 🔒 **SHA256 verification** — validates file integrity after download
- 💾 **Offline cache** — works without internet after first install
- 🏗️ **ARM64 support** — native Windows on ARM compatibility
- 🌍 **13 languages** — auto-detected from your system locale
- 🎯 **Game tracker** — shows "PLAYING..." while game is running
- 🟩 **Grass block icon** — custom Minecraft-themed app icon
- 📁 **AppData storage** — all data stored in `%APPDATA%\minecraft unlocker\`
- 🖥️ **Desktop shortcut** — created automatically by installer
- 🔐 **Key system** — 7-day rotating keys with HWID lock
- 🛡️ **Anti-tamper** — debugger, VM, and RE tool detection
- 🔄 **Hot-updatable DLLs** — update engine.json hashes on GitHub to push new DLL versions

## 📁 Repository Structure

```
engine_a/          OnlineFix method payload files
engine_b/          errortechh method payload files
keypage/           Key system web page (GitHub Pages)
uninstall.bat      Uninstaller
```

## 🔄 Updating DLLs

To update the DLL files at any time:

1. Upload new DLL files to the appropriate `engine_*` folder
2. Update the `expected_hashes` in the engine config (installer.cpp)
3. Rebuild and re-upload `mc_installer.exe` and `minecraft_unlocker.exe`
4. Users will automatically get the new files on next launch

For Engine C (CoelhoFZ method), updates happen automatically when CoelhoFZ updates their repo — just update the expected hashes.

## 👨‍💻 Credits

Made by **errortechh** — [YouTube](https://youtube.com/@errortechh)

Engine C uses the winmm.dll unlock method by [CoelhoFZ](https://github.com/CoelhoFZ/Minecraft-Bedrock-Free)