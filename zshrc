# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="jonathan"
#ZSH_THEME="aussiegeek"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh_reload gulp sudo colored-man)

source $ZSH/oh-my-zsh.sh
source $HOME/.gvm/scripts/gvm
# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/bin
#命令别名
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias ee='emacsclient -t'
alias dstat='dstat -cdlmnpsy'
alias rscp='rsync -v -P -e ssh'
alias b='byobu'
alias t='tmux'
alias p='ping 192.168.1.1'
alias e='exit'

# Vi风格键绑定
bindkey -v
#设置DEL键为向后删除
bindkey "\e[3~" delete-char
#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

. ~/.nvm/nvm.sh

echo 'run byobu(b) tmux(t)'
echo 'p=ping 192.168.1.1'
echo 'e=exit'

export JAVA_HOME=/usr/lib/jvm/java-8-oracle

#export MIGRATIONS_HOME=/home/ender/work/mybatis-migrations-3.1.0
#export MIGRATIONS=$MIGRATIONS_HOME/bin
export ANDROID_HOME=/home/ender/utils/android_sdk
export ANDROID_SDK_HOME=/home/ender/utils/android_sdk
export PHANTOMJS_BIN=/home/ender/.nvm/v0.10.26/bin/phantomjs
export GRADLE_HOME=/home/ender/utils/gradle-1.11
export PATH=$GRADLE_HOME/bin:$MIGRATIONS:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/dist


# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[[ -f /home/ender/.nvm/versions/node/v5.7.0/lib/node_modules/.yo_npminstall/tabtab/1.3.2/tabtab/.completions/yo.zsh ]] && . /home/ender/.nvm/versions/node/v5.7.0/lib/node_modules/.yo_npminstall/tabtab/1.3.2/tabtab/.completions/yo.zsh
