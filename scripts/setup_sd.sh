#!/bin/bash
if [ -f "$(dirname "$0")/../assets/sd-cli.tar.zst" ]; then
    echo "Extracting sd-cli..."
    mkdir -p ~/stable-diffusion.cpp/build/bin
    tar --zstd -xvf "$(dirname "$0")/../assets/sd-cli.tar.zst" -C ~/stable-diffusion.cpp/build/bin
    chmod +x ~/stable-diffusion.cpp/build/bin/sd-cli
    echo "Done! Run with: ~/stable-diffusion.cpp/build/bin/sd-cli"
else
    echo "Error: sd-cli.tar.zst not found in assets/"
fi
