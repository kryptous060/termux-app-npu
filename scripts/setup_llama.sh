#!/bin/bash
if [ -f "$(dirname "$0")/../assets/llama-cli.tar.zst" ]; then
    echo "Extracting llama-cli..."
    mkdir -p ~/llama.cpp/build/bin
    tar --zstd -xvf "$(dirname "$0")/../assets/llama-cli.tar.zst" -C ~/llama.cpp/build/bin
    chmod +x ~/llama.cpp/build/bin/llama-cli
    
    # Global access
    mkdir -p ~/bin
    ln -sf ~/llama.cpp/build/bin/llama-cli ~/bin/llama-cli
    
    # Model directory
    mkdir -p ~/models/llm
    
    echo "Done! Run with: llama-cli"
    echo "Place models in: ~/models/llm"
else
    echo "Error: llama-cli.tar.zst not found in assets/"
fi
