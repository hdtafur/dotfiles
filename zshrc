# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias gst="git status"
alias gpr="git pull --rebase"
alias hg="history | grep"
alias hd="cd ~/Development/half_dome"
alias ec="cd ~/Development/el_capitan"
alias s='bin/dev/server'
alias c='iex -S mix'
alias 'canada'='git commit --amend --no-edit --reset-author'
alias 🚢='bin/dev/shipit'
alias ev='nvim ~/.config/nvim/init.vim'
alias ez='nvim ~/.zshrc'
alias sv='source ~/.config/nvim/init.vim'
alias sz='source ~/.zshrc'
alias vim='nvim'
alias vi='nvim'
alias nv='nvim'
alias v='nvim'
alias nf='nvim $(fzf)'

# Path to your oh-my-zsh installation.
export ZSH=/Users/hdtafur/.oh-my-zsh

ZSH_THEME="agnoster"

alias g="git"
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

# Fix for history-substring-search bug (https://github.com/robbyrussell/oh-my-zsh/issues/1433)
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

export HOMEBREW_NO_ANALYTICS=1
export ECTO_EDITOR=/usr/local/bin/subl

# eval "$(direnv hook zsh)"eval \"\$(direnv hook zsh)\"

. ${HOME}/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# Redefine prompt_context for hiding user@hostname
prompt_context () { }

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --inline-info'

eval "$(direnv hook zsh)"

