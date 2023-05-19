#!/usr/bin/env zsh

system_update() {
  local NC="\033[0m"
  local YELLOW="\033[0;33m"

  # homebrew
  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update
  brew upgrade

  brew cleanup
}

# node, npm, yarn

# open current directory in Finder
alias finder="open -a Finder ."
