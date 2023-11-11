# general
 alias c="clear"
 alias x="exit"
 alias v="vim"
 alias n="nvim"
 alias r="source ~/.zshrc"
 alias u="bubu && maintain"
 alias py="python3"
 alias exe="function _exe() { g++ -std=c++17 -o "$1" "$1.cpp" && ./"$1"; }; _exe"

 # softwareupdate
 alias su="softwareupdate"
 alias sua="su --install --all"

 # maintenance
 alias u_colorls="gem update colorls"
 alias u_omz="omz update"
 alias maintain="sua && u_colorls && u_omz && nonu"

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
 alias aliases="vim ~/.config/aliases.zsh"
 alias home="cd ~/"
 alias desk="cd ~/Desktop"
 alias downloads="cd ~/Downloads"
 alias neovim="vim ~/.config/nvim/init.lua"
 alias work="cd ~/Desktop/Programming/C:C++/C++/Era2/NumeroDuo"
 alias .zshrc="nvim ~/.zshrc"
 alias .tmux.conf="vim ~/.tmux.conf"
 alias .p10k="nvim ~/.p10k.zsh"
 alias .config="cd ~/.config"

 # functional
 alias copyLastCmd="fc -ln -1 | pbcopy"
 alias pi="pip3 install"
 alias search="grep"
 alias searchall="grep -rl"

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
