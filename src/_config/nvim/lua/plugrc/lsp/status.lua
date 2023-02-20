-- import lsp status safely
local status, lsp_status = pcall(require, "lsp-status")
if not status then
  return
end

-- import lsp config safely
local status2, lsp_config = pcall(require, "lsp-config")
if not status2 then
  return
end

lsp_status.register_progress()

lsp_config.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

lsp_config.lua_ls.setup({
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
})

lsp_config.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
