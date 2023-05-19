#!/usr/bin/env zsh

autoload -U colors && colors

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz select-word-style
select-word-style bash

# enable bash-like 'help' command for zsh:
# https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
unalias run-help 2>/dev/null
# Remove the default of run-help being aliased to man
autoload run-help
# Use zsh's run-help, which will display information for zsh builtins.
alias help=run-help

# ---

setopt notify

# ---
