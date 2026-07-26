#!/bin/bash
# 1. Ensure assets exist
if [ -f "$(dirname "$0")/../assets/llama-cli.tar.zst" ]; then
    echo "Extracting llama-cli..."
    mkdir -p ~/llama.cpp/build/bin
    tar --zstd -xvf "$(dirname "$0")/../assets/llama-cli.tar.zst" -C ~/llama.cpp/build/bin
    chmod +x ~/llama.cpp/build/bin/llama-cli
    echo "Done! Run with: ~/llama.cpp/build/bin/llama-cli"
else
    echo "Binary not found in assets/!"
fi
