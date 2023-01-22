require("utils")

local opt = { remap = true }

-- ============================================================================ --
-- ===                                KEYMAPS                               === --
-- ============================================================================ --

-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps --
---------------------

-- use jk to exit insert mode
map("i", "jk", "<ESC>", { remap = false, nowait = true })

-- clear search highlights
map("n", "<leader>csh", "<cmd>nohl<CR>")

-- delete single character without copying into register
map("n", "x", '"_x')

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>") -- increment
map("n", "<leader>-", "<C-x>") -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v") -- split window vertically
map("n", "<leader>sh", "<C-w>s") -- split window horizontally
map("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>") -- close current split window

-- tab management
map("n", "<leader>to", ":tabnew<CR>") -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tl", ":tabn<CR>") --  go to next tab
map("n", "<leader>th", ":tabp<CR>") --  go to previous tab

-- search selected region on current line
map("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opt)

-- idea |copy_history:| keypress to extract search properly from history without \V
map("n", "B", "m`0i<CR><ESC>``i", opt) -- J(join) B(BackJoin): move text after cursor to next line

-- keep pasting over the same thing, ie. delete content and paste something in it place
map("n", "<leader>p", [[m`0"_DP``]], opt)
map("v", "<leader>p", [[m`"_dP``]], opt)

-- delete content without clobbering registers
map("n", "<leader>d", [["_dd]], opt)
map("v", "<leader>d", [["_d]], opt)

-- Switch CWD to the directory of the open buffer
map({ "n", "v", "o" }, "<leader>cd", "<cmd>cd %:p:h<cr>:pwd<cr>", opt)

----------------------
-- Plugin Keybinds  --
----------------------

-- vim-maximizer
map("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
map("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
map("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- maybe make below a filetype plugin
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.lua" },
    callback = function(ev)
        _ = ev
        -- :help api-autocmd
        -- nvim_create_autocmd's callback receives a table argument with fields
        -- ev = {id,event,group?,match,buf,file,data(arbituary data)}

        -- reload/source current file
        map("n", "<leader>r", function()
            vim.cmd([[luafile %]])
            print("reloaded " .. vim.fn.expand("%"))
        end, { buffer = true })

        -- reload a particular module
        map("n", "<leader>rm", function()
            local module_name = vim.fn.input({
                prompt = "\nEnter the name of the module you want to reload\n:",
                completion = "file"
            })
            if module_name == "" then
                return
            else
                reload(module_name)
                vim.notify("!Reloaded Nvim Module " .. module_name .. ".lua!", vim.log.levels.INFO)
            end

        end, { buffer = true })

        -- reload all nvim configuration modules
        map("n", "<leader>ra", function()
            reloadAllModules()
            vim.notify("!Reloaded All Nvim Modules!", vim.log.levels.INFO)
        end, { buffer = true })
    end
})
