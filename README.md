# Introduction
This cofiguration is aimed for C++ development in Neovim on MacOS. That being said the purpose of this repository is to help you get started. You are to change it to your liking and I designed it with that in mind.

# TODO insert image here

# Prerequisites
* [iTerm2](https://iterm2.com)
* [z-shell](http://zsh.sourceforge.net)
* [oh My ZSH!](https://ohmyz.sh)
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [NerdFonts](https://github.com/ryanoasis/nerd-fonts#--)

Follow [this](https://gist.github.com/GLMeece/4b51037daa0d6b83256f80b560246f38) quick tutorial to get you everything you need to get full experience.
Also if you want powerful zsh setup read [this](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0) and then check my `.zshrc` file.

# Tmux 
## Steps:
1. Install tmux
2. Place `.tmux.conf` file in your root directory (`~/`)
3. Open terminal and run `tmux source ~/.tmux.conf` to reload configuration file

## Instalation
Install tmux [here](https://github.com/tmux/tmux/wiki/Installing).

## Key binding
`<prefix>` represents control+a (must be pressed at the same time).

| Shortcut | Description |
|---|---|
| new -s <name> | Create new session with name |
| attach -t <name> | Come back to session |
| kill-session | Delete current session |
| kill-server | Delete all sessions |
| <prefix>+I | Reload tmux |
| control+h/j/k/l | Move across panes |
| <prefix>+h/j/k/l | Resize panes |
| <prefix>+? | Help with commands |
| <prefix>+| | Horizontal split |
| <prefix>+- | Vertical split |
 
# Neovim
## Steps:
1. Install neovim
2. Place `nvim` folder into your `.config` directory.

## Installation
See [this](https://github.com/jdhao/nvim-config/blob/master/docs/README.md) for information on how to install and setup nvim on your platform. 

## Key binding
`<leader>` represents space key.

| Shortcut | Mode | Description |
|---|---|---|
| `jk` | Insert | Enter normal mode

# More images


