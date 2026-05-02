return {
    -- Auto-pairs: Automatically closes brackets, quotes, etc. as you type.
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

    -- Dial: Enhanced increment/decrement functionality.
    -- Can increment things like dates, hex colors, and toggles in addition to numbers.
    {
        "monaqa/dial.nvim",
        keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },

    -- TreeSJ: Smart toggling between "split" (multi-line) and "join" (single-line) code blocks.
    -- Uses Treesitter to understand code structure.
    {
        "Wansmer/treesj",
        keys = {
            { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    -- CSV View: Improved viewing of CSV and TSV files with aligned columns.
    {
        'hat0uma/csvview.nvim',
        ft = {'csv', 'tsv'},
        config = function()
            require('csvview').setup()
        end
    }
}
