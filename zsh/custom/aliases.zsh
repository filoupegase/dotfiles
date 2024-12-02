#!/usr/bin/env zsh

# check https://corent-in.vercel.app/notes/cool-bash-tricks-for-your-terminal/

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
alias g="git"
alias gc="git commit -m"  # + commit message
alias gca="git add . && git commit -m"  # + commit message
alias gs="git status -sb"
alias gl="git log --pretty=short"
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

# Node/NPM/Yarn
alias npr="npm run"

# find all node_modules in root directories and delete them
alias fresh_all="find . -name 'node_modules' -type d -prune -exec rm -rf {} + ;"
alias fresh_npm="rm -rf node_modules package-lock.json && npm install"
alias fresh_yarn="rm -rf node_modules yarn.lock && yarn install"
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

# NX
alias run-bo="pnpm nx run front-accounting:start"
alias run-adb="pnpm nx run front-adb:start"
alias run-ml-admin="pnpm nx run front-ml-admin:start"
alias pdata="pnpm nx run plato:pdata-runner" # + script path
alias anton="pdata scripts/pdata/ML-12106.ts"

# MS
alias ms-ged="cd ~/emeria/millenium/applications && duck start --ms-ged"
alias ms-ged_worker="cd ~/emeria/millenium/applications/ms-ged && pnpm nx run start:worker all"
alias ms-document="cd ~/emeria && duck start --ms-document"
alias ms-customer="cd ~/emeria/millenium/applications && duck start --ms-customer"
alias docus="cd ~/emeria/millenium && pnpm nx run docus:start"