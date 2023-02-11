-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

local kind_icons = {
    Text = " ",
    Function = "",
    Method = "",
    Constructor = "",
    Field = " ",
    Variable = "﬚ ",
    Class = "ﴯ",
    Interface = "",
    Module = " ",
    Property = " ",
    Unit = "",
    Value = "",
    Enum = "",
    EnumMember = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    Constant = " ",
    Struct = " ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
    { name = "emoji" },
    { name = "neorg" }
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                emoji = "[Emoji]",
                neorg = "[Neorg]",
                spell = "[Spell]",
            })[entry.source.name]
            return vim_item
        end,
  },
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
})

-- Set up lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["clangd"].setup({
  capabilities = capabilities
})
require("lspconfig")["sumneko_lua"].setup({
  capabilities = capabilities
})
require("lspconfig")["rust_analyzer"].setup({
  capabilities = capabilities
})
