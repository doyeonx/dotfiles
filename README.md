# Dotfiles 

### run setup.sh

```bash
# xcode
xcode-select --install

# rosetta
softwareupdate --install-rosetta

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew packages
brew install git stow tree starship gh neovim btop bat tmux ripgrep lazygit fzf fish eza python3 

# brew applications
brew install --cask ghostty wireshark raycast docker ollama nikitabobko/tap/aerospace

# setup github ssh
mkdir ~/.ssh && cd ~/.ssh
ssh-keygen -t ed25519 -C doyeon0520@gmail.com # don't set key & name the file github_key
eval "$(ssh-agent -s)"
touch config
cat > config << EOL
  Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/github_key
EOL
ssh-add --apple-use-keychain ~/.ssh/github_key # add the ssh key to github before running this command

# sync dotfiles
cd ~/dotfiles
stow .

# set default shell to fish
curl -L https://get.oh-my.fish | fish
sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)
```
