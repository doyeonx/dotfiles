#!/usr/bin/env bash
# xcode
xcode-select --install

# rosetta
softwareupdate --install-rosetta

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew packages
brew install git stow tree starship gh neovim btop bat tmux ripgrep lazygit fzf fish eza python3 ollama

# set default shell to fish
curl -L https://get.oh-my.fish | fish
sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)

# brew applications
brew install --cask ghostty wireshark raycast docker ollama nikitabobko/tap/aerospace

# setup github
git clone https://github.com/doyeonx/dotfiles.git

# sync dotfiles
cd ~/dotfiles
stow .
