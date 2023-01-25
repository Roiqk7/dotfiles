# general
alias r="source ~/.zshrc"
alias c="clear"
alias x="exit"

# filesystem aliases
alias .="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# brew aliases
alias bu="brew upgrade"
alias bi="brew install"
alias bls="brew list"

# git aliases
alias gc="git clone --recursive"

# tmux aliases
alias ta="tmux attach"
alias tl="tmux ls"
alias ta="tmux attach -t"
alias td="tmux detach"
alias tns="tmux new-session -s"
alias tks="tmux kill-session"
alias tko="tmux kill-session -a"
alias tka="tmux kill-server"
