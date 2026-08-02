#!/bin/bash
# Fetcher script for Desktop components (Box64, FEX, DXVK, Drivers, Wine)
echo "Fetching desktop components..."

mkdir -p /tmp/desktop_fetch
cd /tmp/desktop_fetch

# 1. Box64
echo "Fetching Box64..."
BOX64_URL=$(curl -s https://api.github.com/repos/ptitSeb/box64/releases/latest | jq -r '.assets[] | select(.name | contains("arm64")) | .browser_download_url' | head -n 1)
curl -L -o box64.tar.gz "$BOX64_URL"

# 2. FEX-Emu
echo "Fetching FEX-Emu..."
FEX_URL=$(curl -s https://api.github.com/repos/FEX-Emu/FEX/releases/latest | jq -r '.assets[] | select(.name | contains("tar.gz")) | .browser_download_url' | head -n 1)
curl -L -o fex.tar.gz "$FEX_URL"

# 3. DXVK
echo "Fetching DXVK..."
DXVK_URL=$(curl -s https://api.github.com/repos/doitsujin/dxvk/releases/latest | jq -r '.assets[] | select(.name | contains("tar.gz")) | .browser_download_url' | head -n 1)
curl -L -o dxvk.tar.gz "$DXVK_URL"

# 4. Turnip/Zink Drivers
echo "Fetching Turnip/Zink Drivers..."
TURNIP_URL=$(curl -s https://api.github.com/repos/alexvorxx/Zink-Mesa-Xlib/releases/latest | jq -r '.assets[] | select(.name | contains("zip") or contains("tar.gz")) | .browser_download_url' | head -n 1)
curl -L -o turnip.zip "$TURNIP_URL"

# 5. Wine Builds
echo "Fetching Custom Wine..."
WINE_URL=$(curl -s https://api.github.com/repos/GunaCharanTeja/WinlatorMali/releases/latest | jq -r '.assets[] | select(.name | contains("wine") or contains("tar.xz")) | .browser_download_url' | head -n 1)
curl -L -o wine_build.tar.xz "$WINE_URL"

echo "All components fetched to /tmp/desktop_fetch. Please move them to your Btrfs image/chroot as needed."
