# Path to your oh-my-zsh installation.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH=/Users/peter/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="amuse"
# ZSH_THEME="ys"
# ZSH_THEME="agnoster"
# ZSH_THEME="dieter"
# ZSH_THEME="juanghurtado"
# ZSH_THEME="pure"
ZSH_THEME="my-af-magic"
# ZSH_THEME="random"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git autojump brew history python web-search django tmux virtualenvwrapper chucknorris osx go)
plugins=(git vi-mode history history-substring-search fasd python pip redis-cli mosh virtualenvwrapper tmux autojump brew osx go)

#保存历史
export HISTFILE="$HOME/.history"
# history config
HISTSIZE=100000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#Disable autocorrect
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"
#忽略重复
setopt hist_ignore_all_dups

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
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
# alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias subl='open -a "Sublime Text"'

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

fpath=(/usr/local/share/zsh-completions $fpath)

# virtualenvwrapper
if [ `id -u` != '0' ]; then
  export VIRTUALENV_USE_DISTRIBUTE=1        # <-- Always use pip/distribute
  export WORKON_HOME=$HOME/.virtualenvs       # <-- Where all virtualenvs will be stored
  source /usr/local/bin/virtualenvwrapper.sh
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_RESPECT_VIRTUALENV=true
fi

export PATH=$PATH:/usr/local/opt/go/libexec/bin

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

export FZF_COMPLETION_TRIGGER='qwe'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vi='vim'
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall

# alias cat='pygmentize -O style=monokai -f console256 -g'


# vi mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^[[Z' reverse-menu-complete
export KEYTIMEOUT=1
# antigen
source ~/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
export HOMEBREW_NO_ANALYTICS=1
export EVENT_NOKQUEUE=1

# hadoop spark
alias hstart="/usr/local/Cellar/hadoop/2.7.3/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.7.3/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.7.3/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.7.3/sbin/stop-dfs.sh"
export PATH=$PATH:/Users/Peter/Projects/spark/spark-2.0.0-bin-hadoop2.7/bin
export PYSPARK_PYTHON=/usr/local/bin/python
export PYSPARK_DRIVER_PYTHON=ipython

alias cancer_mysql="mycli -h 10.215.242.101 -u cancer -p26XxYGW5bsyp -P 3309 -D cancer"
alias tacitus_mysql="mycli -h 10.215.242.101 -u tacitus -p2Aq3J5MA1OcV -P 3309 -D tacitus"

# Duotai proxy
alias pon='export http_proxy=http://duotai:yReQA-GRYu@conrad.h.xduotai.com:17018;export https_proxy=$http_proxy'
alias poff='unset http_proxy;unset https_proxy'

export NVM_DIR="/Users/Peter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# brew
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/Users/Peter/go/bin
export PATH="/usr/local/opt/opencv3/bin:$PATH"
