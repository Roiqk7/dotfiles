# Introduction
This configuration is aimed at C++ development in Neovim on MacOS. That being said, the purpose of this repository is to help you get started. You are encouraged to change it to your liking, and I designed it with that in mind.

![Startup](https://github.com/Roiqk7/dotfiles/blob/main/assets/nvimStartup.png?raw=true)

# Prerequisites
* [iTerm2](https://iterm2.com)
* [z-shell](http://zsh.sourceforge.net)
* [oh My ZSH!](https://ohmyz.sh)
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [NerdFonts](https://github.com/ryanoasis/nerd-fonts#--)

Follow [this quick tutorial](https://gist.github.com/GLMeece/4b51037daa0d6b83256f80b560246f38) to get everything you need for full experience.
Also, if you want a powerful zsh setup read [this article](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0) and then check my `.zshrc` file and `aliases.zsh` file which is inside `.config` directory.

# Tmux 
## Steps:
1. Install tmux
2. Place the `.tmux.conf` file in your root directory (`~/`)
3. Open a terminal and run `tmux source ~/.tmux.conf` to reload the configuration file.

## Instalation
Follow tmux [instalation guide](https://github.com/tmux/tmux/wiki/Installing) to install it properly.

## Configuration
* If you want your temperature in fahrenheit then in `.tmux.conf` file change `set -g @dracula-show-fahrenheit` to `false`.
* To further customize your tmux read the [official theme plugin documentation](https://draculatheme.com/tmux) for more information.

## Commands
You write these commands in the console. Note: for these to work you need to setup `aliases.zsh` which I provide to you i `.config` and you need to add `source ~/.config/aliases.zsh` to your `zshrc`.

| Commands | Description |
|---|---|
| `tns <name>` | Create new session with name |
| `ta <name>` | Come back to session |
| `tl` | List of sessions |
| `td` | Leave session |
| `ts` | Delete current session |
| `tko` | Delete all other sessions |
| `tka` | Delete all sessions |

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

## Plugins
Here is a complete list of all plugins. Special thanks to all of the authors and maintainers. The order is same as in the `plugins.lua` file.
<details>
  <summary>Plugins list</summary>
  | Name | Description |
  |---|---|
  | **Theme** | **Theme** |
  | [Packer](https://github.com/wbthomason/packer.nvim) | Plugin/Package manager |
  | [Plenary](https://github.com/nvim-lua/plenary.nvim) | Used by plugins |
  | [Onedark](https://github.com/navarasu/onedark.nvim) | Awesome theme |
  | [Vim Nightfly Guicolors](https://github.com/bluz71/vim-nightfly-colors) | Theme |
  | [Tender](https://github.com/jacoborus/tender.vim) | Theme |
  | [Melange](https://github.com/savq/melange-nvim) | Theme inspired by monokai |
  | [Catppuccin](https://github.com/savq/melange-nvim) | Theme |
  | [Startup](https://github.com/startup-nvim/startup.nvim) | Customizable startup screeen |
  | **Essential** | **Essential** |
  | [Surround](https://github.com/tpope/vim-surround) | Master parentheses, brackets, quotes, XML tags, and more |
  | [Replace With Register](https://github.com/inkarkat/vim-ReplaceWithRegister) | Better replace mechanics |
  | [Comment](https://github.com/numToStr/Comment.nvim) | Better comments |
  | [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator) | Navigate seamlessly between vim and tmux |
  | [Vim Maximizer](https://github.com/szw/vim-maximizer) | Maximize vim windows |
  | [Nvim Tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
  | [Vim Dev Icons](https://github.com/ryanoasis/vim-devicons) | Adds icons for plugins |
  | [Lua line](https://github.com/nvim-lualine/lualine.nvim) | Adds neovim status line |
  | [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Finder |
  | [Grammarous](https://github.com/rhysd/vim-grammarous) | Grammar checker |
  | [Open Browser](https://github.com/tyru/open-browser.vim) | Lets you open url |
  | [Symbols Outline](https://github.com/simrat39/symbols-outline.nvim) | Tree like view for symbols |
  | [Todo Comments](https://github.com/folke/todo-comments.nvim) | Add todo comments |
  | [Sad](https://github.com/ray-x/sad.nvim) | Find and replace |
  | [Navigator](https://github.com/numToStr/Navigator.nvim) | Navigate easily between neovim and multiplexer |
  | [Neoclip](https://github.com/matveyt/neoclip) | Clipboard manager |
  | [Impatient](https://github.com/lewis6991/impatient.nvim) | Speed up startup time |
  | [Neorg](https://github.com/nvim-neorg/neorg) | Organizer |
  | **Languages** | **Languages** |
  
</details>

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

## Recommended read
Here are some resources you can use to master this configuration. Note that all the plugins mentioned are already installed and setup.

| Name | Description |
|---|---|
| [surround.vim](https://github.com/tpope/vim-surround) | Master the art of parentheses, brackets, quotes, XML tags, and more |

# More images

# Toubleshooting

## Too many files open
If you get this error message after running `:PackerSync` then go into a terminal and enter this piece of code `ulimit -n 10240`. Note that this is not a permanent solution. It will increase the maximum number of files just for the current session.
