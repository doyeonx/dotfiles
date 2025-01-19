#!/usr/bin/env bash
# xcode
xcode-select --install

# rosetta
softwareupdate --install-rosetta

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew packages
brew install git stow tree starship gh neovim btop bat tmux ripgrep pip3

# brew applications
brew install --cask ghostty wireshark raycast docker nikitabobko/tap/aerospace

# bring git dotfiles
git clone https://github.com/doyeonx/dotfiles.git

# sync dotfiles
stow .
