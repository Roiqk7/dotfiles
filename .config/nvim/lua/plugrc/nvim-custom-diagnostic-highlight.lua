local unused_handler = require('nvim-custom-diagnostic-highlight').setup {
  register_handler = false,
  diagnostic_handler_namespace = 'unused_handler'
}
local import_handler = require('nvim-custom-diagnostic-highlight').setup {
  register_handler = false,
  highlight_group = 'MyCustomHighlightGroup',
  patterns_override = { 'import' },
  diagnostic_handler_namespace = 'import_handler'
}

vim.cmd [[highlight MyCustomHighlightGroup ctermfg=168 ctermbg=16 guifg=#e06c75 guibg=#282c34]]

vim.diagnostic.handlers['my/unused'] = unused_handler
vim.diagnostic.handlers['my/import'] = import_handler
