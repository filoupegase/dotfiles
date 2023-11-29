#!/usr/bin/env zsh

# check https://jarv.is/notes/cool-bash-tricks-for-your-terminal-dotfiles/

# allow sudo-able aliases
alias sudo="sudo "

# colorful ls
alias ls="ls -G --color=auto"
alias ll="ls -lah"
alias la="ls -a"
alias l="ll"

# easier dotfile tinkering
alias shreload="exec \$SHELL"

# git
alias gs="git status"
alias gsb="git status -sb"

# Node/NPM/Yarn
alias npr="npm run"
alias fresh_npm="rm -rf node_modules package-lock.json && npm install"
alias fresh_yarn="rm -rf node_modules yarn.lock && yarn install"

# Check your current local IP address:
alias iplocal="ipconfig getifaddr en0"

# misc.
alias screenfetch="neofetch"
alias weather="curl 'https://wttr.in/?format=v2'"

# emeria
alias fr='echo "fr158785"'
