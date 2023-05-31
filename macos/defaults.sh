#!/usr/bin/env bash

#  Modified and patched together from a few sources:
#
#    https://mths.be/macos
#    https://github.com/paulirish/dotfiles/blob/master/.osx
#    https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

set -e

# Change new hostname here if necessary
COMPUTER_NAME="CL-MBA"

# Quit System Preferences.app if open
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

###############################################################################
# Dock                                                                        #
###############################################################################

# Automatically hide and show the Dock without delay
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true

###############################################################################
# iTerm 2                                                                     #
###############################################################################

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
