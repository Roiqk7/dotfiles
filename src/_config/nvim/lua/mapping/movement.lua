require("utils")
-- === Moving around, tabs, windows and buffers === --

local opt = { remap = true }
local mode = { "n", "v", "o" }

-- buffer management
map(mode, "<leader>bc", "<cmd>bdelete<cr>", opt) -- Close the current buffer
map(mode, "<leader>ba", "<cmd>bufdo bd<cr>", opt) -- Close all the buffers
map(mode, "bn", "<cmd>bnext<cr>", opt) -- move forward to the next buffer in the buffer list
map(mode, "bp", "<cmd>bprevious<cr>", opt) -- move back to the previous buffer in the buffer list
map(mode, "<leader>bl", "<cmd>b#<cr>", opt) -- move to the last visited buffer
map(mode, "<leader>b1", "<cmd>bfirst<cr>", opt) -- move to the first buffer in the buffer list
map(mode, "<leader>b9", "<cmd>blast<cr>", opt) -- move to the last buffer in the buffer list

-- window management
map("n", "<leader>sv", "<C-w>v") -- split window vertically
map("n", "<leader>sh", "<C-w>s") -- split window horizontally
map("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>") -- close current split window
