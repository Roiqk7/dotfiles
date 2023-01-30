-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

-- import safely
local parsers_status, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status then
    return
end

-- configure treesitter
treesitter.setup({
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "c_sharp",
        "llvm",
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
    ignore_install = { "cmake", "css", "haskell", "html", "javascript", "perl", "php", "python", "ruby", "typescript" },
    highlight = {
        enabsle = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    autopairs = { enable = true },
})

-- important for proper treesitter compilation
local parser_configs = parsers.get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
        use_makefile = true,
        cxx_standard = "c++-17"
    },
}

for _, parser in ipairs(parsers.get_parser_configs()) do
    parser.install_info.use_makefile = true
end
