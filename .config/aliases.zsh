# general
alias r="source ~/.zshrc"
alias c="clear"
alias x="exit"

# filesystem aliases
alias ~="cd ~/"
alias .="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# brew aliases
alias bu="brew upgrade"
alias bi="brew install"
alias bl="brew list"

# git aliases
alias gc="git clone --recursive"

# tmux aliases
alias td="tmux detach"
alias tkc="tmux kill-session"
alias tko="tmux kill-session -a"
alias tka="tmux kill-server"

# custom
alias reload="echo 'zsh reload' && r && echo 'brew update, outdated, upgrade, cleanup' && bubu"
alias .zshrc="nvim ~/.zshrc"
alias aliases="nvim ~/.config/aliases.zsh"
alias neovim="nvim ~/.config/nvim/init.lua"
alias .tmux.conf="nvim ~/.tmux.conf"

# personal
alias work="echo 'Undefined'"
