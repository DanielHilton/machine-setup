#!/bin/bash

if [[ -z $1 ]] || [[ -z $2 ]] ; then
  echo "Usage ./setup-machine.sh <name> <email>"
  exit 1
fi

read -p Ready?

echo Getting sudo over and done with
sudo echo

NAME=$1
EMAIL=$2
REPODIR=`pwd`

echo Changing git config
rm ~/.gitconfig
cat > ~/.gitconfig << EOL
[user]
name = ${NAME}
email = ${EMAIL}
EOL

echo Installing Homebrew...
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo Generating SSH Key
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -N ''
pbcopy < ~/.ssh/id_rsa.pub

echo "Your SSH key is now in your clipboard! Go to https://github.com to add it"
read -p "Press enter to continue"

echo Installing zsh
brew install zsh
brew install zsh-syntax-highlighting

echo Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" > /dev/stderr
  exit 1
}

echo Enabling syntax highlighting in vim
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/erichdongubler/vim-sublime-monokai/master/colors/sublimemonokai.vim --output sublimemonokai.vim
mv sublimemonokai.vim ~/.vim/colors

cat > ~/.vimrc << EOL
syntax on
colorscheme sublimemonokai
EOL

brew install hub
eval "$(hub alias -s)"

echo Making folder in home dir
mkdir ~/Code

if [ -f repos.txt ]; then
	echo Cloning repos in file

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

brew update
brew tap homebrew/cask-fonts

while IFS= read -r cask
do
  echo Installing $cask
  brew install --cask $cask
done < $REPODIR/casks.txt

echo Using repo hyper config
mv ~/.hyper.js ~/.hyper.js.original # Keep the old one
# ln -s ${PWD}/.hyper.js ~/.hyper.js
cp .hyper.js ~

echo installing node.js
brew install node@20
npm i -g npm
npm i -g nvm

echo Installing GoLang
mkdir -p ~/Code/go/bin
brew install go

while IFS= read -r package
do
  echo Installing brew formula $package
  brew install $package
done < $REPODIR/formulae.txt

echo Copying over custom zshrc
mv ~/.zshrc ~/.zshrc_original # Keep original
# ln -s ${PWD}/.zshrc ~/.zshrc
cp .zshrc ~

echo Done!
