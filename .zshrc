export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

function sshaws(){
  ssh -i ~/pem-keys/$1.pem ubuntu@$2 
}

DEFAULT_COLOR="125"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_DIR_HOME_BACKGROUND="125"
POWERLEVEL9K_DIR_HOME_FOREGROUND="249"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="125"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="125"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_NVM_BACKGROUND="black"
POWERLEVEL9K_NVM_FOREGROUND="249"
POWERLEVEL9K_NVM_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOST_BACKGROUND="125"
POWERLEVEL9K_HOST_FOREGROUND="249"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs host)

ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git,
  z
)

source ~/.secretstuff

source $ZSH/oh-my-zsh.sh

alias resetgoland="rm ~/Library/Preferences/GoLand2018.1/eval/*.key"
alias fucking=sudo
alias editzshrc="vim ~/.zshrc"
alias srczshrc="source ~/.zshrc"
alias code="cd ~/Code"
alias dps="docker ps"
alias startgirls="docker start fear azusa miku suiseiseki"
. ~/.oh-my-zsh/plugins/z/z.sh
alias editphotoshoplicense="sudo vim /Library/Application\ Support/Adobe/Adobe\ Photoshop\ CC\ 2018/AMT/application.xml"

export GOPATH=/Users/danielhilton/Code/go
export GOBIN=$GOPATH/bin

export NVM_DIR=/Users/danielhilton/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$GOBIN:/Users/danielhilton/cloudkat:/Users/danielhilton/sonar-scanner/bin

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export QUOTINGLOCUST_RUN_LOCALLY=true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
