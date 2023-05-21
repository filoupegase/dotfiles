#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront
sudo -v

# Make sure macOS is fully up to date before doing anything
sudo softwareupdate --install --all

# Install Rosetta 2
sudo softwareupdate --install-rosetta --agree-to-license

# Install Xcode Command Line Tools
sudo xcode-select --install
# Accept Xcode license
sudo xcodebuild -license accept

# This whole thing kinda hinges on having Homebrew...
# Check for it and install from GitHub if it's not there
if ! command -v brew &>/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

# modifie le temps de l'animation que prends les apps du doc a s'afficher + le reset
#defaults write com.apple.dock autohide-delay -float 0
#defaults write com.apple.dock autohide-time-modifier -float 0.3; killall Dock
