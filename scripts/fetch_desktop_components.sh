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

# 6. UMU-Launcher & GE-Proton
echo "Fetching UMU-Launcher..."
UMU_URL=$(curl -s https://api.github.com/repos/Open-Wine-Components/umu-launcher/releases/latest | jq -r '.assets[] | select(.name | contains("x86_64")) | .browser_download_url' | head -n 1)
curl -L -o umu-launcher.tar.xz "$UMU_URL"

echo "Fetching GE-Proton..."
PROTON_URL=$(curl -s https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest | jq -r '.assets[] | select(.name | contains("tar.gz")) | .browser_download_url' | head -n 1)
curl -L -o GE-Proton.tar.gz "$PROTON_URL"

echo "All components fetched to /tmp/desktop_fetch. Please move them to your Btrfs image/chroot as needed."
