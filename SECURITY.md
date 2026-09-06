# Security Policy

## Supported Versions

| Version | Supported |
|---------|----------|
| Latest release | ✅ |
| Older releases | ❌ |

## Security Features

### Binary Integrity
- **SHA256 hash verification** on all downloaded DLL files
- Hashes are pinned in the engine configs and verified before installation
- Corrupted or tampered files are automatically rejected

### Offline Cache
- Cached files are only saved after successful hash verification
- Cache is stored in `%APPDATA%\minecraft unlocker\cache\`

### Anti-Tamper
- Debugger detection (multiple layers)
- VM detection (Hyper-V, VMware, VirtualBox)
- RE tool detection (x64dbg, IDA, Ghidra, etc.)
- XOR-encrypted sensitive URLs in binary

### Key System
- HWID-locked keys (cannot be shared between machines)
- 7-day key rotation
- Server-side token validation via work.ink

## Reporting a Vulnerability

If you discover a security vulnerability, please report it by opening an issue or contacting errortechh directly.

## Antivirus False Positives

Some antivirus engines may flag the unlocker or DLL files as potentially unwanted software. This is a common false positive for game unlockers. The SHA256 hashes in the engine configs can be used to verify file integrity.

## Official Source

The **ONLY** official source for this project is:
- https://github.com/krinjalku/FIXMINECRAFTFILES

**NEVER** download from unofficial sources, Discord DMs, or short links.