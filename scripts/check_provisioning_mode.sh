#!/bin/bash
# Returns 'offline' if flag file exists, otherwise 'online'
if [ -f "$HOME/termux-app-npu/assets/IS_OFFLINE" ] || [ -f "$HOME/Termux-app-npu/assets/IS_OFFLINE" ]; then
    echo "offline"
else
    echo "online"
fi
