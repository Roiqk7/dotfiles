-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"bash",
		"c",
		"cpp",
        "c_sharp",
		"lua",
        "java",
		"json",
		"rust",
		"vim",
	},
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
	-- auto install above language parsers
	auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {"css", "haskell", "html", "javascript", "Node.js", "Perl", "python", "ruby" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	ident = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
