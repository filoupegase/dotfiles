###############################
#  Taps                       #
###############################
tap "1password/tap"
tap "dart-lang/dart"
tap "hashicorp/tap"
tap "homebrew/aliases"
tap "homebrew/autoupdate"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"
tap "ngrok/ngrok"
tap "planetscale/tap"
tap "sass/sass"
tap "sidneys/homebrew"

###############################
#  Binaries                   #
###############################

# Perhaps most importantly...
brew "zsh" unless OS.linux?

# Better bash as a backup
brew "bash" unless OS.linux?

# GNU utilities (those that come with macOS are outdated)
brew "coreutils"
brew "findutils"
brew "gnu-indent"
brew "gnu-sed"
brew "gnu-tar"
brew "gnu-which"
brew "gnupg"
brew "gnutls"
brew "grep"
brew "make"
brew "moreutils"

# More recent versions of some macOS tools
brew "curl", link: true
brew "gcc"
brew "gmp"
brew "nano"
brew "openssh"
brew "screen"
brew "unzip", link: true
brew "vim"  #, args: ["with-override-system-vi"]

# Other useful binaries
brew "ack"
brew "autoconf"
brew "automake"
brew "ffmpeg"  #, args: ["with-libvpx"]
brew "imagemagick"  #, args: ["with-webp"]
brew "jemalloc"
brew "less"
brew "libsass", args: ["HEAD"]
brew "libyaml"
brew "mtr"
brew "openssl@1.1" if OS.mac?
brew "p7zip"
brew "pkg-config"
brew "readline"
brew "sidneys/homebrew/unrar" if OS.mac?
brew "ssh-copy-id", link: true
brew "tmux"
brew "tree"
brew "wget"  #, args: ["with-iri"]

# Git
brew "git"
brew "git-lfs"
brew "gh"

###############################
#  Fonts                      #
###############################

# Monospace
cask "homebrew/cask-fonts/font-cascadia-code"
cask "homebrew/cask-fonts/font-hack"
cask "homebrew/cask-fonts/font-ibm-plex-mono"
cask "homebrew/cask-fonts/font-roboto-mono"
cask "homebrew/cask-fonts/font-sf-mono"
cask "homebrew/cask-fonts/font-sf-mono-for-powerline"
cask "homebrew/cask-fonts/font-source-code-pro"

# Sans/Serif
cask "homebrew/cask-fonts/font-comic-neue"
cask "homebrew/cask-fonts/font-inter"
cask "homebrew/cask-fonts/font-open-sans"
cask "homebrew/cask-fonts/font-roboto"
cask "homebrew/cask-fonts/font-sf-compact"
cask "homebrew/cask-fonts/font-sf-pro"
