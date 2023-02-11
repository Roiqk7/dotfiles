-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
  return
end

local on_attach = function(client, buffer)
    _ = client;
    vim.diagnostic.config({
        virtual_text = false,
        float = { scope = "line", severity_sort = true, source = "if_many" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
    })

    local function set_option(...)
        vim.api.nvim_buf_set_option(buffer, ...)
    end

    set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- config that activates keymaps and enables snippet support
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    capabilities = cmp.default_capabilities(capabilities)

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

-- lsp-install
local function setup_servers()
    local lsp_servers = {
        "bashls",
        "clangd",
        "jsonls",
        "sumneko_lua",
        "rust_analyzer",
        "zls",
    }

    for _, server in pairs(lsp_servers) do
        local config = make_config()
        local settings = require("plugrc.lsp.settings")

        -- language specific config
        if server == "clangd" then
            local clangd_settings = settings.clangd_setting
            config.cmd = clangd_settings.cmd
            config.filetypes = clangd_settings.filetypes
        end

        if server == "sumneko_lua" then
            local lua_settings = settings.lua_settings
            config.cmd = lua_settings.cmd
            config.settings = lua_settings.settings
        end
        -- TODO:
        -- if server == "rust_analyzer" then
        --    local rust_settings = settings.rust_analyzer_settings
        --    config.cmd = rust_settings.cmd
        --    config.settings = rust_settings.settings
        -- end
    end
end

setup_servers()
