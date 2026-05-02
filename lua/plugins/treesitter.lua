return {
    -- Nvim-Treesitter: High-performance syntax highlighting and code analysis.
    -- Provides better coloring and structural awareness than standard Vim regex.
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Rebuild parsers when the plugin is updated.
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "lua", "vim", "vimdoc", "query", "go", "c", "cpp" },
            highlight = {
                enable = true
            },
        }
    end,
}
