-- import startup plugin safely
local status, startup = pcall(require, "startup")
if not status then
    return
end

startup.setup({
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            -- Feel free to change the art but beware of '\' as it is used as escape sequence
            -- website of the author: https://asciiart.website
            "             \\\\\\\\\\\\\\\\|/////\\",
            "               \\\\\\\\\\\\\\\\\\|//////\\",
            "                  \\\\\\\\\\\\\\\\I////////\\",
            "                     \\\\\\\\\\\\\\I//////////\\",
            "                       \\IIIIII\\I\\//////////\\",
            "                           /****/*\\////////////\\",
            "                           /****/***\\////////////\\",
            "                          /****/*****|////////////|",
            "               J$$$$$$$$$$$$$$$******\\////////////|",
            "            J$$***************$$$$$***|///////////",
            "           $$**********************$$L. \\\\\\\\\\\\\\\\\\/",
            "         .$***************************$$L       ",
            "      .J$$$$$$$$$************************$L     ",
            "    .J$$*********$$$$$$$$$$$***************$$   ",
            " J$$$***********************$$$$$$$$*********$  ",
            "$$**********************************$$$$$$$***$ ",
            "$*****************************************$$$$$ ",
            " $********$$$$$$*************************$***$$ ",
            " $******$$$$$$$$$$$$$$$$$$$$************$*****$$",
            "  $**$$$$ $$$$$$$$$$$$$$$$$ $$$$$$$$****$******$",
            "   ~~ $$$    %%$$$$$$$%%    $$$$$$$$$$$$$$****$ ",
            "       $$$   %%  $$$  %%   $$$$$$$$$$$$$$*#$$*$ ",
            "       $$$       $$$      $$$$$$$$$$$$$$*#****$ ",
            "       $$$$$    $$$$$    $$$$$$$$$$$$$*#*****$  ",
            "      $&&$$$$$$$$$$$$$$$$$$$$$$$$$$%**##*****$  ",
            "     $&&&&&$$$$$$$$$$$$$$$$$$$$$$$%**#******$   ",
            "    $&&&&&&&$$$$$$$$$$$$$$$$$$$$$$#########$    ",
            "   $&&&&&&&&&&% ~T$$$$$$$$$$$$$$T~********$     ",
            "   $&&&&&&&&T'       OOOOOOOOOOOO********$      ",
            "                   OOOOOOOOOOOOOOOO             ",
            "                  OOOOOOOOOOOOOOOOOOO           ",
            "               OOOOOOOOOOOOOOOOOOOOOO           ",
            "              OOO/OOOOOOOOOOOOO/OOOOOO          ",
            " ",
            "██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗██╗",
            "██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝██║",
            "██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ██║",
            "██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝",
            "╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██╗",
            " ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝",
        },
        highlight = "Statement",
        default_color = "#FFFF00",
        oldfiles_amount = 0,
    },
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            { " File Browser", "NvimTreeToggle", "<leader>e" },
            { " Recent Files", "Telescope oldfiles", "<leader>of" },
            { " Display TODOs", "TodoQuickFix", "<leader>dtd" },
            { " Find File", "Telescope find_files", "<leader>ff" },
            { "󰇚 Update", "PackerSync", "<leader>ps" },
            { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
        },
        highlight = "String",
        default_color = "#FFDEAD",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = {
            "Configuration by: github.com/Roiqk7",
            "Art by: Mark Stahlsmith",
        },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },
    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    parts = { "header", "body", "footer" },
})
