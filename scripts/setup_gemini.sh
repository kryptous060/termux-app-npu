#!/bin/bash
MODE=$(/data/data/com.termux/files/home/Termux-app-npu/scripts/check_provisioning_mode.sh)

# Install nodejs/npm
if ! command -v npm &> /dev/null; then
    if [ "$MODE" == "offline" ]; then
        echo "Offline mode: Extracting bundled Node.js..."
        # Logic to extract bundled Node.js from assets/nodejs-lts.tar.xz
        tar -xf /data/data/com.termux/files/home/Termux-app-npu/assets/nodejs-lts.tar.xz -C /data/data/com.termux/files/usr/
    else
        echo "Online mode: Installing Node.js via pkg..."
        pkg update -y && pkg install -y nodejs
    fi
fi

# Install gemini-cli
if ! command -v gemini-cli &> /dev/null; then
    echo "Installing gemini-cli..."
    npm install -g @google/gemini-cli
    # ... rest of symlink logic
fi
