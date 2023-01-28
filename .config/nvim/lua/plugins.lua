-- TODO :126
-- TODO lso saga rename

-- ============================================================================ --
-- ===                               PLUGINS                                === --
-- ============================================================================ --

-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)

    -- packer can manage itself
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- ============================================================================ --
    -- ===                                THEME                                 === --
    -- ============================================================================ --

    -- active colorscheme
    use("navarasu/onedark.nvim")

    -- colorscheme
    use("bluz71/vim-nightfly-guicolors")

    -- colorscheme
    use("jacoborus/tender.vim")

    -- colorscheme
    use("savq/melange")

    -- colorscheme
    use("tanvirtin/monokai.nvim")

    -- colorscheme
    use("catppuccin/nvim")

    -- beautiful startup screen
    use({
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup()
        end
    })

    -- ============================================================================ --
    -- ===                             ESSENTIAL                                === --
    -- ============================================================================ --

    -- easily work with surroundins {}, [], (), "" etc.
    use("tpope/vim-surround")

    -- replace with register contents using motion (gr + motion)
    use("inkarkat/vim-ReplaceWithRegister")

    -- better comments

    use({
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    })

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

    -- maximizes and restores current window
    use("szw/vim-maximizer")

    -- file explorer
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
        live_filter = {
            prefix = "[FILTER]: ",
            always_show_folders = false,
        }
    })

    -- vs-code like icons
    use("ryanoasis/vim-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding w/ telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- browse in vim
    use("tyru/open-browser.vim")

    -- todo comments
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        require("todo-comments").setup()
    })

    -- project wide find and replace
    use({
        "ray-x/sad.nvim",
        requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
        config = function()
            require("sad").setup()
        end,
    })

    -- clipboard manager
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            -- persistent history bewtween sessions
            { "kkharji/sqlite.lua", module = "sqlite" },
            -- you'll need at least one of these
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("neoclip").setup()
        end,
    }

    -- speeds up load time
    use({
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient")
            require("impatient").enable_profile()
        end
    })

    -- helps to compile treesitter
    use({
        "nvim-neorg/neorg",
        run = ":Neorg sync-parsers", -- This is the important bit!
        config = function()
            require('neorg').setup {
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.norg.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim",
    })

    -- tab line
    use({
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons"
    })

    -- ============================================================================ --
    -- ===                             LANGUAGES                                === --
    -- ============================================================================ --

    -- Rust
    use("simrat39/rust-tools.nvim")

    -- C/C++
    use("bfrg/vim-cpp-modern")
    use("deoplete-plugins/deoplete-clang")
    use("p00f/clangd_extensions.nvim")
    use("octol/vim-cpp-enhanced-highlight")

    --LSP
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-lsputils")
    use("nvim-lua/lsp-status.nvim")

    --LSP autocomplete
    use("junnplus/lsp-setup.nvim")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-emoji")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("williamboman/nvim-lsp-installer")
    use("rafamadriz/friendly-snippets")
    use("onsails/lspkind.nvim")
    use({
        "ojroques/nvim-lspfuzzy",
        requires = {
            { "junegunn/fzf" },
        },
    })
    use("ray-x/lsp_signature.nvim")

    -- fast autocompletion, snippets etc.
    use({ "ms-jpq/coq_nvim", branch = "coq" })
    use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
    use({
        "ms-jpq/coq.thirdparty",
        branch = "3p",
        config = function()
            require("coq_3p") {
                { src = "nvimlua", short_name = "nLUA" },
                { src = "vimtex", short_name = "vTEX" },
                { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
                { src = "bc", short_name = "MATH", precision = 6 },
                { src = "dap" },
                { src = "builtin/c" },
                { src = "builtin/syntax" },
                { src = "builtin/xml" },
            }
        end,
    })

    -- managing & installing lsp servers, linters & formatters
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    --debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")
    use("Marus/cortex-debug")
    use("folke/which-key.nvim")
    use("folke/trouble.nvim")

    -- formatting & linting
    use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
    use("jay-babu/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").compilers = { "gcc" }
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- LSP saga configuration
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = { { "nvim-tree/nvim-web-devicons" } }
    })

    -- LSP progress handler UI
    use("j-hui/fidget.nvim")

    -- ============================================================================ --
    -- ===                                ESTHETICS                             === --
    -- ============================================================================ --

    -- coding style helper
    use("gpanders/editorconfig.nvim")

    -- automatic indentation correction
    use("Darazaki/indent-o-matic")

    -- remove trailing whitespaces
    use({
        "johnfrankmorgan/whitespace.nvim",
        config = function()
            require("whitespace-nvim").setup({
                -- configuration options and their defaults

                -- `highlight` configures which highlight is used to display
                -- trailing whitespace
                highlight = "DiffDelete",

                -- `ignored_filetypes` configures which filetypes to ignore when
                -- displaying trailing whitespace
                ignored_filetypes = { "TelescopePrompt", "Trouble", "help" },
            })

            -- remove trailing whitespace with a keybinding
            vim.keymap.set("n", "<Leader>t", require("whitespace-nvim").trim)
        end,
    })

    -- auto closing
    use("windwp/nvim-autopairs")

    -- simple lsp coloring
    use("folke/lsp-colors.nvim")

    -- better diagnostic highlighting
    use("Kasama/nvim-custom-diagnostic-highlight")

    -- better UI
    use("stevearc/dressing.nvim")

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    if packer_bootstrap then
        require("packer").sync()
    end
end)
