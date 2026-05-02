return {
    -- Kanagawa: A sophisticated dark theme inspired by Japanese art.
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000, -- Load this first so other plugins can use its colors.
        opts = {},
    },

    -- Lualine: A fast and customizable statusline written in Lua.
    -- Provides info like mode, git branch, and file status at the bottom.
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'kanagawa',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- Dressing: Improves the default Neovim UI for inputs and selects.
    -- Makes things like LSP renames and code actions use nice floating windows.
    {
        "stevearc/dressing.nvim",
        opts = {},
    },

    -- Rainbow Delimiters: Colors nested brackets, parentheses, and braces.
    -- Helps visually track complex code nesting levels.
    {
        "hiphish/rainbow-delimiters.nvim",
    },

    -- ToggleTerm: A terminal manager that makes it easy to open/hide terminals.
    -- Configured here to open as a persistent floating window.
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,
                persist_size = true,
                direction = 'float',
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = 'curved',
                    winblend = 3,
                },
            })
        end
    }
}
