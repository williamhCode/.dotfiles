local map = vim.keymap.set
local exec_cmd = require("utils.toggleterm").exec_cmd
local convert_build_cmd = require("utils.toggleterm").convert_build_cmd
local convert_run_cmd = require("utils.toggleterm").convert_run_cmd

local M = {}

local opts = { buffer = true }

M.set_build_command = function(cmd)
    map('n', "<leader>b", function()
        exec_cmd({
            cmd = convert_build_cmd(cmd),
            open = false
        })
        print("Building ...")
    end, opts)

    map('n', "<leader>B", function()
        exec_cmd(cmd)
    end, opts)
end

M.set_run_command = function(cmd)
    map('n', "<leader>r", function()
        exec_cmd({
            cmd = convert_run_cmd(cmd),
            open = false
        })
    end, opts)

    map('n', "<leader>R", function()
        exec_cmd(cmd)
    end, opts)
end

return M
