local nnoremap = require('keymap').nnoremap
local create_tmux_split_if_nil = require('tmux_funcs').create_tmux_split_if_nil

nnoremap("<leader>t", function()
    create_tmux_split_if_nil()
    require("harpoon.tmux").gotoTerminal(vim.env.TMUX_SPLIT_ID)
end)

vim.api.nvim_create_user_command("Term", function()
    create_tmux_split_if_nil()
    require("harpoon.tmux").gotoTerminal(vim.env.TMUX_SPLIT_ID)
end, {})


-- nvim tree
nnoremap("<leader>e", function() require('nvim-tree').toggle() end)

