return {
    -- Telescope: A highly extensible fuzzy finder over lists.
    -- Used for finding files, searching text, and browsing symbols.
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-ui-select.nvim',
            'debugloop/telescope-undo.nvim',
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            telescope.load_extension("undo")
        end
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
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        },
    },
}
