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

# This setup script would normally run as root.
# In a Termux context, this needs to be executed via a su-enabled environment.
echo "Environment prepared. Run 'desktop' to enter."
