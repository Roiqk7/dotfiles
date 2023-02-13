-- import lsp-setup plugin safely
local status, lsp_setup = pcall(require, "lsp-setup")
if not status then
    return
end

-- import lua-dev plugin safely
local lua_dev_status, lua_dev = pcall(require, "neodev")
if not lua_dev_status then
    return
end

lsp_setup.setup({
    on_attach = function()
        require("lsp-setup.utils").format_on_save(client)
    end,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- Configuration of LSP servers
    -- Install LSP servers automatically
    -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    servers = {
        -- C/C++
        clangd = require("lsp-setup.clangd_extensions").setup({}),
        -- Lua
        lua_ls = lua_dev.setup({
            lspconfig = {
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                        }
                    }
                }
            },
        }),
        -- Rust
        rust_analyzer = require('lsp-setup.rust-tools').setup({
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        }),
    },
})

