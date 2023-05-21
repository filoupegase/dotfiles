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
ln -sf "$DOTFILES_PATH/zsh/.zprofile" ~/.zprofile
ln -sf "$DOTFILES_PATH/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_PATH/git/.gitignore_global" ~/.gitignore_global

# this file will be sourced by .zshrc for more sensitive variables/settings
touch ~/.zshrc.local

# prepare zinit manually
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# the remainder of the setup tasks are OS-specific
if [[ "$OSTYPE" = "darwin"* ]]; then
  ln -sf "$DOTFILES_PATH/Brewfile" ~/Brewfile

  # suppress terminal login banners
  touch ~/.hushlogin

else
  echo "I don't recognize this OS... skipping extra steps."
fi

# wow
echo ""
echo "🎉 It actually worked"
echo "log out and log back in (or just restart) to finish installing all ZSH features."
