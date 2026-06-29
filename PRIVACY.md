# 🛡️ UCX Browser Privacy Manifest
## Version 2.0 - Maximum Privacy Edition

---

## Overview

**UCX Browser** is a privacy-first, security-hardened Chromium browser built on Ungoogled Chromium. This document outlines all privacy and security features.

---

## 🔒 Privacy Features - Maximum Protection

### REMOVED Components
| Component | Status | Impact |
|-----------|--------|--------|
| Google Telemetry | ❌ REMOVED | No usage data sent |
| Chrome Sync | ❌ REMOVED | No cloud sync |
| Privacy Sandbox | ❌ REMOVED | No Google tracking |
| Translate Service | ❌ REMOVED | No Google connection |
| Search Suggestions | ❌ REMOVED | No Google queries |
| Web Fonts | ❌ REMOVED | Reduced fingerprinting |
| RLZ Tracking | ❌ REMOVED | No tracking codes |

### ENABLED Protections
| Protection | Status | Benefit |
|------------|--------|---------|
| WebRTC IP Protection | ✅ ENABLED | Prevents IP leaks |
| Third-party Cookies | ❌ BLOCKED | No cross-site tracking |
| HTTPS-Only Mode | ✅ FORCED | Secure connections only |
| DNS-over-HTTPS | ✅ ENABLED | Encrypted DNS |
| Do Not Track | ✅ ENABLED | Requests honored |
| Strict Referrer Policy | ✅ ENABLED | Minimal referrer leakage |

### Anti-Fingerprinting
| Feature | Status | Benefit |
|---------|--------|---------|
| QUIC Protocol | ❌ DISABLED | Reduced fingerprinting |
| Client Hints | ❌ DISABLED | Less identification |
| Privacy Sandbox | ❌ DISABLED | No Google tracking |
| Predictor (prefetch) | ❌ DISABLED | No predictive loading |

---

## 🛡️ Security Hardening

### Process Isolation
- ✅ Site Isolation: MAXIMUM
- ✅ Origin Isolation: ENABLED
- ✅ Storage Partitioning: ENABLED
- ✅ Renderer Isolation: ENABLED
- ✅ GPU Process Isolation: ENABLED

### Memory Protection
- ✅ Hardware Stack Protection: ENABLED
- ✅ Memory Tagging: ENABLED
- ✅ Sandbox: MAXIMUM
- ✅ CFI (Control Flow Integrity): ENABLED

### Network Security
- ✅ TLS 1.3: ENABLED
- ✅ Certificate Transparency: VALIDATED
- ✅ Secure DNS: CONFIGURED
- ✅ HTTP/3 (QUIC): DISABLED

---

## 🔍 Default Settings

### Search Engine
**Primary:** SearXNG
- URL: https://searxng.website
- Type: Privacy-respecting metasearch
- No tracking, no logging, open source

### Browser Defaults
| Setting | Value |
|---------|-------|
| Default Search | SearXNG |
| Homepage | Blank |
| New Tab | Blank |
| Downloads | Prompt |
| Passwords | Disabled |
| Autofill | Disabled |
| Sync | Disabled |

---

## ❌ What UCX Browser Does NOT Do
- Send telemetry to Google
- Connect to Google services
- Track your browsing habits
- Store data in the cloud
- Share any user data
- Show personalized ads
- Connect to unknown servers

## ✅ What UCX Browser DOES
- Protect your privacy
- Block trackers
- Enforce HTTPS
- Protect your IP address
- Block third-party cookies
- Use privacy-respecting search
- Minimize network requests

---

## 📊 Data Collection Policy

UCX Browser collects **ZERO** user data. The browser is designed with privacy as the primary concern.

### Local Data
- All browsing data stored locally
- Profile stored in user directory
- No sync with external servers
- No crash reports sent

### Network Data
- Only connects to user-requested sites
- Default search: SearXNG (privacy-respecting)
- No Google services
- Minimal background requests

---

## 🔐 Build Information

| Item | Value |
|------|-------|
| Base Browser | Ungoogled Chromium |
| Version | 149.0.7827.200 |
| Privacy Flags | v2.0 |
| Security Level | Maximum |
| Build Date | 2024-06 |

---

## 🔗 Resources

- Website: https://github.com/KGECMD/UCX-Browser
- Support: https://github.com/KGECMD/UCX-Browser/issues

---

*UCX Browser - Privacy First. No Compromise.*

Last Updated: June 2024
