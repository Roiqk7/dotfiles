require("utils")
-- Mapping to open terminal emulator in nvim
-- open terminal on <command>t
map("n", "<leader>t", function()
    vim.cmd([[
        split term://zsh
        resize 15
    ]])
end)

-- mapping to close terminal emulator
map("t", "<M-t>", [[<C-\><C-n>:bd!<CR>]])
