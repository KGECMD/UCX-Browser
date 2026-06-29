# 🛡️ UCX Browser - Privacy-First Chromium

![UCX Browser Logo](resources/ucx_icon_256.png)

**UCX Browser** is the ultimate privacy-focused, security-hardened Chromium browser. Built on Ungoogled Chromium, it provides maximum privacy protection with a premium browsing experience.

## ✨ Features

### 🔒 Privacy First
- **Maximum Telemetry Removal** - All Google tracking disabled
- **Chrome Web Store Support** - Install extensions from the Chrome Web Store
- **WebRTC Privacy Protection** - Prevent IP leaks
- **Enhanced Partitioning** - Better cache, storage, and network isolation
- **DNS Privacy** - Secure DNS (DoH) configuration
- **Strict Referrer Policy** - Maximum privacy controls
- **Built-in Tracker Blocking** - Automatic tracking parameter removal
- **Third-Party Cookie Blocking** - Total Cookie Protection
- **PlanetVPN Integration** - Built-in VPN support for maximum privacy

### 🛡️ Security Hardened
- **Process Isolation** - Renderer and GPU process separation
- **Memory Protections** - Enhanced memory safety
- **Strengthened Sandboxing** - Better sandbox configurations
- **Certificate Transparency** - Better CT validation
- **Secure DNS** - DNS-over-HTTPS enabled
- **HTTPS-Only Mode** - Enforce secure connections
- **Site Sandboxing** - Every site sandboxed by default

### 🚀 Performance
- **Optimized Build** - Fast startup and smooth browsing
- **Memory Efficiency** - Reduced resource usage
- **Battery Friendly** - Lower CPU usage
- **Blazing Fast** - One of the fastest browsers available

### 🎨 Premium UI
- **Modern Design** - Clean, elegant interface
- **Dark/Light Mode** - Adaptive theming
- **Customizable** - Tailor to your preferences

## 📥 Installation

### Windows
1. Download the latest release from [Releases](https://github.com/KGECMD/ucx-browser/releases)
2. Extract the ZIP file
3. Run `UCX Browser.exe`
4. ⚠️ **Note**: If SmartScreen warns, click "More info" → "Run anyway" (the executable is safe and open source)

### Linux
```bash
# Download the .deb or .AppImage
sudo dpkg -i ucx-browser*.deb
# OR
./UCX-Browser-*.AppImage
```

### macOS
1. Download the .dmg file
2. Drag to Applications
3. Allow in System Preferences if needed

## 🔧 Browser Flags

Access `chrome://flags/` for advanced settings:
- `#privacy-partitioning-enabled` - Enhanced privacy partitioning
- `#enable-webrtc-ipv6-disallow-multicast` - WebRTC protection
- `#force-dark-mode` - Dark theme
- `#enable-sandbox` - Enhanced sandboxing

## 📋 Pre-Installed Extensions

UCX Browser comes with these privacy extensions pre-installed:
- **uBlock Origin** - Ad and tracker blocking
- **Privacy Badger** - Automatic tracker blocking
- **HTTPS Everywhere** - Force HTTPS connections
- **Decentraleyes** - Local CDN emulation
- **PlanetVPN** - Built-in VPN support

Additional supported:
- ✅ Manifest V2 Extensions
- ✅ Manifest V3 Extensions
- ✅ Chrome Web Store Extensions
- ✅ Unpacked Extensions

## 🔐 SmartScreen Note

Windows SmartScreen may show a warning on first run. This is normal for unsigned executables. UCX Browser is:
- 100% Open Source
- Built from publicly available Chromium source
- Free of malware and tracking
- Verified by the security community

## 📄 License

UCX Browser is released under the same license as Chromium (BSD-3-Clause). See [LICENSE](LICENSE) for details.

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](docs/contributing.md) for guidelines.

## 📚 Documentation

- [Building Guide](docs/building.md)
- [Privacy Audit](docs/privacy-audit.md)
- [Security Audit](docs/security-audit.md)
- [Extension Guide](docs/extensions-guide.md)
- [Flags Reference](docs/flags.md)

## 🏆 Comparison

| Feature | UCX Browser | Chrome | Firefox |
|---------|-------------|--------|---------|
| Google Telemetry | ❌ Removed | ✅ Present | N/A |
| Chrome Web Store | ✅ Supported | ✅ Supported | Limited |
| WebRTC Protection | ✅ Enhanced | ❌ Basic | ✅ Good |
| Privacy Partitioning | ✅ Enabled | Limited | ✅ Good |
| DoH Support | ✅ Enabled | ✅ Enabled | ✅ Enabled |
| VPN Integration | ✅ Built-in | ❌ None | Limited |
| Open Source | ✅ 100% | ❌ Proprietary | ✅ 100% |

## 💬 Support

- [Issues](https://github.com/KGECMD/ucx-browser/issues)
- [Discussions](https://github.com/KGECMD/ucx-browser/discussions)

---

**UCX Browser** - *Your Privacy, Our Priority*

---

*UCX Browser is not affiliated with Google. Chromium is a trademark of Google LLC.*
