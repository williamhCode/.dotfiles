local set_build_command = require("utils.terminal").set_build_command

set_build_command("python setup.py build_ext --inplace")

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         vim.cmd("silent! !find . -name '*.pyx' -exec ctags {} +")
--     end
-- })

