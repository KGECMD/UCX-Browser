@echo off
REM ============================================================
REM UCX Browser - Windows Build Script
REM ============================================================
REM Built by KGECMD (Kayan Erkama)
REM Project: UCX (Universally Created Xternal Privacy Project)
REM ============================================================

echo ============================================================
echo UCX Browser Windows Build Script
echo ============================================================
echo.

REM Check for Visual Studio
where devenv >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Visual Studio 2022 not found!
    echo Please install Visual Studio 2022 with C++ workload
    echo Download: https://visualstudio.microsoft.com/downloads/
    exit /b 1
)

REM Set build version
set VERSION=1.0.0
set BUILD_DIR=build
set OUTPUT_DIR=dist

echo [INFO] UCX Browser v%VERSION% - Windows Build
echo.

REM Create directories
if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

echo [STEP 1] Installing Python...
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Python not found. Please install Python 3.8+ from python.org
    exit /b 1
)

echo [STEP 2] Installing depot_tools...
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git "%BUILD_DIR%\depot_tools"
set PATH=%BUILD_DIR%\depot_tools;%PATH%

echo [STEP 3] Fetching Chromium source...
cd /d "%BUILD_DIR%"
mkdir chromium
cd chromium
fetch --nohooks chromium
cd src

REM Read version from revision.txt
set /p CHROMIUM_VERSION=<..\..\revision.txt
echo [INFO] Checking out Chromium %CHROMIUM_VERSION%
git checkout %CHROMIUM_VERSION%

cd /d "%~dp0"

echo [STEP 4] Applying UCX Browser patches...
python "%BUILD_DIR%\chromium\src\..\..\utils\patches.py" apply -s "%BUILD_DIR%\chromium\src\"

echo [STEP 5] Installing build dependencies...
call "%BUILD_DIR%\chromium\src\build\install-build-deps.bat"

echo [STEP 6] Running gclient hooks...
cd /d "%BUILD_DIR%\chromium\src"
gclient runhooks
cd /d "%~dp0"

echo [STEP 7] Building Chromium...
cd /d "%BUILD_DIR%\chromium\src"
gn gen out\Release --args="is_official_build=true symbol_level=0 enable_precompiled_headers=false"

REM Build with multiple threads
ninja -C out\Release chrome -j%NUMBER_OF_PROCESSORS%

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Build failed!
    exit /b 1
)

echo [STEP 8] Creating distribution package...
cd /d "%OUTPUT_DIR%"
powershell Compress-Archive -Path "%BUILD_DIR%\chromium\src\out\Release\*" -DestinationPath "UCX-Browser-Windows-x64-v%VERSION%.zip" -Force

REM Copy icon
copy "%~dp0resources\ucx_icon.ico" "%OUTPUT_DIR%\"

echo.
echo ============================================================
echo Build Complete!
echo ============================================================
echo Output: %OUTPUT_DIR%\UCX-Browser-Windows-x64-v%VERSION%.zip
echo.
echo To run SmartScreen bypass:
echo 1. Right-click the .exe and select Properties
echo 2. Check "Unblock" checkbox
echo 3. Click OK
echo.
echo Or: Click "More info" then "Run anyway" on SmartScreen
echo ============================================================

pause
