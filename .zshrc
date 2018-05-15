# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

function sshaws(){
  ssh -i ~/pem-keys/$1.pem ubuntu@$2 
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs host)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias editzshrc="vim ~/.zshrc"
alias srczshrc="source ~/.zshrc"
. ~/.oh-my-zsh/plugins/z/z.sh


export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug load

GOPATH=/Users/danielhilton/Code/go
