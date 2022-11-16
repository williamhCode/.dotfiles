local map = vim.keymap.set
local tmux_send_cmd = require("utils.tmux").tmux_send_cmd
local resolve_spaces = require('utils').resolve_spaces

map('n', "<leader>r", function()
    local command = "python " .. resolve_spaces(vim.fn.resolve(vim.fn.expand('%:p')))
    tmux_send_cmd(command)
end)

map('n', "<leader>b", function()
    local command = "python setup.py"
    tmux_send_cmd(command)
end)

