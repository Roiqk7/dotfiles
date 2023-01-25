local function total_num_lines()
    return vim.fn.expand(vim.fn.line("$"))
end

require("lualine").setup({
    options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {
            "branch",
            "diff",
            {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
        },
        lualine_c = {"encoding"},
        lualine_x = {"filetype"},
        lualine_y = {"diagnostics"},
        lualine_z = {
            { "location", separator = { right = '' }, left_padding = 2 },
        },
    },
})
