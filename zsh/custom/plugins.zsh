#!/usr/bin/env zsh

# check for zinit and clone if not installed
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# initialize zinit
# shellcheck disable=SC1091
source "$ZINIT_HOME/zinit.zsh"

# ensure compinit recognizes zinit's changes
autoload -Uz _zinit
# shellcheck disable=SC2154
# shellcheck disable=SC2034
(( ${+_comps} )) && _comps[zinit]=_zinit

# various zinit add-ons
zinit light zdharma-continuum/zinit-annex-patch-dl

# async support
zinit ice wait lucid \
  atload"async_init" \
  src"async.zsh"
zinit light mafredri/zsh-async
