#!/bin/bash
# ============================================================
# UCX Browser - macOS Build Script
# ============================================================
# Built by KGECMD (Kayan Erkama)
# Project: UCX (Universally Created Xternal Privacy Project)
# ============================================================

set -e

VERSION="1.0.0"
BUILD_DIR="build"
OUTPUT_DIR="dist"
ARCH=${1:-"x64"}  # Default to x64, use "arm64" for Apple Silicon

echo "============================================================"
echo "UCX Browser macOS Build Script"
echo "Architecture: $ARCH"
echo "============================================================"
echo ""

# Check macOS version
if [ "$(uname)" != "Darwin" ]; then
    echo "[ERROR] This script must be run on macOS!"
    exit 1
fi

echo "[STEP 1] Checking dependencies..."

# Check for Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo "[ERROR] Xcode not found!"
    echo "Install Xcode from Mac App Store"
    exit 1
fi

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo "[INFO] Installing Python via Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install python@3.11
fi

# Accept Xcode licenses
sudo xcodebuild -license accept || true

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
CHROMIUM_VERSION=$(cat ../revision.txt 2>/dev/null || echo "main")
echo "[INFO] Checking out Chromium $CHROMIUM_VERSION"
cd chromium/src
git checkout "$CHROMIUM_VERSION"

cd /path/to/ucx-browser  # Update this path

echo "[STEP 4] Applying UCX Browser patches..."
cd /path/to/ucx-browser
python3 utils/patches.py apply -s "$BUILD_DIR/chromium/src/"

echo "[STEP 5] Building Chromium..."
cd "$BUILD_DIR/chromium/src"
export PATH="$PWD/../depot_tools:$PATH"

# Set GN args based on architecture
if [ "$ARCH" == "arm64" ]; then
    GN_ARGS="is_official_build=true symbol_level=0 target_cpu=\"arm64\""
else
    GN_ARGS="is_official_build=true symbol_level=0 target_cpu=\"x64\""
fi

gn gen out/Release --args="$GN_ARGS"
ninja -C out/Release chrome -j$(sysctl -n hw.ncpu)

if [ $? -ne 0 ]; then
    echo "[ERROR] Build failed!"
    exit 1
fi

echo "[STEP 6] Creating distribution package..."

# Create DMG
cd /path/to/ucx-browser
DMG_NAME="UCX-Browser-macOS-${ARCH}-v${VERSION}.dmg"
VOL_NAME="UCX Browser"

# Create source directory
mkdir -p "tmp_dmg/UCX Browser.app"
cp -R "$BUILD_DIR/chromium/src/out/Release/Chromium.app" "tmp_dmg/UCX Browser.app/"

# Copy icon
cp resources/ucx_icon_256.png "tmp_dmg/UCX Browser.app/"

# Create DMG
hdiutil create -volname "$VOL_NAME" -srcfolder tmp_dmg -ov -format UDZO "$OUTPUT_DIR/$DMG_NAME"

# Cleanup
rm -rf tmp_dmg

echo ""
echo "============================================================"
echo "Build Complete!"
echo "============================================================"
echo ""
echo "Output: $OUTPUT_DIR/$DMG_NAME"
echo ""
echo "To sign the app (required for distribution):"
echo "  codesign --sign \"Developer ID Application: Your Name\" \"$OUTPUT_DIR/UCX Browser.app\""
echo ""
echo "To notarize (required for Gatekeeper):"
echo "  xcrun notarytool submit \"$OUTPUT_DIR/$DMG_NAME\" --apple-id YOUR_APPLE_ID --password YOUR_APP_PASSWORD"
echo ""
echo "============================================================"
