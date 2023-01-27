require("utils")
-- === Spell checking ===
-- For help on spell checking :help spell

-- Pressing <leader>gc will toggle and untoggle spell checking
map({ "n", "v", "o" }, "<leader>gc", "<cmd>set spell!<cr>", { remap = true })
