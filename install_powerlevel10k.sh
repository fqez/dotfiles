#!/bin/bash

# 0. Install ZSH

sudo apt update
sudo apt install -y zsh

# 1. Install oh my zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. Install powerlevel10k theme and fonts

mkdir -p ~/.local/share/fonts
cp fonts/*.ttf ~/.local/share/fonts
fc-cache -f -v

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

# 3. Install colorls

sudo apt install -y ruby ruby-dev ruby-colorize
sudo gem install colorls

echo 'Now you can run "p10k configure" command' 
echo '\n'
echo 'created alias for color ls: "lc"'

echo "alias lc='colorls'" >> ~/.bashrc

