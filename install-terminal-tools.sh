#!/bin/bash
set -e

echo "=== Arch Linux Terminal Tools Installation ==="
echo ""

if ! command -v pacman &>/dev/null; then
  echo "Error: This script is designed for Arch Linux (pacman not found)"
  exit 1
fi

TOOLS=(
  "fish"
  "eza"
  "fzf"
  "zoxide"
  "fastfetch"
  "yazi"
  "neovim"
  "git"
  "curl"
  "wget"
  "stow"
  "tmux"
  "starship"
)

echo "Packages: ${TOOLS[*]}"
echo ""
read -p "Install? [y/N] " -n 1 -r
echo ""
[[ ! $REPLY =~ ^[Yy]$ ]] && exit 0

sudo pacman -S --needed "${TOOLS[@]}"

echo ""
echo "=== Setting up Fish shell ==="
echo ""

read -p "Setup fish (stow + fisher + plugins)? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "📁 Stowing fish config..."
  stow fish

  echo "📦 Installing fisher..."
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

  echo "📦 Installing plugins from fish_plugins..."
  fish -c "fisher update"

  echo ""
  echo "Installed plugins:"
  fish -c "fisher list"
fi

echo ""
echo "=== Setting up tmux (Oh my tmux!) ==="
echo ""

read -p "Setup tmux (oh-my-tmux)? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "📦 Installing Oh my tmux!..."
  curl -fsSL "https://github.com/gpakosz/.tmux/raw/refs/heads/master/install.sh" | bash

  echo "📁 Stowing tmux config..."
  rm -f "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf.local"
  stow tmux
fi

echo ""
echo "=== Done ==="
echo ""
echo "To use fish as default shell:"
echo "  chsh -s /usr/bin/fish"
