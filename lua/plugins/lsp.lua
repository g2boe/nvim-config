return {
    -- Mason: Portable package manager for Neovim.
    -- Used to easily install and manage LSP servers, debuggers, and linters.
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason LSPConfig: Bridges Mason with nvim-lspconfig.
    -- Simplifies the setup of LSP servers installed via Mason.
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup({
                -- Add servers here to ensure they are installed automatically.
                ensure_installed = {
                    "gopls",
                    "lua_ls",
                    "clangd",
                    "vhdl_ls",
                    "verible",
                },
                handlers = {
                    -- Default handler: simple setup for all servers.
                    function(server_name)
                        lspconfig[server_name].setup({})
                    end,
                    -- Specialized handler for Lua (fixes "undefined global 'vim'").
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,
                }
            })
        end,
    },

    -- Nvim LSPConfig: The standard collection of configurations for the built-in LSP client.
    {
        "neovim/nvim-lspconfig",
    },

    -- Inc-Rename: Incremental LSP renaming.
    -- Shows a live preview of the rename in the buffer as you type.
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    },

    -- Aerial: A code outline window for searching and jumping to symbols.
    -- Configured to work as a Telescope extension for a fuzzy-finder feel.
    {
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup({})
            require("telescope").load_extension("aerial")
        end,
        dependencies = {
           "nvim-treesitter/nvim-treesitter",
           "nvim-tree/nvim-web-devicons"
        },
    },

    -- Nvim-Cmp: The main completion engine.
    -- Provides the popup menu for code completion.
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",   -- Buffer source for nvim-cmp
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }),
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Confirm completion with Tab instead of Enter to avoid line break conflicts.
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
            })
        end,
    },
}
