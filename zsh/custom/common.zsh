#!/usr/bin/env zsh

autoload -U colors && colors

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz select-word-style
select-word-style bash

# enable bash-like 'help' command for zsh:
# https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
unalias run-help 2>/dev/null
autoload run-help
alias help=run-help

# ---

setopt notify
setopt complete_in_word
setopt always_to_end
setopt extended_history
setopt hist_expire_dups_first
# setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
setopt inc_append_history
setopt rc_quotes
setopt autocd
setopt extended_glob
setopt glob_dots
unsetopt case_glob
unsetopt beep  # kindly stfu
unsetopt correct
unsetopt correct_all

# ---
