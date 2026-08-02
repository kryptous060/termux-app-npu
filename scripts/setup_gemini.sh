#!/bin/bash
# Install gemini-cli if not present
if ! command -v gemini-cli &> /dev/null; then
    echo "Installing gemini-cli..."
    # Assuming gemini-cli is installed via npm as is standard for many CLI tools
    npm install -g @google/gemini-cli
    
    # Global access (usually npm symlinks it to /data/data/com.termux/files/usr/bin/gemini-cli)
    # Ensure it's reachable as 'gemini'
    if [ -f "/data/data/com.termux/files/usr/bin/gemini-cli" ]; then
        ln -sf /data/data/com.termux/files/usr/bin/gemini-cli ~/bin/gemini
        echo "Done! Run with: gemini"
    else
        echo "Error: gemini-cli installation failed or binary not found."
    fi
else
    echo "gemini-cli is already installed."
fi
