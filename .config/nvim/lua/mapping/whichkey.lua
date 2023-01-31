-- import which-key plugin safely
local status, wk = pcall(require, "wk")
if not status then
  return
end

-- TODO: Look more into this

wk.register({
  ["jk"] = { name = "Enter insert mode" },
  ["<leader>"] = {
    b = {
      d = {":Lapag show_buf_diagnostics<CR>", "Show buffer diagnostics"},
    },
    c = {
      a = {":Lspsaga code_action<CR>", "Show code actions"},
    },
    f = {
      f = { ":Telescope find_files<CR>", "Find File" },
      d = { ":Lspsaga lsp_finder<CR>", "Get definitions and references"},
      s = { ":Telescope live_grep<CR>", "Find string" },
    },
  },
})
