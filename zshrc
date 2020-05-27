# if you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
alias gst="git status"
alias gpr="git pull -r"
alias bdu="bin/dev/update"
alias hg="history | grep"
alias da='direnv allow'
alias c='iex -S mix'
alias canada='git commit --amend --no-edit --reset-author'
alias ev='nvim ~/.config/nvim/init.vim'
alias ez='nvim ~/.zshrc'
alias sv='source ~/.config/nvim/init.vim'
alias sz='source ~/.zshrc'
alias vim='nvim'
alias vi='nvim'
alias nv='nvim'
alias v='nvim'
alias nf='nvim $(fzf)'
alias s='iex -S mix phx.server'
alias t='bin/dev/test'
alias g="git"
alias solo='git solo ht'
alias doc='bin/dev/doctor'
alias shipit='bin/dev/shipit'

# path to your oh-my-zsh installation.
export ZSH=/Users/hdtafur/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(
  git
  history-substring-search
  git-duet
)
source $ZSH/oh-my-zsh.sh

# fix for history-substring-search bug (https://github.com/robbyrussell/oh-my-zsh/issues/1433)
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

export HOMEBREW_NO_ANALYTICS=1
export ECTO_EDITOR=/usr/local/bin/subl

# redefine prompt_context for hiding user@hostname
prompt_context () { }

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --inline-info'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

eval "$(direnv hook zsh)"

# asdf
. /Users/hdtafur/.asdf/asdf.sh
fpath=(/Users/hdtafur/.asdf/completions /Users/hdtafur/.oh-my-zsh/plugins/history-substring-search /Users/hdtafur/.oh-my-zsh/plugins/git /Users/hdtafur/.oh-my-zsh/functions /Users/hdtafur/.oh-my-zsh/completions /Users/hdtafur/.oh-my-zsh/plugins/history-substring-search /Users/hdtafur/.oh-my-zsh/plugins/git /Users/hdtafur/.oh-my-zsh/functions /Users/hdtafur/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/local/Cellar/zsh/5.6.2_1/share/zsh/functions)
autoload -Uz compinit && compinit
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 2097152 -kernel shell_history_path '\"./.iex-history\"'"

eval $(thefuck --alias oops)
