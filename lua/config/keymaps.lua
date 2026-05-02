local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
keymap("n", "<leader>e", vim.cmd.Ex, { desc = "Explorer (netrw)" })

-- Telescope
local has_telescope, builtin = pcall(require, 'telescope.builtin')
if has_telescope then
    keymap("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files' })
    keymap("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope live grep' })
    keymap("n", "<leader>fb", builtin.buffers, { desc = 'Telescope buffers' })
    keymap("n", "<leader>fh", builtin.help_tags, { desc = 'Telescope help tags' })
end

-- ToggleTerm
if vim.fn.exists(":ToggleTerm") > 0 or pcall(require, "toggleterm") then
    keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal Float" })
    keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal Horizontal" })
    keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal Vertical" })
end

-- LSP Improvements
keymap("n", "<leader>rn", ":IncRename ", { desc = "Incremental Rename" })
keymap("n", "<leader>at", "<cmd>Telescope aerial<CR>", { desc = "Aerial Telescope" })

-- Better terminal navigation
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<Cmd>wincmd w<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
