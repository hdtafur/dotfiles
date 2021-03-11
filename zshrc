alias gst="git status"
alias gpr="git pull -r"
alias hg="history | grep"
alias da='direnv allow'
alias canada='git duet-commit --amend --no-edit --reset-author'
alias ev='nvim ~/.config/nvim/init.vim'
alias ez='nvim ~/.zshrc'
alias sv='source ~/.config/nvim/init.vim'
alias sz='source ~/.zshrc'
alias vim='nvim'
alias vi='nvim'
alias nv='nvim'
alias v='nvim'
alias nf='nvim $(fzf)'
alias g="git"

# path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(
  git
  history-substring-search
)
source $ZSH/oh-my-zsh.sh

# fix for history-substring-search bug (https://github.com/robbyrussell/oh-my-zsh/issues/1433)
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

export HOMEBREW_NO_ANALYTICS=1
export ECTO_EDITOR=/usr/local/bin/idea

# redefine prompt_context for hiding user@hostname
prompt_context () { }

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --inline-info'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

eval "$(direnv hook zsh)"

autoload -Uz compinit && compinit
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 2097152 -kernel shell_history_path '\"./.iex-history\"'"

eval $(thefuck --alias oops)

# asdf
. $(brew --prefix asdf)/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

export PATH="/Applications/Postgres.app/Contents/Versions/11/bin:/usr/local/sbin:$PATH"
