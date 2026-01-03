#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🐟 Setting up Fish shell..."

if ! command -v fish &> /dev/null; then
    echo "❌ Error: fish shell is not installed"
    echo "Install it first: sudo pacman -S fish"
    exit 1
fi

echo "📦 Symlinking fish config..."
mkdir -p ~/.config
ln -sf "$SCRIPT_DIR/.config/fish" ~/.config/fish

echo "📦 Installing fisher..."
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

echo "📦 Installing plugins from fish_plugins..."
fish -c "fisher update"

echo "✅ Fish setup complete!"
echo ""
echo "Installed plugins:"
fish -c "fisher list"
echo ""
echo "To use fish as default shell:"
echo "  chsh -s /usr/bin/fish"
