# Under Construction - Changing every day
**TODO:** 
* C++ (use C++17), Rust, Lua 
* Individual plugin check and setup
* Remove unused plugins
* Remake mapping directory and keymapping 
* Proper install guide

# Introduction
This configuration is aimed at C/C++/Rust/Lua development in Neovim on MacOS. That being said, the purpose of this repository is to help you get started. You are encouraged to change it to your liking, and I designed it with that in mind.

![Startup](https://github.com/Roiqk7/dotfiles/blob/main/assets/nvimStartup.png?raw=true)

## Table of Contents
* [Prerequisites](#Prerequisites)
* [Zsh](#Zsh)
  * [Plugins](#Plugins)
  * [Aliases](#Aliases)
* [Tmux](#Tmux)
  * [Steps](#Steps)
  * [Installation](#Instalation)
  * [Configuration](#Configuration)
  * [Commands](#Commands)
  * [Keybinding](#Key)
* [Neovim](#Neovim)
  * [Steps](#Steps)
  * [Installation](#Instalation)
  * [Plugins](#Plugins)
  * [Keybinding](#Key)
  * [Recommended read](#Recommended)
* [Troubleshooting](#Troubleshooting)

# Prerequisites
* [iTerm2](https://iterm2.com)
* [z-shell](http://zsh.sourceforge.net)
* [oh My ZSH!](https://ohmyz.sh)
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* [NerdFonts](https://github.com/ryanoasis/nerd-fonts#--)
* [Colorls](https://github.com/athityakumar/colorls)

Follow [this quick tutorial](https://gist.github.com/GLMeece/4b51037daa0d6b83256f80b560246f38) to get everything you need for the full experience. 

Alternatively, go through the plugins one by one and follow their installation guide.

# Zsh
If you followed [prerequisites](#Prerequisites) section you should have most of the stuff done already. Now we just take it one step further. For a powerful zsh setup, read [this article](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0) and then check my `.zshrc` file.

## Plugins
You can find plugins I use in the `.zshrc` file. There is ```plugins =( ... )``` with all my plugins.

<details>
  <summary>Plugins list</summary>
  
  | Name | Description |
  |---|---|
  | [Brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) | Adds aliases for common brew commands |
  | [Git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) | Adds aliases for common git commands |
  | [MacOS](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos) | Utilities for macOS system |
  | [Tmux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux) | Aliases for common tmux commands |
  | [Zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | This is a must have |
  | [Zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Does as it says |
  
</details>

## Aliases
The `aliases.zsh` file, located in the `.config` directory, contains my personal configuration. Plugins add a whole lot more, and I definitely recommend checking each plugin out.

Note: Don't forget to add `source ~/.config/aliases.zsh` into your `.zshrc`.

Tip: I recommend setting up alias for quick navigation to your work directory.

### Custom aliases
| Alias | Command | Desription |
|---|---|---|
| **General** | | Practical commands |
| `r` | `source ~/.zshrc` | Reload zsh configuration |
| `c` | `clear` | Clear your terminal |
| `x` | `exit` | Leave current session |
| `u` | `bubu && u_colorls && u_omz` | Runs all necessary update commands |
| **Maintainance** | | Maintain this configuration with ease |
| `u_colorls` | `gem update colorls` | Updates [colorls](https://github.com/athityakumar/colorls) |
| `u_omz` | `omz update` | Updates [oh My ZSH!](https://ohmyz.sh) |
| **Filesystem** | | Move faster across files |
| `~` | `cd ~/` | Move to home directory |
| `.` | `Open .` | Opens current directory |
| `..` | `cd ..` | Move up a directory |
| `...` | `cd ../..` | Move up 2 directories |
| `....` | `cd ../../..` | Move up 3 directories |
| `.....` | `cd ../../../..` | Move up 4 directories |
| `ls` | `colorls` | Beautiful file listing |
| `tree` | `colorls --tree=3 --dark` | File tree |
| `detail` | `colorls -lA --sd --dark` | Detailed info about files |
| **Shortcuts** | | Fast navigation |
| `.zshrc` | `nvim ~/.zshrc` | Opens `.zshrc` in neovim |
| `aliases` | `nvim ~/.config/aliases.zsh` | Opens `aliases.zsh` in neovim |
| `neovim` | `nvim ~/.config/nvim/init.lua` | Opens `init.lua` in neovim |
| `.tmux.conf` | `nvim ~/.tmux.conf` | Opens `.tmux.conf` in neovim |
| `.p10k` | `nvim `~.p10k.zsh` | Opens `.p10k.zsh` in neovim |
| `work` | | Move to your work directory |
| **Brew** | Note: [Brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) plugin adds a lot more | Common brew comands |
| `bu` | `brew upgrade` | Upgrades outdated packages |
| `bi` | `brew install` | Install package |
| `bri` | `brew reinstall` | Reinstall package |
| `bl` | `brew list` | List of brew packages |
| `bubo` | `brew update && brew outdated` | Update brew and list outdated packages |
| `bubc` | `brew upgrade && brew cleanup` | Upgrade outdated packages and run cleanup |
| `bubu` | `bubo && bubc` | Runs both commands above |
| **Git** | Note: [Git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) plugin adds a lot more | Common git commands |
| `gc` | `git clone --recursive` | Clones git repository properly |
 
# Tmux 
## Steps:
1. Install tmux
2. Place the `.tmux.conf` file in your root directory (`~/`)
3. Open a terminal and run `tmux source ~/.tmux.conf` to reload the configuration file.

## Installation
Follow the tmux [installation guide](https://github.com/tmux/tmux/wiki/Installing) to install it properly.

## Configuration
* If you want your temperature in fahrenheit then in `.tmux.conf` file change `set -g @dracula-show-fahrenheit` to `false`.
* To further customize your tmux read the [official Dracula theme plugin documentation](https://draculatheme.com/tmux) for more information.

## Commands
For these commands to work you need to have my [zsh](#zsh) configuration and have [this tmux plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux) and my `aliases.zsh` file setup properly.

| Commands | Description |
|---|---|
| `ts <name>` | Create new session with name |
| `ta <name>` | Come back to session |
| `tl` | List of sessions |
| `td` | Leave session |
| `tkc` | Terminate current session |
| `tko` | Terminate all other sessions |
| `tka` | Terminate all sessions |

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
3. Run :PackerSync

## Installation
See [this](https://github.com/jdhao/nvim-config/blob/master/docs/README.md) for information on how to install and setup nvim on your platform. 

## Plugins
Here is a complete list of all plugins. Special thanks to all of the authors and maintainers. The order is the same as in the `plugins.lua` file.
<details>
  <summary>Plugins list</summary>
 
  | Name | Description |
  |---|---|
  | [Packer](https://github.com/wbthomason/packer.nvim) | Plugin/Package manager |
  | [Plenary](https://github.com/nvim-lua/plenary.nvim) | Used by plugins |
  | **Theme** | Plugins affecting visuals |
  | [Onedark](https://github.com/navarasu/onedark.nvim) | Awesome theme |
  | [Vim Nightfly Guicolors](https://github.com/bluz71/vim-nightfly-colors) | Theme |
  | [Tender](https://github.com/jacoborus/tender.vim) | Theme |
  | [Melange](https://github.com/savq/melange-nvim) | Theme inspired by Monokai |
  | [Catppuccin](https://github.com/savq/melange-nvim) | Theme |
  | [Startup](https://github.com/startup-nvim/startup.nvim) | Customizable startup screen |
  | **Essential** | Add functionality |
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
  | [Bufferline](https://github.com/akinsho/bufferline.nvim) | Shameless attempt to emulate the aesthetics of GUI text editors |
  | **Languages** | LSP, language specific plugins |
  | [Rust tools](https://github.com/simrat39/rust-tools.nvim) | Better rust experience |
  | [Cpp Modern](https://github.com/bfrg/vim-cpp-modern) | Better C/C++ experience |
  | [Deoplete clang](https://github.com/deoplete-plugins/deoplete-clang) | Better C/C++ experience |
  | [Clangd Extensions](https://github.com/p00f/clangd_extensions.nvim) | Better C/C++ experience |
  | [Cpp Enhanced Highlight](https://github.com/octol/vim-cpp-enhanced-highlight) | Highlighting for C++ |
  | [Popfix](https://github.com/RishabhRD/popfix) | Allows you to write UI for plugins easily |
  | [Nvim Lsp Utils](https://github.com/RishabhRD/nvim-lsputils) | Better LSP |
  | [Lsp Status](https://github.com/nvim-lua/lsp-status.nvim) | Helps to generate status line |
  | [LSP Setup](https://github.com/junnplus/lsp-setup.nvim) | Wrapper for [LSP Config](https://github.com/neovim/nvim-lspconfig) and [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) |
  | [LSP Config](https://github.com/neovim/nvim-lspconfig) | [Configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for the [neovim LSP client](https://neovim.io/doc/user/lsp.html) |
 | [Nvim Cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine for neovim |
 | [Cmp Nvim LSP](https://github.com/hrsh7th/cmp-nvim-lsp) | Source for neovim's built-in language server client |
 | [Lua Snip](https://github.com/L3MON4D3/LuaSnip) | Snippets for Lua |
 | [Cmp Lua Snip](https://github.com/saadparwaiz1/cmp_luasnip) | [Lua Snip](https://github.com/L3MON4D3/LuaSnip) completion source for [Nvim Cmp](https://github.com/hrsh7th/nvim-cmp) |
 | [Nvim Lsp Installer](https://github.com/williamboman/nvim-lsp-installer) | Installs Lsp servers |
 | [Friendly Snippets](https://github.com/sar/friendly-snippets.nvim) | Adds snippets for several languages |
 | [LSP Kind](https://github.com/onsails/lspkind.nvim) | Adds VS code like pictograms |
 | [LSP Fuzzy](https://github.com/ojroques/nvim-lspfuzzy) | Makes neovim LSP use [FZF](https://github.com/junegunn/fzf) |
 | [LSP Signature](https://github.com/ray-x/lsp_signature.nvim) | Show function signature when you type |
 | [COQ](https://github.com/ms-jpq/coq_nvim) | Autocompletion |
 | [Mason](https://github.com/williamboman/mason.nvim) | Install and manage LSP servers |
 | [DAP](https://github.com/mfussenegger/nvim-dap) | Debugging |
 | [DAP UI](https://github.com/rcarriga/nvim-dap-ui) | UI for DAP |
 | [DAP Virtual Text](https://github.com/theHamsta/nvim-dap-virtual-text) | Adds virtual text support to [DAP](https://github.com/mfussenegger/nvim-dap) |
 | [Cortex debug](https://github.com/Marus/cortex-debug) | Debugger for C/C++/Rust |
 | [Which key](https://github.com/folke/which-key.nvim) | Shows possible key bindings |
 | [Trouble](https://github.com/folke/trouble.nvim) | Pretty list for diagnostics, definitions, etc. |
 | [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) | Inject LSP diagnostics, code actions, etc. |
 | [Mason Null-ls](https://github.com/jay-babu/mason-null-ls.nvim) | Bridges [Mason](https://github.com/williamboman/mason.nvim) and [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) |
 | [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Highlighting |
 | [LSP Saga](https://github.com/glepnir/lspsaga.nvim) | Powerfull LSP UI plugin |
 | [Fidget](https://github.com/j-hui/fidget.nvim) | LSP progress handler |
 | **Esthetics** | Style guide, indentation, trailing spaces etc. |
 | [Editor Config](https://github.com/gpanders/editorconfig.nvim) | Style guide helper |
 | [Indent-o-matic](https://github.com/Darazaki/indent-o-matic) | Automatic indentation |
 | [Whitespace](https://github.com/johnfrankmorgan/whitespace.nvim) | Remove trailing spaces |
 | [Autopairs](https://github.com/windwp/nvim-autopairs) | Automatically close parens, brackets, quotes, etc. |
 | [LSP Colors](https://github.com/folke/lsp-colors.nvim) | Adds colors for LSP |
 | [Custom Diagnostic Highlight](https://github.com/Kasama/nvim-custom-diagnostic-highlight) | Better LSP Highlight |
 | [Dressing](https://github.com/stevearc/dressing.nvim) | Better UI |
 | [Git Signs](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
 
</details>

## Key binding
`<leader>` represents space key.

| Shortcut | Mode | Description |
|---|---|---|
| `jk` | Insert | Enter normal mode |
| `<leader>su` | Normal | Return to Startup screen |
| `<leader>ff` | Normal | Find file in current directory |
| `<leader>fs` | Normal | Find string in current directory|
| `<leader>ftd` | Normal | Search though TODO comments |
| `<leader>dtd` | Normal | Dislpay all TODO comments |
| `<leader>ra <old> <new>` | Normal | Replace old with new |
| `<leader>cm` | Normal | Open clipboard manager |
| `<leader>rb` | Normal | Recent buffers in current session |
| `<leader>of` | Normal | Old files |
| `<leader>r` | Normal | Reload nvim configuration |
| `<leader>ps` | Normal | Run :PackerSync command |
| `<leader>tsu` | Normal | Run :TSUpdate command |
| `<leader>lt` | Normal | See load times of plugins |
| `<leader>gc` | Normal | Toggle grammar check |
| `<leader>ca` | Normal | Code actions |
| `<leader>o` | Normal | Toggle outline |
| `<leader>ld` | Normal | Show line diagnostics |
| `<leader>bd` | Normal | Show buffer diagnostics |
| `<leader>pd` | Normal | Peek definition in float window |
| `fd` | Normal | Find definition and reference |
| `gd` | Normal | Go to definition |
| `B` | Normal | Get bytes ammount, definition |
| `[d` `]d` | Normal | Move between diagnostics |
| `[e` `]e` | Normal | Jump between errors |
| `<command>t` | Any | Opens terminal on next window |

## Recommended read
Here are some resources you can use to master this configuration. Note that all the plugins mentioned are already installed and configured.

| Name | Description |
|---|---|
| [surround.vim](https://github.com/tpope/vim-surround) | Master the art of parentheses, brackets, quotes, XML tags, and more |

# Toubleshooting

## Too many files open
If you get this error message after running `:PackerSync` then go into a terminal and enter this piece of code: `ulimit -n 10240`. Note that this is not a permanent solution. It will increase the maximum number of files just for the current session.
