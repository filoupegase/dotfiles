#!/usr/bin/env zsh

export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"

# Rosetta hacks for M1
alias intel="arch -x86_64 /bin/zsh"
alias arm="arch -arm64 zsh"

system_update() {
  local NC="\033[0m"
  local YELLOW="\033[0;33m"

  # homebrew
  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update && brew upgrade
  # avoid annoying `(latest) != latest` cask updates:
  # shellcheck disable=SC2046
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  # node, npm, yarn, pnpm & package
  echo -e "${YELLOW}Updating global NPM/Yarn packages...${NC}"
  volta fetch node@latest # pull latest non-LTS version but don't use it
  volta install node@lts
  volta install yarn@1
  volta install pnpm@latest
  volta run --node lts --no-yarn -- npm update --global
  volta run --node lts --yarn 1 -- yarn global upgrade

  volta install @fonciastark/foncia-duck@latest

  # zinit & plugins
  echo -e "${YELLOW}Updating zinit...${NC}"
  zinit self-update
  zinit update --all
}

# open current directory in Finder
alias finder="open -a Finder ."
