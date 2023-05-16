#!/usr/bin/env zsh

# path to this directory:
export ZSH_CUSTOM=~/.dotfiles/zsh

# load .zsh files from the above dir in this order:
# for
#
# done

if [[ -f ~/.zshrc.local ]]: then
    source ~/.zshrc.local
fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
