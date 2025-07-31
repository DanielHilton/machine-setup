#!/bin/bash

brew install zsh-syntax-highlighting

echo Enabling syntax highlighting in vim
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim --output sublimemonokai.vim
mv sublimemonokai.vim ~/.vim/colors

cat > ~/.vimrc << EOL
syntax on
colorscheme sublimemonokai
EOL

echo Installing nerd fonts...
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font-mono