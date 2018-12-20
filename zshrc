# Tmux likes 256+ colours
export TERM="xterm-256color"
# Systemwide stuff
export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Gems
export PATH="$HOME/.rbenv/shims:$PATH"
# Node.js
export PATH="/usr/local/share/npm/bin:$PATH"
# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# QT
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

export NODE_PATH="/usr/local/lib/node:$NODE_PATH"

export SLINK_DEBUG=true

source ~/.secrets

# Pass through colour escapes
export LESS=-R

#Shortcuts
alias ls='ls -G'
alias gco='git checkout'
alias gci='git ci'
alias grb='git rb'
alias pull='git pull'
alias s.='subl .'
alias start_mysql='mysql.server start'
alias be="bundle exec"
alias migr='bin/rake db:migrate db:test:prepare'
alias gst='git status'
alias gadd='git add .'
alias gcv='git commit -v'
alias cuke='bin/cucumber'
alias r="bin/rails"
alias gyoe='git push heroku master'
alias rtest='ruby -I"lib:test"'
alias s='say -v Fiona'

# Let's use Sublime yeah?
export EDITOR="subl -w"
export BUNDLE_EDITOR="subl"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Neccesary to get the fontawesome glyphs:
POWERLEVEL9K_MODE='awesome-fontconfig'
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

alias lc='colorls'

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time command_execution_time)
