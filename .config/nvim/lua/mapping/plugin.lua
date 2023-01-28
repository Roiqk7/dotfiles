require("utils")

-- startup
map("n", "<leader>su", ":Startup display<CR>")

-- packer sync
map("n", "<leader>ps", ":PackerSync<CR>")

-- update treesitter
map("n", "<leader>tsu", ":TSUpdate<CR>")

-- see plugin load times
map("n", "<leader>lt", ":LuaCacheProfile<CR>")

-- vim-maximizer
map("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- grammar check
map({ "n", "v", "o" }, "<leader>gc", "<cmd>set spell!<cr>", { remap = true })

-- sad: project wide find and replace
map("n", "<leader>ra", ":Sad ")

-- clipboard manager
map("n", "<leader>cm", ":Telescope neoclip<CR>")

-- telescope
map("n", "<leader>ff", ":Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", ":Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", ":Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>rb", ":Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", ":Telescope help_tags<cr>") -- list available help tags

-- TO-DO comments
map("n", "<leader>ftd", ":TodoTelescope<CR>") -- search though TO-DO comments
map("n", "<leader>dtd", ":TodoQuickFix<CR>") -- display all TO-DO comments
