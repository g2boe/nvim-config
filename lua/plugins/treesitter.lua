return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- This ensures parsers are updated on plugin updates
    config = function()
        require('nvim-treesitter.config').setup {
            highlight = {
                enable = true
            },
        }
    end,
}
