# UCX Browser - Build Guide

**UCX Browser** - Universally Created Xternal Privacy Project  
**Built by KGECMD (Kayan Erkama)**  
**Version**: 1.0.0

---

## System Requirements

### Windows Build Requirements
- Windows 10/11 (64-bit)
- Visual Studio 2022 Community or Professional
- Windows 10 SDK (10.0.19041.0 or later)
- Python 3.8+
- 100GB+ free disk space
- 16GB+ RAM (32GB recommended)
- 8+ CPU cores (16+ recommended)

### Linux Build Requirements
- Ubuntu 20.04+ or similar Debian-based distro
- Python 3.8+
- GCC/Clang with C++17 support
- 100GB+ free disk space
- 16GB+ RAM

### macOS Build Requirements
- macOS 10.15+ (Catalina or later)
- Xcode 14+
- 100GB+ free disk space
- 16GB+ RAM

---

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/KGECMD/UCX-Browser.git
cd UCX-Browser
```

### 2. Choose Your Platform

- [Windows Build](#windows)
- [Linux Build](#linux)
- [macOS Build](#macos)

---

## Windows Build Instructions {#windows}

### Option 1: Automated Script (Recommended)

1. **Install Prerequisites**
   - Download Visual Studio 2022: https://visualstudio.microsoft.com/downloads/
   - Select "Desktop development with C++" workload
   - Install Python 3.11+: https://www.python.org/downloads/

2. **Run the Build Script**
   ```cmd
   cd UCX-Browser
   build-scripts\build-windows.bat
   ```

### Option 2: Manual Build

1. **Install depot_tools**
   ```cmd
   git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git C:\depot_tools
   set PATH=C:\depot_tools;%PATH%
   ```

2. **Fetch Chromium**
   ```cmd
   mkdir chromium && cd chromium
   fetch --nohooks chromium
   cd src
   ```

3. **Apply Patches**
   ```cmd
   cd ..
   python ..\utils\patches.py apply -s src\
   ```

4. **Install Dependencies**
   ```cmd
   cd src
   call build\install-build-deps.bat
   gclient runhooks
   ```

5. **Configure and Build**
   ```cmd
   gn gen out\Release --args="is_official_build=true symbol_level=0"
   ninja -C out\Release chrome -j8
   ```

6. **Create Distribution**
   ```cmd
   mkdir ..\..\dist
   powershell Compress-Archive -Path "out\Release\*" -DestinationPath "..\..\dist\UCX-Browser-Windows-x64.zip"
   ```

---

## Linux Build Instructions {#linux}

### Option 1: Automated Script (Recommended)

1. **Install Prerequisites**
   ```bash
   sudo apt update
   sudo apt install python3 python3-pip git build-essential clang
   ```

2. **Run the Build Script**
   ```bash
   chmod +x build-scripts/build-linux.sh
   ./build-scripts/build-linux.sh
   ```

### Option 2: Manual Build

1. **Install Dependencies**
   ```bash
   sudo apt install python3 python3-pip git build-essential clang bison flex g++ \
       libnss3-dev libatk1.0-dev libatk-bridge2.0-dev libcups2-dev \
       libdrm2-dev libxkbcommon0-dev libxcomposite-dev \
       libxdamage1-dev libxrandr2-dev libgbm1-dev libasound2-dev \
       libgtk-3-dev libglib2.0-dev libdbus-1-dev libexpat1-dev \
       libx11-xcb-util-dev libxcb-util-dev libxcursor-dev libxss-dev
   ```

2. **Install depot_tools**
   ```bash
   git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git ~/depot_tools
   export PATH="$HOME/depot_tools:$PATH"
   ```

3. **Fetch Chromium**
   ```bash
   mkdir chromium && cd chromium
   fetch --nohooks chromium
   cd src
   ```

4. **Apply Patches**
   ```bash
   cd ..
   python3 ../utils/patches.py apply -s src/
   ```

5. **Install Chromium Dependencies**
   ```bash
   cd src
   ./build/install-build-deps.sh
   gclient runhooks
   ```

6. **Build**
   ```bash
   gn gen out/Release --args="is_official_build=true symbol_level=0"
   ninja -C out/Release chrome -j$(nproc)
   ```

7. **Create Distribution**
   ```bash
   cd ..
   mkdir -p ../dist
   tar -czvf ../dist/UCX-Browser-Linux-x64.tar.gz -C src/out/Release .
   ```

---

## macOS Build Instructions {#macos}

### Option 1: Automated Script (Intel)

1. **Install Xcode**
   ```bash
   xcode-select --install
   # Or install from Mac App Store
   ```

2. **Run the Build Script**
   ```bash
   chmod +x build-scripts/build-macos.sh
   ./build-scripts/build-macos.sh x64
   ```

### Option 2: Automated Script (Apple Silicon)

```bash
chmod +x build-scripts/build-macos.sh
./build-scripts/build-macos.sh arm64
```

### Option 3: Manual Build

1. **Install Xcode**
   ```bash
   xcode-select --install
   sudo xcodebuild -license accept
   ```

2. **Install depot_tools**
   ```bash
   git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git ~/depot_tools
   export PATH="$HOME/depot_tools:$PATH"
   ```

3. **Fetch Chromium**
   ```bash
   mkdir chromium && cd chromium
   fetch --nohooks chromium
   cd src
   ```

4. **Apply Patches and Build**
   ```bash
   cd ..
   python3 ../utils/patches.py apply -s src/
   cd src
   
   # For Intel:
   gn gen out/Release --args="is_official_build=true symbol_level=0 target_cpu=\"x64\""
   
   # For Apple Silicon:
   gn gen out/Release --args="is_official_build=true symbol_level=0 target_cpu=\"arm64\""
   
   ninja -C out/Release chrome
   ```

5. **Create DMG**
   ```bash
   hdiutil create -volname "UCX Browser" -srcfolder src/out/Release UCX-Browser-macOS.dmg
   ```

---

## GitHub Actions (Automated Builds)

The repository includes GitHub Actions workflows for automated builds:

- `.github/workflows/build-windows.yml` - Windows x64
- `.github/workflows/build-linux.yml` - Linux x64, ARM64
- `.github/workflows/build-macos.yml` - macOS Intel & Apple Silicon

### Triggering a Build

1. Go to the Actions tab: https://github.com/KGECMD/UCX-Browser/actions
2. Select a workflow
3. Click "Run workflow"
4. Wait for completion
5. Download artifacts from the workflow run

### Creating a Release with Built Binaries

1. Push a tag: `git tag v1.0.0 && git push origin v1.0.0`
2. Go to Actions and run the build workflow
3. Wait for builds to complete
4. Edit the release at: https://github.com/KGECMD/UCX-Browser/releases
5. Upload the built binaries as release assets

---

## Troubleshooting

### Out of Disk Space
- Clean up: `rm -rf build/chromium`
- Use component build sparingly
- Enable sccache for caching

### Build Failures
- Ensure all dependencies installed
- Clear cache: `gn clean out/Release`
- Re-run: `gclient runhooks`

### Windows SmartScreen
- Right-click .exe → Properties → Check "Unblock"
- Or click "More info" → "Run anyway"

### macOS Gatekeeper
- Sign with Developer ID
- Notarize with Apple

---

## Build Time Estimates

| Platform | Clean Build | Incremental |
|----------|-------------|-------------|
| Windows  | 4-8 hours   | 30-60 min   |
| Linux    | 3-6 hours   | 20-45 min   |
| macOS    | 4-7 hours   | 30-50 min   |

---

## Binary Locations

After successful build, binaries will be in:

- **Windows**: `dist/UCX-Browser-Windows-x64.zip`
- **Linux**: `dist/UCX-Browser-Linux-x64.tar.gz`
- **macOS Intel**: `dist/UCX-Browser-macOS-x64.dmg`
- **macOS ARM**: `dist/UCX-Browser-macOS-arm64.dmg`

---

## Code Signing

### Windows (EV Code Signing Certificate)
```powershell
signtool sign /f certificate.pfx /p password /tr http://timestamp.digicert.com /td SHA256 /fd SHA256 chrome.exe
```

### macOS (Developer Certificate)
```bash
codesign --sign "Developer ID Application: Your Name" "UCX Browser.app"
xcrun notarytool submit "UCX-Browser.dmg" --apple-id YOUR_ID --password YOUR_PASS
```

---

## Microsoft Store Submission

The MSIX manifest is in `ms-store/AppxManifest.xml`.

To submit to Microsoft Store:
1. Build the Windows binary
2. Create MSIX package
3. Sign with Microsoft Partner Center certificate
4. Submit through Partner Center dashboard

---

**UCX Browser - Your Privacy, Our Priority** 🛡️
