#!/bin/bash
MODE=$(/data/data/com.termux/files/home/Termux-app-npu/scripts/check_provisioning_mode.sh)

if ! command -v python &> /dev/null; then
    if [ "$MODE" == "offline" ]; then
        echo "Offline mode: Installing bundled Python..."
        dpkg -i /data/data/com.termux/files/home/Termux-app-npu/assets/deps/python*.deb || echo "Offline install failed."
    else
        echo "Online mode: Installing Python..."
        pkg install -y python
    fi
fi

if ! command -v interpreter &> /dev/null; then
    echo "Installing open-interpreter..."
    pip install open-interpreter
fi
