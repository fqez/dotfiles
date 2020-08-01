#!/bin/bash

# 0. Install ZSH

sudo apt update
sudo apt install -y zsh curl

# 1. Install oh my zsh

echo '###########################################################'
echo '\n'
echo 'Say YES to change default shell to zsh AND THEN HIT CTRL + D'
echo '\n'
echo '###########################################################'


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

cp .p10k.zsh ~
cp .zshrc ~

echo 'Now you can run "p10k configure" command or use the already custom theme' 
echo '\n'
echo 'created alias for color ls: "lc"'

# 4. Install Pygments
pip install Pygments

echo "alias lc='colorls'" >> ~/.zshrc
echo "alias ccat=pygmentize -g $1" >> ~/.zshrc
echo "alias lccat='pygmentize -g -O style=colorful,linenos=1'" >> ~/.zshrc

