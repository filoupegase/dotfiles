#!/usr/bin/env zsh

# System
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'

# allow sudo-able aliases
alias sudo="sudo "

# colorful ls
alias ls="ls -G --color=auto"
alias ll="ls -lah"
alias la="ls -a"
alias l="ll"

# easier dotfile tinkering
alias shreload="exec \$SHELL"
alias shdebug="DOTFILES_DEBUG=1 exec \$SHELL"

# Git
alias g='git'
alias ga='git add'
alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add' # Git add with fzf
alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm' # Git rm with fzf
alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore' # Git restore with fzf
alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged' # Git restore --staged with fzf

alias gf='git fetch'
alias gup='git fetch && git rebase'
alias gtd='git tag --delete'

# git status
alias gs='git status'
alias gss='git status -s'

# git log
alias gl="git log --pretty=short"
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'

alias gd="git diff"
alias gds="git diff --staged"
alias gpom="git push origin main"
alias glom="git pull origin main"
alias gpo="git push origin"  # + branch name
alias glo="git pull origin"  # + branch name
alias glfm="git fetch && git reset origin/main --hard"
alias gb="git checkout"  # + existing branch name
alias gbn="git checkout -b"  # + new branch name
alias grm="git rebase -i origin/main"
alias gsub="git submodule update --recursive --remote"
alias gundo="git reset --soft HEAD~1"
alias gres="git reset"
alias github="gh repo view --web"
alias gist="gh gist create --web"

alias gc="git commit -m"  # + commit message
alias gca="git add . && git commit -m"  # + commit message
alias gcmnv='git commit --no-verify -m'
alias gcanenv='git commit --amend --no-edit --no-verify'

# docker
alias dps="docker ps -a"
dbar() {
  # build a Dockerfile in the current directory and run it interactively:
  # https://stackoverflow.com/questions/45141402/build-and-run-dockerfile-with-one-command/59220656#59220656
  docker run --rm -it "$(docker build --no-cache -q .)"
}
dsh() {
  docker exec -it "$1" /bin/sh
}
# alias dc="docker-compose"
alias dc="docker compose"
alias dcu="dc up -d"
alias dcd="dc down"
alias dcr="dcd && dcu"
alias dcl="dc logs -f"

# multipass
alias mp="multipass"
mpl() {
  # creates VM and opens its bash shell
  # `mpl test1 4G 20.04`
  multipass launch "${2:-jammy}" --cpus=4 --memory="${3:-2G}" --disk="${4:-20G}" --name="$1" && \
  multipass shell "$1"
}
mpd() {
  multipass delete "$1" && multipass purge
}
alias mpls="multipass list"
alias mpsh="multipass shell"
alias mpk="multipass stop"

# Node/NPM/Yarn
alias npr="npm run"
alias yar="yarn run"
alias pnpr="pnpm run"
alias fresh_yarn="rm -rf node_modules yarn.lock && yarn install"

alias ps="pnpm start"

# an original creation, see https://github.com/jakejarvis/simpip
alias ipv4="curl -4 simpip.com --max-time 1 --proto-default https --silent"
alias ipv6="curl -6 simpip.com --max-time 1 --proto-default https --silent"
alias ip="ipv4; ipv6"
alias ip-local="ipconfig getifaddr en0"
alias ips="ip; ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# youtube-dl
alias youtube-dl="yt-dlp"  # better youtube-dl fork: https://github.com/yt-dlp/yt-dlp
alias ytdl="youtube-dl -f bestvideo+bestaudio"
alias ytmp3="youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 320K"

# find all node_modules in root directories and delete them
alias fresh_all="find . -name 'node_modules' -type d -prune -exec rm -rf {} + ;"
alias fresh_npm="rm -rf node_modules package-lock.json && npm install"
alias fresh_pnpm="rm -rf node_modules pnpm-lock.yaml && pnpm store prune && pnpm install"

# Check your current local IP address:
alias iplocal="ipconfig getifaddr en0"

# misc.
alias screenfetch="neofetch"
alias weather="curl 'https://wttr.in/?format=v2'"

# EMERIA
alias fr='echo "fr158785"'

# plato
alias plato="pnpm nx run plato:start"
alias plato-skip-cache="pnpm store prune && pnpm nx reset && pnpm nx run plato:start --skip-nx-cache"
alias worker-plato="pnpm nx run worker all"
alias flow-plato="pnpm nx run workflows --all"

# front
alias run-bo="pnpm nx run front-accounting:start"
alias run-adb="pnpm nx run front-adb:start"
alias run-ml-admin="pnpm nx run front-ml-admin:start"

alias run-gtw="pnpm nx run @emeria/gateway:start"

alias pplato="pnpm nx run plato:pdata" # + script path
alias anton="pdata scripts/pdata/ML-12106.ts"
alias scope_admin="pnpm nx run ms-associate:pdata scripts/pdata/2024-12/create-admin-scopes-group.ts"
alias scope_agencies="pnpm nx run ms-associate:pdata scripts/pdata/2024-12/add-all-agencies-to-accounting-director.ts"

# MS
alias ms-ged="cd ~/emeria/millenium/applications && duck start --ms-ged"
alias ms-ged_worker="cd ~/emeria/millenium/applications/ms-ged && pnpm nx run start:worker all"
alias ms-document="cd ~/emeria && duck start --ms-document"
alias ms-customer="cd ~/emeria/millenium/applications && duck start --ms-customer"
alias docus="cd ~/emeria/millenium && pnpm nx run docus:start"