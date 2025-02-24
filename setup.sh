#!/usr/bin/env bash
# xcode
xcode-select --install

# rosetta
softwareupdate --install-rosetta

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew packages
brew install git stow tree starship gh neovim btop bat tmux ripgrep lazygit fzf eza python3 

# brew applications
brew install --cask ghostty wireshark raycast docker ollama nikitabobko/tap/aerospace

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# setup github ssh
mkdir ~/.ssh && cd ~/.ssh
ssh-keygen -t ed25519 -C doyeon0520@gmail.com
eval "$(ssh-agent -s)"
touch config
cat > config << EOL
  Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/github_key
EOL
ssh-add --apple-use-keychain ~/.ssh/github_key
git clone git@github.com:doyeonx/dotfiles.git

# sync dotfiles
cd ~/dotfiles
stow .
