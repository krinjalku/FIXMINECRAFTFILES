# Troubleshooting

Common issues and solutions for the Minecraft Unlocker.

## Installation Issues

### "The code execution cannot proceed because libwinpthread-1.dll was not found"
This has been fixed in v2.0.0. The installer and unlocker are now statically linked — no external DLL dependencies. Re-download the latest installer.

### Installer closes immediately
- Right-click `mc_installer.exe` → **Run as administrator**
- If Windows Defender blocks it, add an exclusion for the download folder

### Windows Defender blocks the download
1. Open **Windows Security** → **Virus & threat protection**
2. Click **Protection history**
3. Find the blocked file and click **Allow**
4. Re-run the installer

## Unlock Issues

### "Download failed" error
- Check your internet connection
- If you've installed before, the unlocker will use the **offline cache** automatically
- Try a different engine (Engine A, B, or C)

### "HASH MISMATCH" error
- The downloaded file may be corrupted. Try again.
- If the error persists, the DLL may have been updated. Wait for a new release.

### Game still shows Trial after unlocking
- Make sure Minecraft was closed before unlocking
- Try a different engine
- For Engine C: make sure you're using the official Store/Xbox App build (not a third-party launcher)

### Engine C doesn't work on ARM64
- Make sure you have the ARM64 version of Minecraft from the Microsoft Store
- The unlocker auto-detects architecture — if it picks the wrong one, report the issue

## Key System Issues

### "KEY REQUIRED" but I already have a key
- Keys expire after **7 days** — get a new one by clicking "Get Key"
- Keys are **HWID-locked** — they only work on the machine they were generated for

### Key page shows "Access Denied"
- You must complete the work.ink verification first
- Don't try to access the key page directly — use the "Get Key" button in the app

### Wrong HWID shown
- The HWID is based on your computer name + C: drive serial number
- If you changed your computer name or reinstalled Windows, the HWID changes

## Still Need Help?

Contact **errortechh** on [YouTube](https://youtube.com/@errortechh)