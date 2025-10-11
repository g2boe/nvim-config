require("config.lazy")
require("nvim-tree-config")
require("options")
-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    -- file_browser = {
    --   theme = "ivy",
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    --   mappings = {
    --     ["i"] = {
    --       -- your custom insert mode mappings
    --     },
    --     ["n"] = {
    --       -- your custom normal mode mappings
    --     },
    --   },
    -- },
  },
  -- defaults = {
  --     initial_mode = "normal"
  -- }
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
-- require("telescope").load_extension "file_browser"
--
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})

vim.cmd("colorscheme kanagawa")

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = 'Telescope help tags' })

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
