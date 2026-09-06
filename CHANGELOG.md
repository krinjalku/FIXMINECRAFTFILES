# Changelog

All notable changes to the Minecraft Unlocker project.

## [2.0.0] - 2026-09-06

### Added
- **Engine C** — New unlock method using winmm.dll proxy + license hook (CoelhoFZ method)
- **ARM64 support** — Auto-detects game architecture (x64 vs ARM64) and downloads correct DLL
- **SHA256 hash verification** — All downloaded DLLs are verified against expected hashes before installation
- **Offline cache** — Validated DLLs are cached in `%APPDATA%\minecraft unlocker\cache\` for offline use
- **Multi-language support** — 13 languages with auto-detection from system locale:
  - English, Português, Español, Français, 中文, हिन्दी, العربية, Русский, Deutsch, 日本語, 한국어, Bahasa Indonesia, Türkçe
- **Version tracking** — `tested-versions.json` lists tested Minecraft versions per engine
- **Hot-updatable DLLs** — Update engine.json hashes on GitHub to push new DLL versions to all users
- **SECURITY.md** — Security policy documenting protections and reporting procedures

### Changed
- Installer now creates 3 engine directories (engine_a, engine_b, engine_c)
- Patcher now shows localized status messages
- Uninstall.bat now cleans up the offline cache folder

## [1.1.0] - 2026-08-23

### Added
- Token-gated key page via work.ink Link Override
- XOR-encrypted URLs in binary for anti-RE
- Static linking to eliminate MinGW DLL dependencies

### Fixed
- Fixed errortechunlocker.dll path to `%APPDATA%\Minecraft Bedrock\mods`
- Fixed recursive directory creation for nested mod paths

## [1.0.0] - 2026-08-15

### Added
- Initial release with two unlock engines (OnlineFix + errortechh)
- HWID-locked 7-day key system
- Auto-installer with desktop shortcut
- Win32 GUI with custom Minecraft theme
- Anti-debug and VM detection
- Game process tracker