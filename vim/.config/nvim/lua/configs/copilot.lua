vim.g.copilot_filetypes = { ["*"] = false, java = true }

vim.g.copilot_no_tab_map = true
vim.cmd([[imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")]])

