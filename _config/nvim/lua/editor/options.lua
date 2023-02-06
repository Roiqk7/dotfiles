local o = vim.o -- set editor global-local editor options
local wo = vim.wo -- set window-local editor options
local g = vim.go -- set global editor editor options
local fn = vim.fn -- invoke vim-functions in lua
local autogroup = vim.api.nvim_create_augroup -- create autocmd group
local autocmd = vim.api.nvim_create_autocmd -- create autocmd

-- ============================================================================ --
-- ===                                OPTIONS                               === --
-- ============================================================================ --

local opt = vim.opt -- for concisness

-- encoding
opt.fileencoding = "utf-8"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.title = true
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- advanced autocompletion settings
opt.wildmenu = true

opt.iskeyword:append("-")

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


-- Set clipboard to the +  registers only
-- if you want to use the * also add ,unnamed
if fn.has("clipboard") == 1 then
    vim.opt.clipboard:append({ "unnamedplus" })
end

-- Restore cursor to file position in previous editing session
-- This autocommand jumps to the last known position in a file
-- just after opening it, if the '-- mark is set: >
local RetoreCursorPosition = autogroup("RetoreCursorPosition", { clear = true })
autocmd({ "BufReadPost" }, {
    group = RetoreCursorPosition,
    pattern = { "*" },
    command = [[call setpos(".", getpos("'\""))]],
})

--Make a backup before overwriting a file.  The backup is removed after the file was successfully written
-- unless the 'backup' option is also on.
g.writebackup = true

--Make a backup before overwriting a file.  Leave it around after the file has been successfully written.
--this make sure you alway have a backup of a file around,meaning in cases where there is no swapfile
--to recover from you can use the backup file directly
g.backup = true

--List of directories for the backup file
vim.opt_global.backupdir = { "/tmp//" }

-- tells neovim how backups are done
o.backupcopy = "auto"

-- The extension to be used for vim backup files
g.backupext = ".vimbak"

-- enable saving unsaved/unwritten files in a *.swp file
o.swapfile = true

-- saves undo history to an undo file when writing a buffer to a file, and restores undo
-- history from the same file on buffer read.
o.undofile = true

-- Maximum number of changes that can be undone.
o.undolevels = 30000

-- Don't redraw screen when executing macros,registers or untyped commands
g.lazyredraw = true

-- You will have bad experience for diagnostic messages when it's default 4000.
g.updatetime = 100

-- Time in milliseconds to wait for a mapped sequence to complete.
g.timeoutlen = 500

-- Use timeout for showing which-keys
o.timeout = true

-- don't give |ins-completion-menu| messages.
g.shortmess = "c"

-- always merge sign column and number column into one
wo.signcolumn = "yes"

-- Don't let autocomplete affect usual typing habits
vim.opt_global.completeopt = { "menuone", "noselect" }

-- This option allows you to switch between multiple buffers
g.hidden = true -- without saving a changed buffer

-- Automatically enable mouse usage
g.mouse = "a"

-- enable line wrap
wo.wrap = true

-- Line wrap (number of cols)
o.textwidth = 117

-- Highlight matching brace
g.showmatch = true

-- text complete with CTRL-N or CTRL-P
o.complete = "kspell"

-- Enable spell checking for español y ingles--
o.spelllang = "en" --"en,es"

-- Show best nine spell checking candidates at most
vim.opt_global.spellsuggest = { "best", "9" }

-- When a word is CamelCased, assume "Cased" is a separate word: every upper-case character
-- in a word that comes after a lower case character indicates the start of a new word.
o.spelloptions = "camel"

-- make diff mode always open in vertical split
vim.opt_global.diffopt:append({ "vertical" })

-- Use visual bell (no beeping)
g.visualbell = true

-- Always case-insensitive
g.ignorecase = true

-- Enable smart-case search
g.smartcase = true

-- case insensitive auto completion
g.wildignorecase = true

--Set 'tabstop' and 'shiftwidth' to whatever you prefer and use 'expandtab'.
--This way you will always insert spaces.  The formatting will never be messed up when 'tabstop' is changed.
--Number of spaces that a <Tab> in the file counts for
o.tabstop = 4

-- Number of auto-indent spaces
o.shiftwidth = 4

-- Number of spaces per Tab
-- When 'softtabstop' is negative, the value of 'shiftwidth' is used.
o.softtabstop = -1

-- always expands tab to spaces. It is good when peers use different editor.
o.expandtab = true

-- Prompt confirmation dialogs
g.confirm = true

-- Command line height
g.cmdheight = 1

-- Auto-write all file changes
g.autowriteall = true

-- Display unprintable characters f12 - switches
wo.list = true

-- Unprintable chars mapping
vim.opt.listchars = { tab = "••", trail = "•", extends = "»", precedes = "«" }

-- Enable folding
wo.foldmethod = "indent"

wo.foldlevel = 99

-- Remove Trailing whitespaces in all files
autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]] })

-- automatically show diagnostics on current line
autocmd("CursorHold", {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "shadow",
            source = "if_many",
            severity_sort = true,
        }
        vim.diagnostic.open_float(nil, opts)
    end
})
