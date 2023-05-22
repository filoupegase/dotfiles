#!/usr/bin/env zsh

# set PATH, MANPATH, etc.., for Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
  # macOS on Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  # macOS on x86
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
  # Linux, system install
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -d "$HOME/.linuxbrew" ]]; then
  # Linux, user install
  eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
fi

# volta
if [[ -d "$HOME/.volta" ]]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi
