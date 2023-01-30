-- import mason plugin safely
local status, mason = pcall(require, "mason")
if not status then
    return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = { "clangd", "sumneko_lua", "rust_analyzer" },
})
