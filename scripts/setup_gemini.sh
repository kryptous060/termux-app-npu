#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE=$("$SCRIPT_DIR/check_provisioning_mode.sh")

if ! command -v npm &> /dev/null; then
    if [ "$MODE" == "offline" ]; then
        echo "Offline mode: Installing bundled Node.js..."
        dpkg -i "$SCRIPT_DIR/../assets/deps/nodejs"*.deb || echo "Offline install failed."
    else
        echo "Online mode: Installing Node.js..."
        pkg install -y nodejs
    fi
fi

if ! command -v gemini-cli &> /dev/null; then
    echo "Installing gemini-cli..."
    npm install -g @google/gemini-cli
    if [ -f "$PREFIX/bin/gemini-cli" ]; then
        mkdir -p ~/bin
        ln -sf "$PREFIX/bin/gemini-cli" ~/bin/gemini
    fi
fi
