return {
    -- Telescope: A highly extensible fuzzy finder over lists.
    -- Used for finding files, searching text, and browsing symbols.
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Gitsigns: Adds git decorations to the gutter (signs for added/changed/deleted lines).
    -- Also provides integration for staging/hunk navigation.
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {}
        end
    },

    -- Fugitive: The "best" Git wrapper for Vim. 
    -- Provides :G or :Git commands for seamless version control within the editor.
    {
        'tpope/vim-fugitive',
        cmd = { "G", "Git" },
    },

    -- Which-key: Displays a popup with possible keybindings when you start typing a command.
    -- Helps you remember your own shortcuts.
    { "folke/which-key.nvim", lazy = true },
}
