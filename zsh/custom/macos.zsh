#!/usr/bin/env zsh

system_update() {
  local NC="\033[0m"
  local YELLOW="\033[0;33m"

  # homebrew
  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update
  brew upgrade
  # avoid annoying `(latest) != latest` cask updates:
  # shellcheck disable=SC2046
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  # zinit & plugins
  echo -e "${YELLOW}Updating zinit...${NC}"
  zinit self-update
  zinit update --all
}

# open current directory in Finder
alias finder="open -a Finder ."
