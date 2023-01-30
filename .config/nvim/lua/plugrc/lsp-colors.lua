-- import lsp-colors plugin safely
local status, lsp_colors = pcall(require, "lsp-colors")
if not status then
    return
end

lsp_colors.setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
