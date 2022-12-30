local map = vim.keymap.set
local exec_command = require("utils.toggleterm").exec_command
local build_cmd = require("utils.toggleterm").build_cmd

map('n', "<leader>r", function()
    exec_command({ cmd = "python %", open = false })
end, { buffer = true })

map('n', "<leader>R", function()
    exec_command("python %")
end, { buffer = true })

map('n', "<leader>b", function()
    exec_command({
        cmd = build_cmd("python setup.py build_ext --inplace"),
        open = false
    })
    print("Building ...")
end, { buffer = true })
