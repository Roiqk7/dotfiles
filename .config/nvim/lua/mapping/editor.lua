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

-- restart lsp server
map("n", "<leader>rlsp", ":LspRestart<CR>") -- mapping to restart lsp if necessary

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
        map("n", "<leader>rc", function()
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
        map("n", "<leader>r", function()
            reloadAllModules()
            vim.notify("!Reloaded Nvim!", vim.log.levels.INFO)
        end, { buffer = true })
    end
})
