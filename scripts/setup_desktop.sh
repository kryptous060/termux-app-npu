#!/bin/bash
# Setup script for the Debian/Wine Desktop Environment
echo "Setting up Debian environment..."

# 1. Create storage image
STORAGE_DIR="/sdcard/Download/debian_wine_storage"
mkdir -p "$STORAGE_DIR"
if [ ! -f "$STORAGE_DIR/btrfs.img" ]; then
    echo "Creating Btrfs image..."
    fallocate -l 16G "$STORAGE_DIR/btrfs.img"
    mkfs.btrfs "$STORAGE_DIR/btrfs.img"
fi

# 2. Setup root directory
DEBIAN_ROOT="/debian_root"
mkdir -p "$DEBIAN_ROOT"

# Assets path
ASSETS_DIR="/data/data/com.termux/files/home/Termux-app-npu/assets"

# Extract Proton
PROTON_DIR="$DEBIAN_ROOT/root/.local/share/Steam/compatibilitytools.d/GE-Proton"
mkdir -p "$PROTON_DIR"
tar -xf "$ASSETS_DIR/Proton-9.0.tar.xz" -C "$PROTON_DIR"

# Extract Components
INSTALL_DIR="$DEBIAN_ROOT/usr/local/"
tar -xf "$ASSETS_DIR/Box64.tar.xz" -C "$INSTALL_DIR"
tar -xf "$ASSETS_DIR/FEX.tar.xz" -C "$INSTALL_DIR"
tar -xf "$ASSETS_DIR/DXVK.tar.xz" -C "$INSTALL_DIR"
tar -xf "$ASSETS_DIR/Vkd3d.tar.xz" -C "$INSTALL_DIR"
tar -xf "$ASSETS_DIR/WOWBox64.tar.xz" -C "$INSTALL_DIR"

echo "Environment prepared. Run 'desktop' to enter."
