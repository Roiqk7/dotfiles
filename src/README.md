# This directory contains the juice of this repository

## Structure
```
📂  _config
   └────  aliases.zsh
   └────📂 nvim
     └────  📂  lua/
       │  └────  📂  editor/
       │  └────  📂  mapping/
       │  └────  📂  plugrc/
       │  │  └────  📂  lsp/
       │  └────  📂  ui/
       │  ├────  plugins.lua
       │  └────  utils.lua
       └────  init.lua
└────  _p10k.zsh
└────  _tmux.conf
└────  _zshrc
```

**Note:** `_` in names represents `.`

`_config` represents `~/.config` on your computer.

`aliases.zsh` holds all aliases for [zsh](https://zsh.sourceforge.io).

`nvim` directory contains [neovim](https://neovim.io) configuration. [More info here](https://github.com/Roiqk7/dotfiles/blob/main/src/_config/nvim/README.md)

`_p10k.zsh` holds [Powerlevel10k](https://github.com/romkatv/powerlevel10k) configuration.

`_tmux.conf` holds [tmux](https://github.com/tmux/tmux/wiki) configuration.

`_zshrc` holds [zsh](https://zsh.sourceforge.io) configuration.
