# 🛡️ UCX Browser v2.0.0 - Privacy-First Chromium

![UCX Browser Logo](resources/ucx_logo.svg)

**UCX Browser** is the ultimate privacy-focused, security-hardened Chromium browser. Built on Ungoogled Chromium, it provides maximum privacy protection with a premium browsing experience.

[![Build Status](https://github.com/KGECMD/UCX-Browser/actions/workflows/build-windows.yml/badge.svg)](https://github.com/KGECMD/UCX-Browser/actions)
[![Version](https://img.shields.io/badge/version-2.0.0-blue.svg)](https://github.com/KGECMD/UCX-Browser/releases)
[![Privacy](https://img.shields.io/badge/privacy-maximum-green.svg)](PRIVACY.md)

## 🔒 Privacy Features - Maximum Protection v2.0

| Feature | Status | Why |
|---------|--------|-----|
| **Default Search** | ✅ **SearXNG** | Privacy metasearch - no tracking |
| Google Telemetry | ❌ **REMOVED** | Zero data sent to Google |
| Chrome Sync | ❌ **DISABLED** | No cloud sync |
| WebRTC IP Leak | ✅ **PROTECTED** | No IP exposure |
| Client Hints | ❌ **DISABLED** | Anti-fingerprinting |
| 3rd Party Cookies | ❌ **BLOCKED** | No cross-site tracking |
| QUIC Protocol | ❌ **DISABLED** | Reduced fingerprinting |
| DNS-over-HTTPS | ✅ **ENABLED** | Encrypted DNS queries |
| HTTPS-Only Mode | ✅ **FORCED** | Secure connections only |
| Privacy Sandbox | ❌ **DISABLED** | No Google tracking |
| Translate Service | ❌ **DISABLED** | No Google connection |
| Search Suggestions | ❌ **DISABLED** | No Google queries |

## 🛡️ Security Hardening

| Feature | Status |
|---------|--------|
| Site Isolation | ✅ Maximum |
| Origin Isolation | ✅ Enabled |
| Storage Partitioning | ✅ Enabled |
| Sandbox | ✅ Maximum |
| Memory Protection | ✅ Enabled |

## 📥 Downloads

| Platform | File | Status |
|----------|------|--------|
| Windows x64 | UCX-Browser-v2.0.0-Windows-x64.zip | ✅ Ready (183 MB) |
| Linux x64 | UCX-Browser-v2.0.0-Linux-x64.tar.xz | ✅ Ready |
| macOS | UCX-Browser-v2.0.0-macOS.dmg | ✅ Ready |

[![Latest Release](https://img.shields.io/github/v/release/KGECMD/UCX-Browser)](https://github.com/KGECMD/UCX-Browser/releases/latest)

**Download:** https://github.com/KGECMD/UCX-Browser/releases

## 🚀 Quick Start

### Windows
1. Download `UCX-Browser-v2.0.0-Windows-x64.zip`
2. Extract anywhere
3. Run `UCX-Browser.exe`

### Linux
```bash
tar -xf UCX-Browser-v2.0.0-Linux-x64.tar.xz
./ucx-browser/ucx-browser
```

### macOS
1. Mount DMG
2. Drag UCX Browser to Applications

## 📁 What's Included

| File | Description |
|------|-------------|
| `UCX-Browser.exe` | Main launcher (Windows) |
| `UCX-Browser-Portable.exe` | Portable mode launcher |
| `Setup.bat` | Interactive installer |
| `README.txt` | Quick start guide |
| `UCX-INFO.txt` | Privacy manifest |
| `ucx.ico` | Custom UCX icon |
| `default_preferences.json` | Privacy settings |
| `master_preferences` | Browser defaults |

## 🔍 Based On

- **Ungoogled Chromium 149.0.7827.200**
- **Privacy Flags v2.0**
- **Chromium 149**

## 📄 Documentation

- [PRIVACY.md](PRIVACY.md) - Complete Privacy Manifest
- [VERSION.txt](VERSION.txt) - Version Information
- [SUPPORT.md](SUPPORT.md) - Support Options

## 🏗️ Build from Source

```bash
# Push a tag to trigger builds
git tag v2.0.0
git push origin v2.0.0
```

## 📜 License

BSD-3-Clause (same as Chromium)

---

*UCX Browser - Privacy First. No Compromise.*
