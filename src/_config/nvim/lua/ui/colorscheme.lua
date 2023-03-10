-- import startup plugin safely
local status, onedark = pcall(require, "onedark")
if not status then
    return
end

-- Onedark colorscheme
onedark.setup({
    -- Main options --
    style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    -- toggle theme style ---
    toggle_style_key = "<leader>ts", -- Default keybinding to toggle
    toggle_style_list = {
        "dark",
        "darker",
        "cool",
        "deep",
        "warm",
        "warmer",
        "light",
    }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {
        ["@variable"] = {fg = "#fa0585"},
        ["@operator"] = {fg = "#00c8ff"},
        ["@type"] = {fg = "#00d0ff"},
        ["@function"] = {fg = "#9369ff"},
        ["@keyword"] = {fg = "#f4f40c"},
        ["@statement"] = {fg = "#2701fd"},
        ["@comment"] = {fg = "#576d9b"}
    },

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
    },
})
require("onedark").load()
