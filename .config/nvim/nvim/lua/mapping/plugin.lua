require("utils")

-- startup
map("n", "<leader>su", ":Startup display<CR>")

-- packer sync
map("n", "<leader>ps", ":PackerSync<CR>")

-- see plugin load times
map("n", "<leader>lt", ":LuaCacheProfile<CR>")

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- outline
map("n", "<leader>o", "<cmd>SymbolsOutline<CR>")

-- grammar check
map({ "n", "v", "o" }, "<leader>gc", "<cmd>set spell!<cr>", { remap = true })

-- sad: project wide find and replace
map("n", "<leader>ra", ":Sad ")

-- get info about object under cursor
map("n", "<leader>tsi", ":TSHighlightCapturesUnderCursor<CR>")

-- telescope
map("n", "<leader>ff", ":Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", ":Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", ":Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>rb", ":Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", ":Telescope help_tags<cr>") -- list available help tags

-- TO-DO comments
map("n", "<leader>ftd", ":TodoTelescope<CR>") -- search though TO-DO comments
map("n", "<leader>dtd", ":TodoQuickFix<CR>") -- display all TO-DO comments
