## Table of Contents
* [Aliases](#Aliases)
* [Neovim](#Neovim)
  * [Steps](#Steps)
  * [Installation](#nvim_installation)
  * [Plugins](#nvim_plugins)
  * [Keybinding](#nvim_keybinding)
  * [Recommended read](#Recommended-read)
* [Troubleshooting](#Troubleshooting)

![Startup](https://github.com/Roiqk7/dotfiles/blob/main/assets/nvimStartup.png?raw=true)

## Aliases
The `aliases.zsh` file, contains my personal configuration. Plugins add a whole lot more, and I definitely recommend checking each plugin out.

Note: Don't forget to add `source ~/.config/aliases.zsh` into your `.zshrc`.

Tip: I recommend setting up alias for quick navigation to your work directory.

<details>
  <summary>List of all aliases</summary>

  | Alias | Command | Desription |
  |---|---|---|
  | **General** | | Practical commands |
  | `r` | `source ~/.zshrc` | Reload zsh configuration |
  | `c` | `clear` | Clear your terminal |
  | `x` | `exit` | Leave current session |
  | `u` | `bubu && maintain` | Runs all necessary update commands |
  | **Maintenance** | | Maintain this configuration with ease |
  | `u_colorls` | `gem update colorls` | Updates [colorls](https://github.com/athityakumar/colorls) |
  | `u_omz` | `omz update` | Updates [oh My ZSH!](https://ohmyz.sh) |
  | `maintain` | `u_colorls && u_omz` | Updates all plugins which are not managed by [brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) |
  | **Filesystem** | | Move faster across files |
  | `~` | `cd ~/` | Move to home directory |
  | `.` | `Open .` | Opens current directory |
  | `..` | `cd ..` | Move up a directory |
  | `...` | `cd ../..` | Move up 2 directories |
  | `....` | `cd ../../..` | Move up 3 directories |
  | `.....` | `cd ../../../..` | Move up 4 directories |
  | `ls` | `colorls` | Beautiful file listing |
  | `tree` | `colorls --tree=3 --sd --dark` | File tree |
  | `utree` | `colorls --tree=10 --sd --dark` | Unlimited file tree | 
  | `detail` | `colorls -lA --sd --dark` | Detailed info about files |
  | **Shortcuts** | | Fast navigation |
  | `.zshrc` | `nvim ~/.zshrc` | Opens `.zshrc` in neovim |
  | `aliases` | `nvim ~/.config/aliases.zsh` | Opens `aliases.zsh` in neovim |
  | `neovim` | `nvim ~/.config/nvim/init.lua` | Opens `init.lua` in neovim |
  | `.tmux.conf` | `nvim ~/.tmux.conf` | Opens `.tmux.conf` in neovim |
  | `.p10k` | `nvim `~.p10k.zsh` | Opens `.p10k.zsh` in neovim |
  | `.config` | `cd ~/.config` | Go to `.config` directory |
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

</details>

# Neovim

## Structure
```
📂  ~/.config/nvim/
   └────    📂  lua/
   │  └────    📂  editor/
   │  └────    📂  mapping/
   │  └────    📂  plugrc/
   │  │  └────    📂  lsp/
   │  └────    📂  ui/
   │  ├────    plugins.lua
   │  └────    utils.lua
   └────    init.lua
```

`editor` contains neovim editor configuration.

`mapping` contains all key bindings.

`plugrc` contains individual plugins setup.

`UI` contains settings of neovim appereance.

`plugins` contains [Packer](https://github.com/wbthomason/packer.nvim) with list of all plugins.

`utils.lua` contains handy reusable functions.




## Steps:
1. Follow [official installation guide](#nvim_installation) to get neovim

## Installation <a name="nvim_installation"></a>
See [this](https://github.com/jdhao/nvim-config/blob/master/docs/README.md) for information on how to install and setup nvim on your platform. 

## Plugins <a name="nvim_plugins"></a>
Here is a complete list of all plugins. Special thanks to all of the authors and maintainers. The order is the same as in the `plugins.lua` file.

With around 60 plugins the average load time is just **13 milliseconds** *(measured on MacBook M2)*.

<details>
  <summary>Plugins list</summary>
 
  | Name | Description |
  |---|---|
  | [Packer](https://github.com/wbthomason/packer.nvim) | Plugin/Package manager |
  | [Plenary](https://github.com/nvim-lua/plenary.nvim) | Used by plugins |
  | **Theme** | Plugins affecting visuals |
  | [Onedark](https://github.com/navarasu/onedark.nvim) | Awesome theme |
  | [Startup](https://github.com/startup-nvim/startup.nvim) | Customizable startup screen |
  | **Essential** | Add functionality |
  | [Surround](https://github.com/tpope/vim-surround) | Master parentheses, brackets, quotes, XML tags, and more |
  | [Comment](https://github.com/numToStr/Comment.nvim) | Better comments |
  | [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator) | Navigate seamlessly between vim and tmux |
  | [Nvim Tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
  | [Vim Dev Icons](https://github.com/ryanoasis/vim-devicons) | Adds icons for plugins |
  | [Lua line](https://github.com/nvim-lualine/lualine.nvim) | Adds neovim status line |
  | [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Finder |
  | [Todo Comments](https://github.com/folke/todo-comments.nvim) | Add todo comments |
  | [Sad](https://github.com/ray-x/sad.nvim) | Find and replace |
  | [Impatient](https://github.com/lewis6991/impatient.nvim) | Speed up startup time |
  | [Neorg](https://github.com/nvim-neorg/neorg) | Organizer |
  | [Bufferline](https://github.com/akinsho/bufferline.nvim) | Shameless attempt to emulate the aesthetics of GUI text editors |
  | **Languages** | Language specific plugins |
  | [Clangd Extensions](https://github.com/p00f/clangd_extensions.nvim) | Better C/C++ experience |
  | [Neodev](https://github.com/folke/neodev.nvim) | Better Lua experience |
  | [Rust Tools](https://github.com/simrat39/rust-tools.nvim) | Better Rust experience |
  | **LSP** | Lsp related |
  | [LSP Setup](https://github.com/junnplus/lsp-setup.nvim) | Wrapper for [LSP Config](https://github.com/neovim/nvim-lspconfig) and [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) |
  | [LSP Config](https://github.com/neovim/nvim-lspconfig) | [Configs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for the [neovim LSP client](https://neovim.io/doc/user/lsp.html) |
  |[Mason](https://github.com/williamboman/mason.nvim) | Vital for LSP |
  | [Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) | Vital for [Mason](https://github.com/williamboman/mason.nvim) |
 | [Nvim Cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine for neovim |
 | [Cmp Nvim LSP](https://github.com/hrsh7th/cmp-nvim-lsp) | Source for neovim's built-in language server client |
 | [Lua Snip](https://github.com/L3MON4D3/LuaSnip) | Snippets for Lua |
 | [Cmp Lua Snip](https://github.com/saadparwaiz1/cmp_luasnip) | [Lua Snip](https://github.com/L3MON4D3/LuaSnip) completion source for [Nvim Cmp](https://github.com/hrsh7th/nvim-cmp) |
 | [LSP Kind](https://github.com/onsails/lspkind.nvim) | Adds VS code like pictograms |
 | [LSP Fuzzy](https://github.com/ojroques/nvim-lspfuzzy) | Makes neovim LSP use [FZF](https://github.com/junegunn/fzf) |
 | [LSP Signature](https://github.com/ray-x/lsp_signature.nvim) | Show function signature when you type |
 | [DAP](https://github.com/mfussenegger/nvim-dap) | Debugging |
 | [DAP UI](https://github.com/rcarriga/nvim-dap-ui) | UI for DAP |
 | [DAP Virtual Text](https://github.com/theHamsta/nvim-dap-virtual-text) | Adds virtual text support to [DAP](https://github.com/mfussenegger/nvim-dap) |
 | [Trouble](https://github.com/folke/trouble.nvim) | Pretty list for diagnostics, definitions, etc. |
 | [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) | Inject LSP diagnostics, code actions, etc. |
 | [Mason Null-ls](https://github.com/jay-babu/mason-null-ls.nvim) | Bridges [Mason](https://github.com/williamboman/mason.nvim) and [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) |
 | [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Highlighting |
 | [LSP Saga](https://github.com/glepnir/lspsaga.nvim) | Powerfull LSP UI plugin |
 | [Fidget](https://github.com/j-hui/fidget.nvim) | LSP progress handler |
 | [LSP Colors](https://github.com/folke/lsp-colors.nvim) | Adds colors for LSP |
 | [LSP Kind](https://github.com/onsails/lspkind.nvim) | Nicer LSP |
 | [Lsp status](https://github.com/nvim-lua/lsp-status.nvim) | Status of LSP |
 | **Esthetics** | Style guide, indentation, trailing spaces etc. |
 | [Guess indent](https://github.com/NMAC427/guess-indent.nvim) | Formats indentation |
 | [Whitespace](https://github.com/johnfrankmorgan/whitespace.nvim) | Remove trailing spaces |
 | [Autopairs](https://github.com/windwp/nvim-autopairs) | Automatically close parens, brackets, quotes, etc. |
 | [Custom Diagnostic Highlight](https://github.com/Kasama/nvim-custom-diagnostic-highlight) | Better LSP Highlight |
 | [Dressing](https://github.com/stevearc/dressing.nvim) | Better UI |
 | [Git Signs](https://github.com/lewis6991/gitsigns.nvim) | Git decorations |
 
</details>

## Key binding <a name="nvim_keybinding"></a>
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
| [comment.nvim](https://github.com/numToStr/Comment.nvim) | Supper easy way to comment out code etc. |

# Troubleshooting

## Too many files open
If you get this error message after running `:PackerSync` then go into a terminal and enter this piece of code: `ulimit -n 10240`. Note that this is not a permanent solution. It will increase the maximum number of files just for the current session.
