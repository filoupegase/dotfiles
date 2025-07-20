#!/usr/bin/env zsh

# Make a new directory and `cd` right into it (this seems like a no-brainer)
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Load .env file into shell session for environment variables
# https://github.com/thoughtbot/dotfiles/blob/main/zsh/functions/envup
envup() {
  if [ -f .env ]; then
    export $(sed '/^ *#/ d' .env)
  else
    echo 'No .env file found' 1>&2
    return 1
  fi
}