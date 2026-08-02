#!/bin/bash
MODE=$(/data/data/com.termux/files/home/Termux-app-npu/scripts/check_provisioning_mode.sh)

if ! command -v npm &> /dev/null; then
    if [ "$MODE" == "offline" ]; then
        echo "Offline mode: Installing bundled Node.js..."
        dpkg -i /data/data/com.termux/files/home/Termux-app-npu/assets/deps/nodejs*.deb || echo "Offline install failed."
    else
        echo "Online mode: Installing Node.js..."
        pkg install -y nodejs
    fi
fi

if ! command -v gemini-cli &> /dev/null; then
    echo "Installing gemini-cli..."
    npm install -g @google/gemini-cli
    if [ -f "/data/data/com.termux/files/usr/bin/gemini-cli" ]; then
        mkdir -p ~/bin
        ln -sf /data/data/com.termux/files/usr/bin/gemini-cli ~/bin/gemini
    fi
fi
