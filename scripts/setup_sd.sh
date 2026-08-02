#!/bin/bash
if [ -f "$(dirname "$0")/../assets/sd-cli.tar.zst" ]; then
    echo "Extracting sd-cli..."
    mkdir -p ~/stable-diffusion.cpp/build/bin
    tar --zstd -xvf "$(dirname "$0")/../assets/sd-cli.tar.zst" -C ~/stable-diffusion.cpp/build/bin
    chmod +x ~/stable-diffusion.cpp/build/bin/sd-cli
    
    # Global access
    mkdir -p ~/bin
    ln -sf ~/stable-diffusion.cpp/build/bin/sd-cli ~/bin/sd-cli
    
    # Model directory
    mkdir -p ~/models/sd
    
    echo "Done! Run with: sd-cli"
    echo "Place models in: ~/models/sd"
else
    echo "Error: sd-cli.tar.zst not found in assets/"
fi
