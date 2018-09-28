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

echo Installing hyper...
brew update
brew cask install hyper

echo Installing zsh
brew install zsh
brew install zsh-syntax-highlighting

echo Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Echo Copying over custom zshrc
rm ~/.zshrc
ln -s .zshrc ~/.zshrc

echo Installing powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo Making code folder in home dir
mkdir ~/Code
pushd ~/Code

if [ -f repos.txt ]; then
	echo Cloning repos in file
	REPOS=$(cat repos.txt)
	for repo in $REPOS ; do
		git clone $repo
	done
else
	echo No repos.txt file, skipping repo creation.
	sleep 1
fi

popd

echo Installing Alfred
brew cask install alfred

echo Installing nerd fonts...
brew tap caskroom/fonts
brew install font-firacode-nerd-font-mono

echo Installing AppCleaner
brew cask install appcleaner

echo Installing The Unarchiver
brew cask install the-unarchiver

echo installing node.js
brew install node@8
npm i -g npm
npm i -g nvm

echo Installing Chrome...
brew cask install google-chrome

echo installing sublime text 3
brew cask install sublime-text

echo Installing Rider
brew cask install rider

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

echo Installing Slack
brew cask install slack

echo Installing Docker + Kitematic
brew cask install docker
brew cask install kitematic

echo Installing VMWare Fusion
brew cask install vmware-fusion

echo Installing Adobe Creative Cloud
brew cask install adobe-creative-cloud