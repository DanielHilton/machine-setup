#!/bin/bash

if [ -z $1 ] || [ -z $2 ] ; then
  echo "Usage ./setup-machine.sh <name> <email>"
  exit 1
fi

read -p Ready?

echo Getting sudo over and done with
sudo echo

NAME=$1
EMAIL=$2

echo Changing git config
rm ~/.gitconfig
cat > ~/.gitconfig << EOL
[user]
name = ${NAME}
email = ${EMAIL}
EOL

echo Installing Homebrew...
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Generating SSH Key
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -N ''
pbcopy < ~/.ssh/id_rsa.pub

echo "Your SSH key is now in your clipboard! Go to https://github.com to add it"
read -p "Press enter to continue"

echo Installing zsh
brew install zsh
brew install zsh-syntax-highlighting

echo Installing powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo Enabling syntax highlighting in vim
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim --output sublimemonokai.vim
mv sublimemonokai.vim ~/.vim/colors

cat > ~/.vimrc << EOL
syntax on
colorscheme sublimemonokai
EOL

echo Making code folder in home dir
mkdir ~/Code

if [ -f repos.txt ]; then
	echo Cloning repos in file
	REPODIR=`pwd`

	pushd ~/Code
	while IFS= read -r repo
	do
		git clone $repo
	done < $REPODIR/repos.txt

	popd
else
	echo No repos.txt file, skipping repo creation.
	sleep 1
fi

echo Installing hyper...
brew update
brew cask install hyper

echo Using repo hyper config
mv ~/.hyper.js ~/.hyper.js.original # Keep the old one
ln -s ${PWD}/.hyper.js ~/.hyper.js

echo Installing Alfred
brew cask install alfred

echo Installing nerd fonts...
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font-mono

echo Installing AppCleaner
brew cask install appcleaner

echo Installing Tunneblick OpenVPN Client...
brew install openvpn
brew cask install tunnelblick

echo Installing The Unarchiver
brew cask install the-unarchiver

echo installing node.js
brew install node@8
npm i -g npm
npm i -g nvm

echo Installing GoLang
mkdir -p ~/Code/go/bin
brew install go

echo Installing Chrome...
brew cask install google-chrome

echo installing sublime text 3
brew cask install sublime-text

echo Installing Rider
brew cask install rider

echo Installing Python
brew install python

echo Installing PyCharm
brew cask install pycharm

echo Installing Mono
brew install mono

echo Installing WebStorm
brew cask install webstorm

echo Installing Microsoft Office
brew cask install microsoft-office

echo installing GoLand
brew cask install goland

echo Installing .NET Core SDK
brew cask install dotnet-sdk

echo Installing GitKraken
brew cask install gitkraken

echo Installing GPG Suite
brew cask install gpg-suite

echo Installing Slack
brew cask install slack

echo Installing Docker + Kitematic
brew cask install docker
brew cask install kitematic

echo Installing Postman
brew cask install postman

echo Installing Spotify
brew cask install spotify

echo Installing VMWare Fusion
brew cask install vmware-fusion

echo Installing VNC Viewer
brew cask install vnc-viewer

echo Installing Robo 3T
brew cask install robo-3t

echo Installing Adobe Creative Cloud
brew cask install adobe-creative-cloud

echo Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" > /dev/stderr
  exit 1
}

echo Copying over custom zshrc
mv ~/.zshrc ~/.zshrc_original # Keep original
ln -s ${PWD}/.zshrc ~/.zshrc

echo Done!
