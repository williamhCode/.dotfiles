local map = vim.keymap.set
local tmux_send_cmd = require("utils.tmux").tmux_send_cmd

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         vim.cmd("silent! !find . -name '*.pyx' -exec ctags {} +")
--     end
-- })

map('n', "<leader>b", function()
    local command = "python setup.py"
    tmux_send_cmd(command)
end)

