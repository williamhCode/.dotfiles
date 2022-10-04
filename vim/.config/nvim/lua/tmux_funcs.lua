local nnoremap = require('keymap').nnoremap

local M = {}

local function create_tmux_split()
    local cmd = 'tmux split-window -h -l 32% -P -F "#{pane_id}" && tmux last-pane'
    local out = vim.fn.system(cmd)
    -- remove newline
    vim.env.TMUX_SPLIT_ID = string.gsub(out, "[\r\n]", "")
end

local function unzoom_tmux_pane()
    local cmd = "tmux list-panes -F '#F' | grep -q Z" .. " 2>/dev/null && echo"
    local out = vim.fn.system(cmd)
    if out ~= '' then
        vim.fn.system("tmux resize-pane -Z")
    end
end

local function create_tmux_split_if_nil()
    if vim.env.TMUX_SPLIT_ID == nil then
        create_tmux_split()
    else
        local cmd = "tmux has-session -t " .. vim.env.TMUX_SPLIT_ID .. " 2>/dev/null && echo"
        local out = vim.fn.system(cmd)
        if out == '' then
            create_tmux_split()
        end
    end
end
M.create_tmux_split_if_nil = create_tmux_split_if_nil

M.create_tmux_send_cmd = function(mapping, cmds)
    nnoremap(mapping, function()
        unzoom_tmux_pane()
        create_tmux_split_if_nil()
        local _cmds = cmds()
        local cmd
        if type(_cmds) == "table" then
            cmd = ""
            for i, curr_cmd in ipairs(_cmds) do
                cmd = cmd .. curr_cmd
                if i < #_cmds then
                    cmd = cmd .. " && echo && "
                end
            end
        else
            cmd = _cmds
        end
        require("harpoon.tmux").sendCommand(vim.env.TMUX_SPLIT_ID, cmd .. "\n")
    end)
end

return M
