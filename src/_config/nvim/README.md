# [Neovim](https://neovim.io)

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

`editor` contains the neovim editor configuration.

`mapping` contains all key bindings.

`plugrc` contains individual plugin setups.

`ui` contains settings for neovim appearance.

`plugins` contains [Packer](https://github.com/wbthomason/packer.nvim) with a list of all plugins.

`utils.lua` contains handy, reusable functions.

With over 60 plugins, the average load time is **under 9 milliseconds** *(measured on a MacBook M2)*.
