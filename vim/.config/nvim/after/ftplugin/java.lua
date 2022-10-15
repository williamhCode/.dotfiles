local nnoremap = require('keymap').nnoremap
local tmux_send_cmd = require('tmux_funcs').tmux_send_cmd
local resolve_spaces = require('utils').resolve_spaces

if vim.fn.filereadable("build.gradle") == 1 then
    nnoremap("<leader>r", function()
        local command = {
            "./gradlew assemble",
            "java -jar " .. vim.fn.resolve("build/libs/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".jar")
        }
        tmux_send_cmd(command)
    end)

    -- test java
    nnoremap("<leader>R", function()
        local command = {
            "./gradlew build",
            "java -jar " .. vim.fn.resolve("build/libs/" .. string.match(vim.fn.getcwd(), "/(%w+)$") .. ".jar")
        }
        tmux_send_cmd(command)
    end)

    -- build
    nnoremap("<leader>b", function()
        local command = "./gradlew assemble"
        tmux_send_cmd(command)
    end)

    -- test
    nnoremap("<leader>B", function()
        local command = "./gradlew build"
        tmux_send_cmd(command)
    end)
else
    nnoremap("<leader>R", function()
        local command = "java " .. resolve_spaces(vim.fn.expand('%:p'))
        tmux_send_cmd(command)
    end)

    nnoremap("<leader>r", function()
        local command = "java " .. resolve_spaces(vim.fn.expand('%:t:r'))
        tmux_send_cmd(command)
    end)

    nnoremap("<leader>b", function()
        local command = "javac " .. resolve_spaces(vim.fn.expand('%:p'))
        tmux_send_cmd(command)
    end)
end
