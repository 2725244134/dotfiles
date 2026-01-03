#!/usr/bin/env bash
# Fish shell setup script - installs fisher and plugins

set -e

echo "🐟 Setting up Fish shell..."

# Check if fish is installed
if ! command -v fish &> /dev/null; then
    echo "❌ Error: fish shell is not installed"
    echo "Install it first: sudo pacman -S fish"
    exit 1
fi

# Install fisher (plugin manager)
echo "📦 Installing fisher..."
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Install all plugins from fish_plugins
echo "📦 Installing plugins..."
fish -c "fisher update"

echo "✅ Fish setup complete!"
echo ""
echo "To use fish as default shell:"
echo "  chsh -s /usr/bin/fish"
