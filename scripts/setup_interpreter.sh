#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE=$("$SCRIPT_DIR/check_provisioning_mode.sh")

if ! command -v python &> /dev/null; then
    if [ "$MODE" == "offline" ]; then
        echo "Offline mode: Installing bundled Python..."
        dpkg -i "$SCRIPT_DIR/../assets/deps/python"*.deb || echo "Offline install failed."
    else
        echo "Online mode: Installing Python..."
        pkg install -y python
    fi
fi

if ! command -v interpreter &> /dev/null; then
    echo "Installing open-interpreter..."
    pip install open-interpreter
fi
