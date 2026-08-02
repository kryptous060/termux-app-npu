#!/bin/bash
# Entry script for the Debian/Wine Desktop Environment
set -e
STORAGE_DIR="/sdcard/Download/debian_wine_storage"
DEBIAN_ROOT="/debian_root"

echo "Entering Desktop Environment..."

if ! mountpoint -q "$DEBIAN_ROOT"; then
    mount -o loop,compress=zstd:3 "$STORAGE_DIR/btrfs.img" "$DEBIAN_ROOT"
fi

mount -o bind /system/vendor "$DEBIAN_ROOT/system/vendor"
mount -o bind /vendor/lib64 "$DEBIAN_ROOT/vendor/lib64"

# Launch desktop with NPU and Mesa drivers
chroot "$DEBIAN_ROOT" /usr/bin/env -i \
    HOME=/root \
    TERM="$TERM" \
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    ADSP_LIBRARY_PATH="/vendor/lib/rfsa/adsp:/system/vendor/lib/rfsa/adsp:/vendor/lib64" \
    LD_LIBRARY_PATH="/usr/local/lib:/vendor/lib64:/system/vendor/lib64" \
    MESA_LOADER_DRIVER_OVERRIDE=kgsl \
    TU_DEBUG=noconform \
    GGML_HEXAGON_NDEV=2 \
    /bin/bash --login -c "startx"
