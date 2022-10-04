local create_tmux_send_cmd = require('tmux_funcs').create_tmux_send_cmd
local resolve_spaces = require('utils').resolve_spaces

create_tmux_send_cmd("<leader>r", function()
    local command
    if vim.fn.filereadable("build.gradle") == 1 then
        command = {
            "./gradlew assemble",
            "java -jar " .. vim.fn.resolve("build/libs/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".jar")
        }
    else
        command = "java " .. resolve_spaces(vim.fn.expand('%:p'))
    end
    return command
end)

-- test java
create_tmux_send_cmd("<leader>R", function()
    local command
    if vim.fn.filereadable("build.gradle") == 1 then
        command = {
            "./gradlew build",
            "java -jar " .. vim.fn.resolve("build/libs/" .. string.match(vim.fn.getcwd(), "/(%w+)$") .. ".jar")
        }
    else
        command = "java " .. vim.fn.expand('%:p')
    end
    return command
end)

