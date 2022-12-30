local map = vim.keymap.set
local exec_command = require("utils.toggleterm").exec_command
local build_cmd = require("utils.toggleterm").build_cmd

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         vim.cmd("silent! !find . -name '*.pyx' -exec ctags {} +")
--     end
-- })

map('n', "<leader>b", function()
    exec_command({
        cmd = build_cmd("python setup.py build_ext --inplace"),
        open = false
    })
    print("Building ...")
end, { buffer = true })

