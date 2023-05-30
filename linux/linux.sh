#!/usr/bin/env bash

set -e

# set machine's timezone to local time
sudo timedatectl set-timezone Europe/Paris

# install linuxbrew:
# https://docs.brew.sh/Homebrew-on-Linux#install
if ! command -v brew &>/dev/null; then
  # TODO: hack to permit installing as root, find a better way
  # https://github.com/Homebrew/install/blob/master/install.sh#L306
  sudo touch /.dockerenv
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  sudo rm /.dockerenv
fi

# install tailscale
if ! command -v tailscale &>/dev/null; then
  curl -fsSL https://tailscale.com/install.sh | bash
fi
