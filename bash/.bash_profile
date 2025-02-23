# super minimal bash setup for fallback, debugging, miscellaneous tasks, etc.

# disable unnecessary history
set +o history
export SHELL_SESSION_HISTORY=0

# hide macOS zsh default warning
export BASH_SILENCE_DEPRECATION_WARNING=1