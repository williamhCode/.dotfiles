local map = vim.keymap.set
local exec_cmd = require("utils.toggleterm").exec_cmd
local convert_build_cmd = require("utils.toggleterm").convert_build_cmd
local convert_run_cmd = require("utils.toggleterm").convert_run_cmd

local M = {}

M.set_build_command = function(cmd)
    map('n', "<leader>b", function()
        exec_cmd({
            cmd = convert_build_cmd(cmd),
            open = false
        })
        print("Building ...")
    end, { buffer = true })

    map('n', "<leader>B", function()
        exec_cmd(cmd)
    end, { buffer = true })
end

M.set_run_command = function(cmd)
    map('n', "<leader>r", function()
        exec_cmd({
            cmd = convert_run_cmd(cmd),
            open = false
        })
    end, { buffer = true })

    map('n', "<leader>R", function()
        exec_cmd(cmd)
    end, { buffer = true })
end

return M
