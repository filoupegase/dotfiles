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

# z
zinit ice wait lucid blockf \
  atclone"
    mv -vf z.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload"_Z_DATA=~/.zdata" \
  src"z.sh"
zinit light rupa/z

# grab exa (better ls) binary
zinit ice from"gh-r" as"command" \
  mv"bin/exa* -> exa" \
  atclone"
    mv -vf completions/exa.zsh _exa
    mv -vf man/exa.1 ${ZINIT[MAN_DIR]}/man1
    mv -vf man/exa_colors.5 ${ZINIT[MAN_DIR]}/man5
  " \
  atpull"%atclone" \
  atload"
    alias ls='exa --color=auto -GF --icons --group-directories-first'
    alias ll='exa --color=auto -1laF --git --icons --group-directories-first --ignore-glob=\".DS_Store*|~*\"'
    alias lt='ll -T -L=2'
  "
zinit light ogham/exa
