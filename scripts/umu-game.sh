#!/bin/bash
# Wrapper to run Windows apps via UMU and GE-Proton
# Usage: umu-game <path_to_exe>

if [ -z "$1" ]; then
    echo "Usage: umu-game <path_to_exe>"
    exit 1
fi

export PROTONPATH="/root/.local/share/Steam/compatibilitytools.d/GE-Proton"
export WINEPREFIX="$HOME/.wine"

# UMU needs to be in PATH
umu-run "$1"
