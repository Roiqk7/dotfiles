require("utils")
-- === Spell checking === "
-- For help on spell checking :help spell

-- Pressing <leader>st will toggle and untoggle spell checking
map({ "n", "v", "o" }, "<leader>st", "<cmd>set spell!<cr>", { remap = true })
