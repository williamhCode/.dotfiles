local set = vim.keymap.set

vim.opt_local.scrolloff = 0
vim.opt_local.sidescrolloff = 0

-- reset <C-u> and <C-d> to default
local opts = { buffer = true }
set('n', '<C-u>', '<C-u>', opts)
set('n', '<C-d>', '<C-d>', opts)
