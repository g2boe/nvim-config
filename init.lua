require("config.lazy")
require("config.telescope")
require("config.options")
require("config.netrw")

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

vim.cmd("colorscheme kanagawa")

-- Global mappings for LSP features
-- Use <leader> followed by a key
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})


local cmp = require("cmp")

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' } -- Source completions from the language server
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item
    }),
})
