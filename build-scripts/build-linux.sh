#!/bin/bash
# ============================================================
# UCX Browser - Linux Build Script
# ============================================================
# Built by KGECMD (Kayan Erkama)
# Project: UCX (Universally Created Xternal Privacy Project)
# ============================================================

set -e

VERSION="1.0.0"
BUILD_DIR="build"
OUTPUT_DIR="dist"

echo "============================================================"
echo "UCX Browser Linux Build Script"
echo "============================================================"
echo ""

# Check if running as root (needed for build deps)
if [ "$EUID" -eq 0 ]; then
    echo "[WARNING] Running as root. Some checks will be skipped."
fi

echo "[STEP 1] Checking dependencies..."

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 not found!"
    echo "Install: sudo apt install python3 python3-pip python3-venv"
    exit 1
fi

# Check for Git
if ! command -v git &> /dev/null; then
    echo "[ERROR] Git not found!"
    echo "Install: sudo apt install git"
    exit 1
fi

# Check for required packages
MISSING_PKGS=""
for pkg in build-essential clang bison flex g++ libnss3-dev libatk1.0-dev \
           libatk-bridge2.0-dev libcups2-dev libdrm2-dev libxkbcommon0-dev \
           libxcomposite-dev libxdamage1-dev libxrandr2-dev libgbm1-dev \
           libasound2-dev libpangocairo-1.0-0 libpango-1.0-0 libgtk-3-dev \
           libglib2.0-dev libdbus-1-dev libexpat1-dev libx11-xcb-util-dev \
           libxcb-util-dev libxcursor-dev libxss-dev libsrtp0-dev libwebp-dev \
           libudev-dev libegl1-mesa-dev libevent-dev; do
    if ! dpkg -l | grep -q "^ii  $pkg "; then
        MISSING_PKGS="$MISSING_PKGS $pkg"
    fi
done

if [ -n "$MISSING_PKGS" ]; then
    echo "[INFO] Missing packages:$MISSING_PKGS"
    echo "[INFO] Installing missing packages..."
    sudo apt-get update
    sudo apt-get install -y $MISSING_PKGS
fi

echo "[INFO] Creating directories..."
mkdir -p "$BUILD_DIR"
mkdir -p "$OUTPUT_DIR"

echo "[STEP 2] Installing depot_tools..."
cd "$BUILD_DIR"
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PWD/depot_tools:$PATH"

echo "[STEP 3] Fetching Chromium source..."
mkdir -p chromium
cd chromium
fetch --nohooks chromium

# Get version from revision.txt
cd ..
CHROMIUM_VERSION=$(cat revision.txt 2>/dev/null || echo "main")
echo "[INFO] Checking out Chromium $CHROMIUM_VERSION"
cd chromium/src
git checkout "$CHROMIUM_VERSION"

cd /workspace/project/ungoogled-chromium

echo "[STEP 4] Applying UCX Browser patches..."
python3 utils/patches.py apply -s "$BUILD_DIR/chromium/src/"

echo "[STEP 5] Installing Chromium build dependencies..."
cd "$BUILD_DIR/chromium/src"
export PATH="$PWD/../depot_tools:$PATH"
./build/install-build-deps.sh || true
gclient runhooks

echo "[STEP 6] Building Chromium..."
cd "$BUILD_DIR/chromium/src"
gn gen out/Release --args="is_official_build=true symbol_level=0 enable_precompiled_headers=false"
ninja -C out/Release chrome -j$(nproc)

if [ $? -ne 0 ]; then
    echo "[ERROR] Build failed!"
    exit 1
fi

echo "[STEP 7] Creating distribution packages..."

# Create DEB package
cd /workspace/project/ungoogled-chromium
mkdir -p "$OUTPUT_DIR"

# Create AppDir for AppImage
APPIMAGE_DIR="UCX-Browser-Linux-x64.AppDir"
mkdir -p "$APPIMAGE_DIR/usr/bin"
mkdir -p "$APPIMAGE_DIR/usr/share/applications"
mkdir -p "$APPIMAGE_DIR/usr/share/icons/hicolor/256x256/apps"

# Copy Chrome binary
cp "$BUILD_DIR/chromium/src/out/Release/chrome" "$APPIMAGE_DIR/usr/bin/ucx-browser"
chmod +x "$APPIMAGE_DIR/usr/bin/ucx-browser"

# Copy icon
cp resources/ucx_icon_256.png "$APPIMAGE_DIR/usr/share/icons/hicolor/256x256/apps/ucx-browser.png"

# Create desktop file
cat > "$APPIMAGE_DIR/ucx-browser.desktop" << 'DESKTOP'
[Desktop Entry]
Name=UCX Browser
Comment=Privacy-First, Security-Hardened Browser
Exec=ucx-browser %U
Icon=ucx-browser
Terminal=false
Type=Application
Categories=Network;WebBrowser;Security;
MimeType=text/html;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
DESKTOP

cp "$APPIMAGE_DIR/ucx-browser.desktop" "$APPIMAGE_DIR/usr/share/applications/"

# Create tar.gz
tar -czvf "$OUTPUT_DIR/UCX-Browser-Linux-x64-v${VERSION}.tar.gz" -C "$APPIMAGE_DIR" .

# Copy DEB if built
if [ -f "src/out/Release/*.deb" ]; then
    cp src/out/Release/*.deb "$OUTPUT_DIR/" 2>/dev/null || true
fi

echo ""
echo "============================================================"
echo "Build Complete!"
echo "============================================================"
echo ""
echo "Output files in: $OUTPUT_DIR/"
ls -la "$OUTPUT_DIR/"
echo ""
echo "To create AppImage, run:"
echo "  wget 'https://github.com/AppImage/AppImageKit/releases/latest/download/appimagetool-x86_64.AppImage'"
echo "  chmod +x appimagetool-x86_64.AppImage"
echo "  ./appimagetool-x86_64.AppImage $APPIMAGE_DIR UCX-Browser.AppImage"
echo ""
echo "============================================================"
