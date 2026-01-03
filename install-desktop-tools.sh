#!/bin/bash
set -e

echo "=== Arch Linux Desktop Tools Installation ==="
echo ""

if ! command -v pacman &> /dev/null; then
    echo "Error: This script is designed for Arch Linux (pacman not found)"
    exit 1
fi

TOOLS=(
    "ghostty"
    "wezterm"
    "fcitx5"
    "fcitx5-chinese-addons"
    "fcitx5-configtool"
    "niri"
    "zed"
)

echo "Packages: ${TOOLS[*]}"
echo ""
read -p "Install? [y/N] " -n 1 -r
echo ""
[[ ! $REPLY =~ ^[Yy]$ ]] && exit 0

sudo pacman -S --needed "${TOOLS[@]}"

echo ""
echo "=== Stowing configs ==="
echo ""

CONFIGS=(
    "ghostty"
    "wezterm"
    "fcitx5"
    "niri"
    "zed"
    "opencode"
    "vicinae"
)

for cfg in "${CONFIGS[@]}"; do
    read -p "Stow $cfg? [y/N] " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        stow "$cfg"
        echo "✅ $cfg stowed"
    fi
done

echo ""
echo "=== Done ==="
