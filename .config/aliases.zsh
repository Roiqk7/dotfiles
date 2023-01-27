# general
alias r="source ~/.zshrc"
alias c="clear"
alias x="exit"
alias reload="r && bubu"

# filesystem aliases
alias ~="cd ~/"
alias .="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# shortcuts
alias .zshrc="nvim ~/.zshrc"
alias aliases="nvim ~/.config/aliases.zsh"
alias neovim="nvim ~/.config/nvim/init.lua"
alias .tmux.conf="nvim ~/.tmux.conf"
alias work=""

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
