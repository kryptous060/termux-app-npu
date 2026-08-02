#!/bin/bash
# Returns 'offline' if flag file exists, otherwise 'online'
if [ -f "/data/data/com.termux/files/home/Termux-app-npu/assets/IS_OFFLINE" ]; then
    echo "offline"
else
    echo "online"
fi
