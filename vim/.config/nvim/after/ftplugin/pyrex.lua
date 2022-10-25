local nnoremap = require('keymap').nnoremap
local tmux_send_cmd = require('tmux_funcs').tmux_send_cmd

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         vim.cmd("silent! !find . -name '*.pyx' -exec ctags {} +")
--     end
-- })

nnoremap("<leader>b", function()
    local command = "python setup.py"
    tmux_send_cmd(command)
end)

