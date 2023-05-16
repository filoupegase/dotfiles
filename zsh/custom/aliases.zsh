#!/usr/bin/env zsh

# check https://jarv.is/notes/cool-bash-tricks-for-your-terminal-dotfiles/

# allow sudo-able aliases
alias sudo="sudo "

# colorful ls
alias ls="ls -G --color=auto"
alias ll="ls -lah"
alias la="ls -a"
alias l="ll"

# git
alias gs="git status"
alias gsb="git status -sb"

# Check your current local IP address:
alias iplocal="ipconfig getifaddr en0"
