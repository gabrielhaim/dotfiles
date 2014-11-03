# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Export for virtualenvwrapper.sh to load properly
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python"

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

plugins=(brew coffee cp fabric gem git grep node npm pip postgres python redis-cli ruby tmux vagrant virtualenv virtualenvwrapper z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias ls='gls --color=auto'
alias tmux="TERM=screen-256color-bce tmux -2"

eval `gdircolors ~/.dir_colors/dircolors.ansi-dark`

export CFLAGS="-Qunused-arguments -Wno-parentheses-equality"
export CPPFLAGS="-Qunused-arguments -Wno-parentheses-equality"

export PGTZ=UTC
export EDITOR="/usr/local/bin/vim"
export WORKON_HOME="~/.virtualenvs"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/bin:$PATH"

[ -s "/Users/gabrielhaim/.nvm/nvm.sh" ] && . "/Users/gabrielhaim/.nvm/nvm.sh" # This loads nvm
