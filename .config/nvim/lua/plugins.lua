-- TODO :221

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

    -- lua functions used by many plugins
    use("nvim-lua/plenary.nvim")

    -- ============================================================================ --
    -- ===                                THEME                                 === --
    -- ============================================================================ --

    -- active colorscheme
    use("navarasu/onedark.nvim")

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

    -- master comments
    use({
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    })

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

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

    -- todo comments
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end
    })

    -- project wide find and replace
    use({
        "ray-x/sad.nvim",
        requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
        config = function()
            require("sad").setup()
        end,
    })

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

    -- C/C++
    use({
        "p00f/clangd_extensions.nvim",
        config = function()
            require("clangd_extensions").setup()
        end
    })

    -- Lua
    use({
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui" }, types = true },
            })
        end
    })

    -- Rust
    use("simrat39/rust-tools.nvim")

    -- ============================================================================ --
    -- ===                                LSP                                   === --
    -- ============================================================================ --

    -- setup
    use({
        "junnplus/lsp-setup.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    })

    -- TODO: Look more into this
    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-emoji")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("onsails/lspkind.nvim")
    use({
        "ojroques/nvim-lspfuzzy",
        requires = {
            { "junegunn/fzf" },
        },
    })

    -- lsp hints as you type
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

    --debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("nvim-telescope/telescope-dap.nvim")
    use("folke/trouble.nvim")

    use({
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup()
        end
    })

    -- formatting & linting
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
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
            require("lspsaga").setup()
        end,
        requires = { { "nvim-tree/nvim-web-devicons" } }
    })

    -- LSP progress handler UI
    use("j-hui/fidget.nvim")

    -- simple lsp coloring
    use({
        "folke/lsp-colors.nvim",
        config = function()
            require("lsp-colors").setup({
                Error = "#db4b4b",
                Warning = "#e0af68",
                Information = "#0db9d7",
                Hint = "#10B981"
            })
        end,
    })

    -- used by status line
    use("nvim-lua/lsp-status.nvim")

    -- ============================================================================ --
    -- ===                                ESTHETICS                             === --
    -- ============================================================================ --

    -- automatic indentation correction
    use("Darazaki/indent-o-matic")

    -- auto closing
    use("windwp/nvim-autopairs")

    -- better diagnostic highlighting
    use("Kasama/nvim-custom-diagnostic-highlight")

    -- improved UI
    use("stevearc/dressing.nvim")

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    if packer_bootstrap then
        require("packer").sync()
    end
end)
