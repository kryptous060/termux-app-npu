#!/bin/bash
# Install nodejs/npm if not present
if ! command -v npm &> /dev/null; then
    echo "Node.js/npm not found. Installing..."
    # Update package lists and install nodejs
    pkg update -y && pkg install -y nodejs
fi

# Install gemini-cli if not present
if ! command -v gemini-cli &> /dev/null; then
    echo "Installing gemini-cli..."
    npm install -g @google/gemini-cli
    
    # Ensure it's reachable as 'gemini'
    # npm typically installs to /data/data/com.termux/files/usr/bin/
    if [ -f "/data/data/com.termux/files/usr/bin/gemini-cli" ]; then
        mkdir -p ~/bin
        ln -sf /data/data/com.termux/files/usr/bin/gemini-cli ~/bin/gemini
        echo "Done! Run with: gemini"
    else
        echo "Error: gemini-cli installation failed."
    fi
else
    echo "gemini-cli is already installed."
fi
