local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    fileencoding = "utf-8",
    hidden = true,
    ignorecase = true,
    mouse = "a",
    smartcase = true,
    smartindent = true,
    expandtab = true,
    showtabline = 4,
    shiftwidth = 4,
    tabstop = 4,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    wrap = false,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
