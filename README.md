# Introduction
This configuration is aimed at C++ development in Neovim on MacOS. That being said, the purpose of this repository is to help you get started. You are encouraged to change it to your liking, and I designed it with that in mind.

![Startup](https://github.com/Roiqk7/dotfiles/blob/main/assets/nvimStartup.png?raw=true)

# Prerequisites
* [iTerm2](https://iterm2.com)
* [z-shell](http://zsh.sourceforge.net)
* [oh My ZSH!](https://ohmyz.sh)
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [NerdFonts](https://github.com/ryanoasis/nerd-fonts#--)

Follow [this](https://gist.github.com/GLMeece/4b51037daa0d6b83256f80b560246f38) quick tutorial to get you everything you need to get full experience.
Also, if you want a powerful zsh setup read [this](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0) and then check my `.zshrc` file.

# Tmux 
## Steps:
1. Install tmux
2. Place the `.tmux.conf` file in your root directory (`~/`)
3. Open a terminal and run `tmux source ~/.tmux.conf` to reload the configuration file.

## Instalation
Install tmux [here](https://github.com/tmux/tmux/wiki/Installing).

## Commands
You write these commands in the console, and before your command, you type `tmux`.

| Commands | Description |
|---|---|
| `new -s <name>` | Create new session with name |
| `attach -t <name>` | Come back to session |
| `ls` | List of sessions |
| `dettach` | Leave session |
| `kill-session` | Delete current session |
| `kill-server` | Delete all sessions |

## Key binding
`<prefix>` represents `<control>a` (must be pressed at the same time).

| Shortcut | Description |
|---|---|
| `<prefix>I` | Reload tmux |
| `<control>h/j/k/l` | Move across panes |
| `<prefix>h/j/k/l` | Resize panes |
| `<prefix>?` | Help with commands |
| `<prefix>\|` | Horizontal split |
| `<prefix>-` | Vertical split |
| `<prefix>m` | Maximize/Minimize pane |
 
# Neovim
## Steps:
1. Install neovim
2. Put the `nvim` folder into your `.config` directory.

## Installation
See [this](https://github.com/jdhao/nvim-config/blob/master/docs/README.md) for information on how to install and setup nvim on your platform. 

## Key binding
`<leader>` represents space key.

| Shortcut | Mode | Description |
|---|---|---|
| `jk` | Insert | Enter normal mode |
| `<leader>su` | Normal | Return to Startup screen |
| `<leader>ff` | Normal | Find file in current directory |
| `<leader>fs` | Normal | Find string in current directory|
| `<leader>rb` | Normal | Recent buffers in current session |
| `<leader>of` | Normal | Old files |
| `<leader>ps` | Normal | Run :PackerSync command |
| `<leader>tsu` | Normal | Run :TSUpdate command |
| `<leader>slt` | Normal | See load times of plugins |

# More images

# Toubleshooting

## Too many files open
If you get this error message after running `:PackerSync` then go into a terminal and enter this piece of code `ulimit -n 10240`. Note that this is not a permanent solution. It will increase the maximum number of files just for the current session.
