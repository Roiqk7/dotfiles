require("utils")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- map the following keys after the language server attaches to a buffer
-- See `:help vim.lsp.*` for documentation on any of the below functions
autocmd({ 'LspAttach' }, {
    callback = function(args)
        local opts = { buffer = args.buf }

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            map('n', 'K', vim.lsp.buf.hover, opts)
        end
        if client.server_capabilities.definitionProvider then
            map("n", "<leader>fa", vim.lsp.buf.definition, opts)
        end
        if client.server_capabilities.typeDefinitionProvider then
            map("n", "<leader>td", vim.lsp.buf.type_definition, opts)
        end
        if client.server_capabilities.referencesProvider then
            map("n", "<leader>gr", vim.lsp.buf.references, opts)
        end
        if client.server_capabilities.documentHighlightProvider then
            local bufnr = vim.api.nvim_get_current_buf()
            vim.api.nvim_set_hl(0, "LspReferenceRead", {
                link = "DiffText"
            })
            vim.api.nvim_set_hl(0, "LspReferenceText", {
                link = "IncSearch"
            })
            vim.api.nvim_set_hl(0, "LspRefDiffTexterenceWrite", {
                link = "WildMenu"
            })
            local doc_highlight = augroup("lsp_document_highlight", {
                clear = false,
            })
            local enable_highlight = function()
                autocmd({ "CursorHold", "CursorHoldI" }, {
                    group = doc_highlight,
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })
                autocmd('CursorMoved', {
                    group = doc_highlight,
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })

            end
            local disable_highlight = function()
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({
                    buffer = bufnr,
                    group = doc_highlight
                })
            end
            map("n", "<leader>dh", disable_highlight, opts)
            map("n", "<leader>eh", enable_highlight, opts)
        end
        if client.server_capabilities.documentSymbolProvider then
            map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
        end
        if client.server_capabilities.codeActionProvider then
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end
        if client.server_capabilities.documentFormattingProvider then
            map("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end
        if client.server_capabilities.documentRangeFormattingProvider then
            map("v", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end
        if client.server_capabilities.renameProvider then
            map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end
        if client.server_capabilities.callHierarchyProvider then
            map("n", "<leader>ci", vim.lsp.buf.incoming_calls, opts)
            map("n", "<leader>co", vim.lsp.buf.outgoing_calls, opts)
        end
        if client.server_capabilities.workspaceSymbolProvider then
            map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
        end

        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>sl", vim.diagnostic.setloclist, opts)
        map('n', '<leader>of', vim.diagnostic.open_float, opts)

        map("n", "<leader>wf", function()
            vim.pretty_print(vim.lsp.buf.list_workspace_folders())
        end, opts)
        map("n", "<leader>rd", function()
            print("Language server " .. (vim.lsp.buf.server_ready() and "is ready" or "is not ready"))
        end, opts)

    end,

})
