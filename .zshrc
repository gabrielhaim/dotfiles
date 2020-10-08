# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gabrielhaim"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Export for virtualenvwrapper.sh to load properly
# export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python"

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

#plugins=(brew coffee cp fabric gem git go grep node npm pip postgres python redis-cli ruby tmux uber-projects vagrant virtualenv virtualenvwrapper z)
# plugins=(brew git pip virtualenv virtualenvwrapper z)
plugins=(brew git pip virtualenv virtualenvwrapper z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias ls="gls --color=auto"
alias md5sum="gmd5sum"
alias py="ipython"
alias tmux="TERM=screen-256color-bce tmux"
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"

# Main environment variables
export EDITOR="/usr/local/bin/vim"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/sbin:$PATH"
export PGTZ=UTC
export PYCURL_SSL_LIBRARY="openssl"
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Eval to get better colors
eval `gdircolors ~/.dir_colors/dircolors.ansi-dark`

# Eval for pyenv shims
eval "$(pyenv init - zsh --no-rehash)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Eval for rbenv
if command -v rbenv > /dev/null; then eval "$(rbenv init - zsh --no-rehash)"; fi

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ripgrep and fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
