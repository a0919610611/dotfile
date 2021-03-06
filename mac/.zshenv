# fix emacs tramp mode
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return
# Path to your oh-my-zsh installation.
export HOST="Leo-MacBook"
export ZSH=/Users/fuyu0425/.oh-my-zsh
export EDITOR=nvim
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fuyu0425"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

path=($path /usr/local/sbin $HOME/gocode/bin /usr/local/bin:$HOME/.composer/vendor/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin)
path=(`yarn global bin` $path)
path+=("/Users/fuyu0425/Applications/Wine Stable.app/Contents/Resources/start/bin" "/Users/fuyu0425/Applications/Wine Stable.app/Contents/Resources/wine/bin")
path+=($HOME/cf_submit)
path+=(/Applications/Ac6/SystemWorkbench.app/Contents/Eclipse/plugins/fr.ac6.mcu.externaltools.arm-none.macos64_1.16.0.201807130628/tools/compiler/bin)
path+=($HOME/.cabal/bin)
path+=(/opt/minicom/2.2/bin)
path+=(/usr/local/smlnj/bin)
path=(/opt/local/bin /opt/local/sbin $path)
unsetopt inc_append_history
source $HOME/zsh-common.zsh

plugins+=(brew osx tig)


# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"


source $ZSH/oh-my-zsh.sh
unsetopt inc_append_history


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

###my own setting###
###################
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM='xterm-256color'
#export TERM='xterm'
# export TERM='screen-256color'
# export TERM='xterm-24bits'
#GOPATH
export GOPATH=~/gocode

alias ls='ls -vG'
alias ll='ls -al'
alias la='ls -a'
alias vi='nvim'
alias vim='nvim'
alias g++='g++-8  -D fuyu0425'
alias gcc='gcc-8  -D fuyu0425'
alias gcov='gcov-8'
#alias ptt='ssh bbsu@ptt.cc'
alias xcode="open -a Xcode"
alias gcz='git cz'
alias rm='rmtrash'
alias sshx='ssh -X'
alias cat='ccat'
alias ping='prettyping'

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow" #support 256


# for makefile
export CC='gcc-8'
export CXX='g++-8'
export CCOV='gcov-8'


homestead(){
    sh -c 'cd ~/Homestead && vagrant "$*"'

}
proxy(){
    export https_proxy=$1
    export http_proxy=$1
    echo "proxy is set to $1"
}
unproxy(){
    unset https_proxy
    unset http_proxy
    echo "proxy is unset"
}


###others

# OCaml
eval `opam config env`
disable r
LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --force --style zenburn"
alias oless='env less'
alias less="LESSOPEN=\"${LESSOPEN}\" less -m -N -g -i -J  --line-numbers --underline-special"
alias more='less'
alias ls='exa'
export HOMEBREW_MAKE_JOBS=4
export HOMEBREW_NO_AUTO_UPDATE=1
export PYTHONWARNINGS="ignore"
eval "$(direnv hook zsh)"

path+=("/Users/fuyu0425/.local/bin" "/Users/fuyu0425/.stack/programs/x86_64-osx/ghc-8.6.5/bin")
path+=("~/.cabal/bin")
