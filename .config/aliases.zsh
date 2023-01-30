# general
alias r="source ~/.zshrc"
alias c="clear"
alias x="exit"
alias u="bubu && maintain"

# maintenance
alias u_colorls="gem update colorls"
alias u_omz="omz update"
alias maintain="u_colorls && u_omz"

# file system aliases
alias ~="cd ~/"
alias .="open ."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls="colorls"
alias tree="colorls --tree=3 --sd --dark"
alias utree="colorls --tree=10 --sd --dark"
alias detail="colorls -lA --sd --dark"

# shortcuts
alias .zshrc="nvim ~/.zshrc"
alias aliases="nvim ~/.config/aliases.zsh"
alias neovim="nvim ~/.config/nvim/init.lua"
alias .tmux.conf="nvim ~/.tmux.conf"
alias .p10k="nvim ~/.p10k.zsh"
alias work=""

# brew aliases
alias bu="brew upgrade"
alias bi="brew install"
alias bri="brew reinstall"
alias bl="brew list"

# git aliases
alias gc="git clone --recursive"

# tmux aliases
alias td="tmux detach"
alias tkc="tmux kill-session"
alias tko="tmux kill-session -a"
alias tka="tmux kill-server"
