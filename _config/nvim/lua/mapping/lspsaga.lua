-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
map({ "i", "n" }, "fd", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
map({ "i", "n" }, "pd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to Definition
map({ "i", "n" }, "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Show line diagnostics you can pass argument ++unfocus to make
-- show_line_diagnostics float window unfocus
map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostic
map("n", "<leader>bd", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump can use `<c-o>` to jump back
map({ "i", "n" }, "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map({ "i", "n" }, "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filter like Only jump to error
map({ "i", "n" }, "[e", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
map({ "i", "n" }, "]e", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- if you want keep hover window in right top you can use ++keep arg
-- notice if you use hover with ++keep you press this keymap it will
-- close the hover window .if you want jump to hover window must use
-- wincmd command <C-w>w
map({ "i", "n" }, "hd", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
