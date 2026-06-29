# 🔒 UCX Browser Privacy Manifest v2.0

**Version:** 2.0  
**Based on:** Ungoogled Chromium 146.0.7680.153  
**Philosophy:** Privacy > Convenience

---

## Executive Summary

UCX Browser is designed from the ground up with privacy as the primary concern. Every feature, setting, and decision has been evaluated through a privacy lens.

**Our Core Principle:** Your browser should not spy on you.

---

## 🔴 What We REMOVE/Disable

### Google Services (All Disabled)
| Feature | Status | Why |
|---------|--------|-----|
| Chrome Telemetry | ❌ Disabled | Doesn't send usage data to Google |
| Chrome Sync | ❌ Disabled | Doesn't sync your data to Google servers |
| Metrics Reporting | ❌ Disabled | No crash reports or usage stats |
| Crash Reporting | ❌ Disabled | No crash data sent anywhere |
| Google API Keys | ❌ Invalid | No Google API access |
| Chrome Update | ❌ Disabled | No auto-updates from Google |
| Translate | ❌ Disabled | Doesn't connect to Google Translate |
| Web Discoveries | ❌ Disabled | No browsing data sent to Google |

### Data Collection (All Blocked)
| Feature | Status | Why |
|---------|--------|-----|
| Client Hints | ❌ Disabled | Prevents device fingerprinting |
| Privacy Sandbox | ❌ Disabled | Google's tracking system |
| Network Prediction | ❌ Disabled | Doesn't pre-fetch URLs via Google |
| Search Suggestions | ❌ Disabled | Doesn't query Google for suggestions |
| Alternate Error Pages | ❌ Disabled | Doesn't connect to Google's help |
| WebXR | ❌ Disabled | Can be used for fingerprinting |

### Network Privacy
| Feature | Status | Why |
|---------|--------|-----|
| QUIC Protocol | ❌ Disabled | Reduces fingerprinting surface |
| WebRTC IP Leak | ✅ Protected | Only default public interface |
| Third-Party Cookies | ❌ Blocked | Cross-site tracking prevented |
| Referrer Tracking | ✅ Strict | `strict-origin-when-cross-origin` |

---

## 🟢 What We ENABLE/Protect

### Security Features
| Feature | Status | Protection |
|---------|--------|------------|
| Site Isolation | ✅ Enabled | Each site in own process |
| Origin Isolation | ✅ Enabled | Prevents cross-origin attacks |
| Storage Partitioning | ✅ Enabled | Third-party storage isolated |
| Sandbox (Maximum) | ✅ Enabled | Process isolation |
| HTTPS-Only Mode | ✅ Enabled | Forces secure connections |
| DNS-over-HTTPS | ✅ Enabled | Encrypted DNS queries |
| Strict Referrer Policy | ✅ Enabled | Maximum referrer privacy |

### Content Blocking
| Feature | Status | Level |
|---------|--------|-------|
| Tracking Protection | ✅ Level 2 | Maximum blocking |
| Third-Party Cookies | ✅ Blocked | Total Cookie Protection |
| Autoplay | ✅ Blocked | User decides |

---

## 🔐 Build Flags Applied

These are the privacy flags applied during build:

```
# Privacy Critical
enable_metrics=false
enable_reporting=false
enable_client_hints=false
enable_client_hints_inheritance=false
enable_privacy_sandbox_ads=false
safe_browsing_mode=0

# Network Privacy
enable_dns_over_https=true
enable_quic=false
webrtc_ip_handling_policy="default_public_interface_only"

# Content Blocking
block_third_party_cookies=true
https_only_mode_default=1
tracking_protection_level=2
```

---

## 📊 What Data UCX Browser Collects

**NONE.**

UCX Browser does not:
- Send any telemetry to anyone
- Store your browsing history on external servers
- Track your searches
- Monitor your clicks
- Share your data with third parties
- Connect to any tracking services

---

## 🌐 Default Search Engine

UCX Browser uses **SearXNG** as the default search engine.

SearXNG is:
- 🔒 Privacy-respecting metasearch engine
- 🚫 No tracking
- 🚫 No logging
- 🔓 Open source

**URL:** https://searxng.website

---

## 🔧 How to Verify

### Check Active Connections
1. Open UCX Browser
2. Go to any website
3. Open Task Manager (Shift+Esc)
4. Check Network tab
5. Verify no connections to Google domains

### Check for Telemetry
```powershell
# On Windows, monitor network with:
netstat -an | findstr ":443" | findstr -v "ESTABLISHED"
```

### Privacy Settings
Navigate to `chrome://settings/privacy` to verify:
- ✅ Do Not Track: ON
- ✅ Safe Browsing: OFF
- ✅ Third-party cookies: BLOCKED
- ✅ HTTPS-Only Mode: ENABLED

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 2.0 | 2024 | Enhanced privacy flags, default preferences |
| 1.0 | 2024 | Initial release with Ungoogled Chromium base |

---

## 🤝 Contributing to Privacy

Found a privacy issue? Please report it to the repository.

---

## 📜 License

UCX Browser is open source. The privacy manifest is provided for transparency.

---

**Last Updated:** 2024  
**Version:** 2.0

*UCX Browser - Privacy First. No Compromise.*
