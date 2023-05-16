#!/usr/bin/env bash

#fetch dans install Volta (better than nvm)
if ! command -v volta &>/dev/null; then
  # curl https://get.volta.sh | bash -s -- --skip-setup
  brew install volta
fi
