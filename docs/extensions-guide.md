# UCX Browser - Extensions Guide

**Built by KGECMD (Kayan Erkama)**

## Overview

**UCX Browser** supports a comprehensive set of extensions while maintaining the highest standards of privacy and security. Chrome Web Store is supported by default.

## Supported Extension Formats

| Format | Status | Notes |
|--------|--------|-------|
| Manifest V2 | Full Support | Legacy extension support |
| Manifest V3 | Full Support | Modern extension API |
| Unpacked | Full Support | Developer mode support |
| Chrome Web Store | Supported | Via webstore extension |

## Recommended Privacy Extensions

### Ad & Tracker Blocking

#### 1. uBlock Origin (Recommended)
- **Manifest Version**: V2
- **Extension ID**: `cjpalhdlnbpafiamejdnhcphjbkeiagm`
- **Purpose**: Industry-leading ad and tracker blocking
- **Privacy Features**:
  - No telemetry
  - No analytics
  - No phone home
  - Full local operation
- **Installation**: Pre-configured for first-run

#### 2. AdGuard AdBlocker
- **Manifest Version**: V3
- **Extension ID**: `bgnkhhnnamicmpeenaelnjhhikofkhaa`
- **Purpose**: Comprehensive ad blocking

### Security Extensions

#### 3. Bitdefender TrafficLight
- **Manifest Version**: V3
- **Extension ID**: `eofcjobaimdcgepkbiicmkiijjjajgoo`
- **Purpose**: Phishing and malware protection
- **Features**:
  - Real-time scanning
  - Anti-phishing
  - Fraud warning
  - No data collection mode

#### 4. Malwarebytes Browser Guard
- **Manifest Version**: V3  
- **Extension ID**: `afonmagkejenijhagbjgnlhpncjcbjcd`
- **Purpose**: Browser security and malware protection
- **Features**:
  - Malware blocking
  - PUP detection
  - Scam protection

### VPN & Network Security

#### 5. Privacy-Chromium Secure Connect
- **Type**: Custom VPN integration
- **Purpose**: Encrypted tunnel
- **Configuration**: User-configurable

### Privacy Extensions

#### 6. Privacy Badger
- **Manifest Version**: V3
- **Extension ID**: `pkehgijcmpdhfbdbbnkijodmdjhbjlgp`
- **Purpose**: Learns to block invisible trackers

#### 7. Decentraleyes
- **Manifest Version**: V2
- **Purpose**: Local CDN emulation

#### 8. ClearURLs
- **Manifest Version**: V3
- **Purpose**: Remove tracking parameters

## Extension Installation Guide

### Method 1: First-Run Setup
1. Launch Privacy-Chromium
2. Complete first-run wizard
3. Select recommended extensions
4. Extensions auto-install

### Method 2: Chrome Web Store
1. Navigate to Settings > Extensions
2. Click "Open Chrome Web Store"
3. Search and install extensions
4. Grant required permissions

### Method 3: Manual Installation
1. Download .crx file
2. Enable Developer Mode
3. Drag .crx to Extensions page
4. Confirm installation

## Extension Permissions

### Minimal Permissions Principle
All extensions follow minimal permissions:
- Request only necessary permissions
- No unnecessary data access
- No background data collection

### Permission Categories

| Permission | Description | Risk Level |
|------------|-------------|------------|
| storage | Local storage | Low |
| tabs | Tab access | Medium |
| webRequest | Network monitoring | High |
| cookies | Cookie access | Medium |
| <all_urls> | Full site access | High |

## Privacy-Preserving Extension Settings

### uBlock Origin Configuration
```json
{
  "privacyConfig": true,
  "noTelemetry": true,
  "noAnalytics": true,
  "localContentBlock": true,
  "noExternalResources": false
}
```

### Bitdefender Configuration
```json
{
  "privacyMode": true,
  "noDataSharing": true,
  "localAnalysis": true
}
```

### Malwarebytes Configuration
```json
{
  "anonymousMode": true,
  "noCloudSync": true
}
```

## Extension Compatibility

### Verified Working
- [x] uBlock Origin
- [x] Bitdefender TrafficLight
- [x] Malwarebytes Browser Guard
- [x] Privacy Badger
- [x] Decentraleyes
- [x] ClearURLs
- [x] HTTPS Everywhere
- [x] NoScript
- [x] ScriptSafe
- [x] Violentmonkey
- [x] Tampermonkey

### Known Limitations
- Some security extensions may conflict with Privacy Sandbox removal
- Extension sync not available (use manual backup)

## Extension Security

### Auto-Update Configuration
Extensions update automatically through:
1. Chrome Web Store (if installed from store)
2. Developer-provided updates
3. Manual update checking

### Extension Isolation
- Each extension runs in isolated process
- No cross-extension communication unless required
- CSP enforcement on all extension pages

## Removing Extensions

### Temporary Disable
1. Go to chrome://extensions
2. Toggle off desired extension

### Complete Removal
1. Go to chrome://extensions
2. Click "Remove"
3. Confirm removal

## Troubleshooting

### Extension Not Loading
1. Check if extension is enabled
2. Verify manifest version compatibility
3. Disable conflicting extensions
4. Restart browser

### Permissions Issues
1. Review extension permissions
2. Grant necessary access
3. Use incognito mode for testing

## Best Practices

1. **Limit Extensions**: Only install necessary
2. **Regular Audit**: Review installed extensions
3. **Update Regularly**: Keep extensions current
4. **Read Permissions**: Understand what you grant
5. **Use Official Sources**: Only trusted repositories

## Extension Storage Privacy

Extensions do NOT remember:
- Browsing history
- Personal data
- Credentials
- Usage patterns

All data stored locally unless explicitly permitted.

---

*Privacy-Chromium Premium Edition - Extensions for Privacy and Security*
