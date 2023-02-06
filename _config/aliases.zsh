# general
alias c="clear"
alias x="exit"
alias n="nvim"
alias r="source ~/.zshrc"
alias u="bubu && maintain"

# maintenance
alias u_colorls="gem update colorls"
alias u_omz="omz update"
alias maintain="u_colorls && u_omz && nonu"

# file system
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
alias desk="cd ~/Desktop"
alias .zshrc="nvim ~/.zshrc"
alias aliases="nvim ~/.config/aliases.zsh"
alias neovim="nvim ~/.config/nvim/init.lua"
alias .tmux.conf="nvim ~/.tmux.conf"
alias .p10k="nvim ~/.p10k.zsh"
alias .config="cd ~/.config"
alias work="cd ~/Desktop/Programming/C:C++/"

# brew
alias bu="brew upgrade"
alias bi="brew install"
alias bri="brew reinstall"
alias bl="brew list"

# git
alias gc="git clone --recursive"
alias repo="gc https://github.com/Roiqk7/dotfiles.git"

# tmex
alias te="tmex -l"

# tmux
alias t="tmux"
alias td="tmux detach"
alias tkc="tmux kill-session"
alias tko="tmux kill-session -a"
alias tka="tmux kill-server"

# # npm
alias ni="npm install"
alias nonu="npm outdated && npm update"
