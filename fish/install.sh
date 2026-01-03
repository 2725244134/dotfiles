#!/usr/bin/env bash

set -e

echo "🐟 Setting up Fish shell..."

if ! command -v fish &> /dev/null; then
    echo "❌ Error: fish shell is not installed"
    echo "Install it first: sudo pacman -S fish"
    exit 1
fi

if [ ! -f ~/.config/fish/fish_plugins ]; then
    echo "❌ Error: fish config not found at ~/.config/fish"
    echo "Run 'stow fish' first to symlink the config"
    exit 1
fi

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
