require("utils")

-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

require("gitsigns").setup({
    signcolumn         = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl              = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl             = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff          = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`

    preview_config = {
        -- Options passed to nvim_open_win
        border = 'shadow',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { buffer = bufnr }

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, vim.tbl_extend("force", opts, { expr = true }))

        map("n", "[c", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, vim.tbl_extend("force", opts, { expr = true }))

        -- Actions
        map({ "n", "v" }, "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
        map({ "n", "v" }, "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
        end)
        map("n", "<leader>tb", gs.toggle_current_line_blame)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function()
            gs.diffthis("~")
        end)
        map("n", "<leader>td", gs.toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>")
    end,
})
