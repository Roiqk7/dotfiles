-- import lsp-config plugin safely
local status, lsp_config = pcall(require, "lspconfig")
if not status then
    return
end

lsp_config["clangd"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

lsp_config["sumneko_lua"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

lsp_config["rust_analyzer"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

-- fixes clan bug
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })