#!/usr/bin/env zsh

# path to this directory:
export ZSH_CUSTOM=~/.dotfiles/zsh

if [[ -f ~/.zshrc.local ]]: then
    source ~/.zshrc.local
fi
