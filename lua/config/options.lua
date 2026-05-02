local options = {
    backup = false,                          -- Creates a backup file.
    clipboard = "unnamedplus",               -- Allows Neovim to access the system clipboard.
    cmdheight = 2,                           -- More space in the Neovim command line for messages.
    fileencoding = "utf-8",                  -- The encoding written to a file.
    ignorecase = true,                       -- Ignore case in search patterns.
    mouse = "a",                             -- Allow the mouse to be used in Neovim.
    smartcase = true,                        -- Don't ignore case if search pattern contains uppercase.
    smartindent = true,                      -- Make indenting smarter again.
    expandtab = true,                        -- Convert tabs to spaces.
    showtabline = 2,                         -- Always show tabs.
    shiftwidth = 4,                          -- The number of spaces inserted for each indentation.
    tabstop = 4,                             -- Insert 4 spaces for a tab.
    number = true,                           -- Set numbered lines.
    relativenumber = true,                   -- Set relative numbered lines.
    numberwidth = 4,                         -- Set number column width to 4 {default 4}.
    wrap = false,                            -- Display lines as one long line.
}

-- Append 'c' to shortmess to hide "match x of y" messages in completion menu.
vim.opt.shortmess:append "c"

-- Apply options from the table above.
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Allow cursor to wrap around lines with arrow keys or h/l.
vim.cmd "set whichwrap+=<,>,[,],h,l"

-- Restore netrw settings (built-in file explorer).
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- Diagnostics configuration: How errors and warnings appear.
vim.diagnostic.config({
    virtual_text = true,     -- Show error message on the same line.
    signs = true,            -- Show icon in the gutter.
    update_in_insert = false,-- Don't update diagnostics while typing.
    underline = true,        -- Underline the problematic code.
    severity_sort = false,   -- Sort by severity.
    float = true,            -- Show diagnostic in floating window.
})

-- Colorscheme: Apply theme with a safe wrapper to prevent startup crashes.
local function safe_colorscheme(name)
    local success, err = pcall(vim.cmd, "colorscheme " .. name)
    if not success then
        vim.notify("Error loading colorscheme " .. name .. "\n" .. err, vim.log.levels.ERROR)
    end
end

safe_colorscheme("kanagawa")
