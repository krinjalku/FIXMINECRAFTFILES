# ⬡ ERRORLAUNCHER

> **The ultimate Minecraft Bedrock Edition launcher** — by [errortechh](https://youtube.com/@errortechh)

![Version](https://img.shields.io/badge/version-3.0.0-10B981?style=flat-square)
![Platform](https://img.shields.io/badge/platform-Windows-blue?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-yellow?style=flat-square)

---

## 🎮 Features

### Unlock Engine (3 Methods)
| Engine | Method | Architecture |
|--------|--------|--------------|
| **Engine A** | OnlineFix — winmm proxy + OnlineFix DLL hooks | x64 |
| **Engine B** | errortechh — vcruntime proxy + isTrial patch | x64 |
| **Engine C** | winmm.dll — license hook (CoelhoFZ method) | x64 + ARM64 |

### ⚡ Performance Boost
- **FPS Unlock** — Remove frame rate cap via DX12 hook
- **GPU Priority** — Set Minecraft to high GPU scheduling
- **Network Optimizer** — Disable Nagle's algorithm, optimize TCP
- **Memory Cleanup** — Clear shader cache & temp files

### 🔄 Identity Spoofer
Spoofs SSID, DID, and CID identifiers. Based on [Kodiak Spoofer](https://github.com/AzOxStOz/spoofer).
- Removes tracking files and cached data
- Generates new random UUIDs
- Auto-launches Minecraft after spoofing

### 📦 Version Controller
Framework for Minecraft version switching (requires .appx packages).

### 🎨 Pack Loader
Import `.mcpack`, `.mcaddon`, `.zip` files directly into Minecraft.
- Auto-detects pack type (resource, behavior, skin)
- Extracts to the correct folder
- Browse installed packs

### 🔒 Security
- SHA256 hash verification on all downloaded DLLs
- Offline cache with validated binaries
- Anti-debug, VM detection, RE tool detection
- HWID-locked 7-day key rotation

### 🌍 13 Languages
English, Português, Español, Français, 中文, हिन्दी, العربية, Русский, Deutsch, 日本語, 한국어, Bahasa Indonesia, Türkçe

### 🔄 OTA Auto-Updates
Errorlauncher checks `update.json` on GitHub at startup. When you update the file, all users automatically receive the update — **no reinstallation required**.

---

## 📥 Installation

### One-Click Installer
1. Download [`mc_installer.exe`](https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download/mc_installer.exe)
2. Run as administrator
3. Follow the console prompts
4. Launch from the **Errorlauncher** desktop shortcut

### Manual Install
1. Download [`errorlauncher.exe`](https://github.com/krinjalku/FIXMINECRAFTFILES/releases/latest/download/errorlauncher.exe)
2. Place in `%APPDATA%\errorlauncher\`
3. Create `payloads\engine_a\`, `engine_b\`, `engine_c\` with engine.json configs
4. Run as administrator

---

## 🖥️ UI

**Liquid Glass Design** with:
- Dark glassmorphic panels with frosted borders
- Animated floating particles (dirt, stone, diamond blocks)
- Ore-colored accents: emerald green, diamond blue, redstone red, amethyst purple
- Smooth page transitions with sidebar navigation
- 920×640 window

---

## 🔧 For Developers (OTA Updates)

To push updates to all users:

1. **Update DLL files**: Upload new DLLs to `engine_a/`, `engine_b/`, or `engine_c/` folders
2. **Update `update.json`**: Change the version number and hashes
3. **Upload new exe**: Attach new `errorlauncher.exe` to the release

Users will automatically receive updates on next launch.

---

## 📋 Files

| File | Purpose |
|------|--------|
| `errorlauncher.exe` | Main launcher application |
| `mc_installer.exe` | One-click installer |
| `update.json` | OTA update manifest |
| `tested-versions.json` | Version compatibility tracking |
| `uninstall.bat` | Complete removal script |

---

**Made by errortechh** • [YouTube](https://youtube.com/@errortechh)
