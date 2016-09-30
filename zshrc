# Path to your oh-my-zsh installation.
  export ZSH=/home/ender/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="jonathan"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git golang bower coffee gulp mvn npm nvm rvm)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $HOME/.gvm/scripts/gvm
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
export PHANTOMJS_BIN=/home/ender/.nvm/versions/node/v6.2.0/bin/phantomjs
export GRADLE_HOME=/home/ender/utils/gradle-1.11
export PATH=$GRADLE_HOME/bin:$MIGRATIONS:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/dist

# 颜色
# export TERM="screen-256color"
export TERM=xterm-256color
alias tmux="tmux -2"
