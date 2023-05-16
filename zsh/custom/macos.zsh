#!/usr/bin/env zsh

system_update() {
  # homebrew
  brew update
  brew upgrade

  brew cleanup
}

# node, npm, yarn

# open current directory in Finder
alias finder="open -a Finder ."
