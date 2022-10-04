local create_tmux_send_cmd = require('tmux_funcs').create_tmux_send_cmd
local resolve_spaces = require('utils').resolve_spaces

create_tmux_send_cmd("<leader>r", function()
    return "python " .. resolve_spaces(vim.fn.resolve(vim.fn.expand('%:p')))
end)

