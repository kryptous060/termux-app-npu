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

# Extract Proton build to the compatibilitytools directory
# Note: This script assumes it is in /data/data/com.termux/files/home/Termux-app-npu/scripts/
PROTON_ARCHIVE="/data/data/com.termux/files/home/Termux-app-npu/assets/Proton-9.0.tar.xz"
PROTON_DIR="$DEBIAN_ROOT/root/.local/share/Steam/compatibilitytools.d/GE-Proton"
mkdir -p "$PROTON_DIR"
tar -xf "$PROTON_ARCHIVE" -C "$PROTON_DIR"

echo "Environment prepared. Run 'desktop' to enter."
