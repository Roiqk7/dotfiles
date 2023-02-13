-- import null-ls plugin safely
local status, null_ls = pcall(require, "null-ls")
if not status then
    return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

null_ls.setup({
    sources = {
        -- completion
        null_ls.builtins.completion.luasnip,

        -- diagnostics
        -- C++
        null_ls.builtins.diagnostics.cppcheck,
        -- Lua
        null_ls.builtins.diagnostics.luacheck,
        -- Markdown
        null_ls.builtins.diagnostics.markdownlint,
        -- Zsh
        null_ls.builtins.diagnostics.zsh,

        -- formatting
        null_ls.builtins.formatting.prettier,
        -- C++
        null_ls.builtins.formatting.clang_format,
        -- Lua
        null_ls.builtins.formatting.lua_format,
        -- Rust
        null_ls.builtins.formatting.rustfmt,
        -- Markdown
        null_ls.builtins.formatting.markdownlint,

        -- Hover
        null_ls.builtins.hover.dictionary,
    },
})

mason_null_ls.setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = true,
})
