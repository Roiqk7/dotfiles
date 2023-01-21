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

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

-- ============================================================================ --
-- ===                                THEME                                 === --
-- ============================================================================ --

    use("navarasu/onedark.nvim") -- active colorscheme

	use("bluz71/vim-nightfly-guicolors") -- colorscheme

	use("jacoborus/tender.vim") -- colorscheme

	use("savq/melange") -- colorscheme

	use("tanvirtin/monokai.nvim") -- colorscheme

	use("catppuccin/nvim") -- colorscheme

    use({
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
        end
    })

    use("simrat39/symbols-outline.nvim")

-- ============================================================================ --
-- ===                             ESENTIAL                                 === --
-- ============================================================================ --

	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

    -- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

    -- maximizes and restores current window
    use("szw/vim-maximizer")

    -- nerd tree file explorer
	use("preservim/nerdtree")

	-- nerd tree visual
	use("tiagofumo/vim-nerdtree-syntax-highlight")

	-- vs-code like icons
	use("ryanoasis/vim-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- grammar checking because I can't english
	use("rhysd/vim-grammarous")

	-- browse in vim
	use("tyru/open-browser.vim")

	--todo comments
	use("folke/todo-comments.nvim")

	-- see definitions
	use("liuchengxu/vista.vim")

    -- note taking
    use("nvim-neorg/neorg")

      use({
        "ray-x/sad.nvim",
        requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
        config = function()
          require("sad").setup{}
        end,
      })

-- ============================================================================ --
-- ===                             LANGUAGES                                === --
-- ============================================================================ --

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- C/C++
	use("MaskRay/ccls")
	use("bfrg/vim-cpp-modern")
	use({ "neoclide/coc.nvim", branch = "release" })
	use("deoplete-plugins/deoplete-clang")
	use("p00f/clangd_extensions.nvim")

	--LSP
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-lsputils")
	use({ "nvim-lua/lsp-status.nvim" })

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
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	})

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	--debugging
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
    use("folke/which-key.nvim")
    use("folke/trouble.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

    -- LSP progress handler UI
    use("j-hui/fidget.nvim")

-- ============================================================================ --
-- ===                                ESTHETICS                             === --
-- ============================================================================ --

	-- coding style helper
	use("gpanders/editorconfig.nvim")

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
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

    -- tab line
    use("akinsho/bufferline.nvim")

    -- simple lsp coloring
    use("folke/lsp-colors.nvim")

    use({
        'Kasama/nvim-custom-diagnostic-highlight',
        config = function()
            require('nvim-custom-diagnostic-highlight').setup({})
        end
    })
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)
