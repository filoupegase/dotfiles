#!/usr/bin/env zsh

# Make a new directory and `cd` right into it (this seems like a no-brainer)
mkcd() {
  if mkdir -p -- "$1"; then
    cd -- "$1" || return
  fi
}
