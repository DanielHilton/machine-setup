export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

autoload -U promptinit; promptinit
# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

function pushconfig(){
  pushd $HOME/Code/machine-setup
  git add .
  git commit
  git push
  popd
}

DEFAULT_COLOR="125"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  thefuck
)

source ~/.secretstuff

source $ZSH/oh-my-zsh.sh

alias gswc="git switch -c"
alias stopallcontainers='docker stop $(docker ps -q)'
alias startallcontainers='docker start $(docker ps -qa)'
alias gitgraph='git log --graph --oneline'
alias resetgoland="rm ~/Library/Application\ Support/JetBrains/GoLand*/eval/*.key"
alias resetpycharm="rm ~/Library/Application\ Support/JetBrains/PyCharm*/eval/*.key"
alias fucking=sudo
alias editzshrc="vim ~/.zshrc"
alias srczshrc="source ~/.zshrc"
alias code="cd ~/Code"
alias dps="docker ps"
. ~/.oh-my-zsh/plugins/z/z.sh
alias git=hub
function convert2ssh() {
  git remote set-url $1 `git remote get-url $1 | sed s#https://#ssh://git@#g`
}

export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$GOBIN:$HOME/sonar-scanner/bin:/var/platform-tools:/Users/$(whoami)/Library/Android/sdk/tools/bin:/usr/local/opt/openssl@1.1/bin

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/sbin:/usr/local/opt/node@8/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home"

eval $(thefuck --alias)
export JAVA_HOME=Library/Java/JavaVirtualMachines/openjdk.jdk
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
