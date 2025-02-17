#!/usr/bin/env zsh

export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"  # --require-sha
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_GIT=1

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
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  # ruby, gems
  echo -e "${YELLOW}Updating Ruby and gems...${NC}"
  CONFIGURE_OPTS="$RUBY_CONFIGURE_OPTS" \
  rbenv install --skip-existing "$(rbenv install -l | grep -v - | tail -1)" && \
  rbenv global "$(rbenv install -l | grep -v - | tail -1)"
  gem install bundler foreman
  gem update
  gem cleanup
  rbenv rehash

  # pips
  # https://stackoverflow.com/a/3452888
  echo -e "${YELLOW}Updating pip packages...${NC}"
  pip3 list --outdated --format=json | jq -r '.[] | .name+"="+.latest_version' | cut -d = -f 1 | xargs -n1 pip3 install -U

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

  # App Store
  echo -e "${YELLOW}Checking for App Store updates...${NC}"
  mas outdated

  # macOS system
  echo -e "${YELLOW}Checking for macOS system updates...${NC}"
  softwareupdate --list
}

# open current directory in Finder
alias finder="open -a Finder ."
