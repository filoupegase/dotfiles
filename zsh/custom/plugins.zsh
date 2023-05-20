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

# grab bat (better cat) binary
zinit ice from"gh-r" as"command" \
  mv"bat-*/bat -> bat" \
  atclone"
    mv -vf bat-*/autocomplete/bat.zsh _bat
    mv -vf bat-*/bat.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload"
    export BAT_THEME='base16'
    export BAT_PAGER='less -R -F -+X --mouse'
    export MANPAGER='sh -c \"col -bx | bat --color=always --style=plain --language=man\"'
    alias cat='bat --paging=never --color=auto --style=numbers,changes'
    alias cats='bat --paging=always --color=always --style=numbers,changes'
    alias catcat='\cat --paging=never --color=auto --style=plain'
  "
zinit light sharkdp/bat

# grab delta binary
zinit ice from"gh-r" as"command" \
  mv"delta-*/delta -> delta" \
  dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
  atload"
    # https://dandavison.github.io/delta/mouse-scrolling.html
    export DELTA_PAGER='less -R -F -+X --mouse'
  "
zinit light dandavison/delta

# grab fd binary
# TODO: preview commands are an absolute sh*tshow, maybe use .lessfilter?
# https://github.com/Aloxaf/fzf-tab/wiki/Preview#show-file-contents
# shellcheck disable=SC2016
zinit ice from"gh-r" as"command" \
  mv"fd-*/fd -> fd" \
  atclone"
    mv -vf fd-*/autocomplete/_fd _fd
    mv -vf fd-*/fd.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload'
    FZF_FD_OPTS="--color always --hidden --follow --exclude .git --exclude node_modules"
    FZF_PREVIEW_FILE_COMMAND="bat --color=always --paging=never --style=plain"
    FZF_PREVIEW_DIR_COMMAND="exa -1a --color=always --icons --group-directories-first"
    FZF_DEFAULT_OPTS="--no-mouse --bind \"tab:accept,ctrl-y:preview-page-up,ctrl-v:preview-page-down,ctrl-e:execute-silent(\${VISUAL:-code} {+} >/dev/null 2>&1)\""
    FZF_DEFAULT_COMMAND="fd --type f $FZF_FD_OPTS"
    FZF_ALT_C_OPTS="--ansi --preview \"$FZF_PREVIEW_DIR_COMMAND {} 2>/dev/null\""
    FZF_ALT_C_COMMAND="fd --type d . $FZF_FD_OPTS"
    FZF_CTRL_T_OPTS="--ansi --bind \"ctrl-w:execute(\${EDITOR:-nano} {1} >/dev/tty </dev/tty)+refresh-preview\" --preview \"$FZF_PREVIEW_FILE_COMMAND {} 2>/dev/null\""
    FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  '
zinit light sharkdp/fd

# grab fzf binary from release & other files from source
zinit ice from"gh-r" as"command" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/key-bindings.zsh -> key-bindings.zsh" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/completion.zsh -> _fzf" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
  src"key-bindings.zsh"
zinit light junegunn/fzf


















