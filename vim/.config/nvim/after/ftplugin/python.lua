local nnoremap = require('keymap').nnoremap
local tmux_send_cmd = require('tmux_funcs').tmux_send_cmd
local resolve_spaces = require('utils').resolve_spaces

nnoremap("<leader>r", function()
    local command = "python " .. resolve_spaces(vim.fn.resolve(vim.fn.expand('%:p')))
    tmux_send_cmd(command)
end)

