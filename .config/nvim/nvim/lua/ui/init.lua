--Enable true colours in terminal
vim.o.termguicolors = true

vim.o.background = "dark"

-- colour scheme
require("ui.colorscheme")

-- startup screen
require("ui.startup")

-- status line
require("ui.lualine")

-- buffer line
require("ui.bufferline")
