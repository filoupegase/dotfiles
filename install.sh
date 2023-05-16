#!/usr/bin/env bash

set -e

echo "🙏 Deep breaths, everything will (probably) be fine!"
echo ""

# location of the *full repo* (defaults to ~/.dotfiles)
DOTFILES_PATH="${DOTFILES_PATH:="$HOME/.dotfiles"}"

# set up symlinks from various default paths to files in this repo
if [[ ! -d ~/.config ]]; then
  mkdir -p ~/.config
fi
ln -sf "$DOTFILES_PATH/zsh/.zshrc" ~/.zshrc

# this file will be sourced by .zshrc for more sensitive variables/settings
touch ~/.zshrc.local

# wow
echo ""
echo "🎉 It actually worked"
echo "log out and log back in (or just restart) to finish installing all ZSH features."
