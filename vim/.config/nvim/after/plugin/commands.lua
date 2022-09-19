local nnoremap = require('keymap').nnoremap

local function create_tmux_split()
    local cmd = 'tmux split-window -h -l 32% -P -F "#{pane_id}"'
    local out = vim.fn.system(cmd)
    -- remove newline
    vim.env.TMUX_SPLIT_ID = string.gsub(out, "[\r\n]", "")
end

local function create_tmux_split_if_nil()
    if vim.env.TMUX_SPLIT_ID == nil then
        create_tmux_split()
    else
        local cmd = "tmux has-session -t " .. vim.env.TMUX_SPLIT_ID .. " 2>/dev/null && echo exists"
        local out = vim.fn.system(cmd)
        if out == '' then
            create_tmux_split()
        end
    end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.py" },
    callback = function()
        nnoremap("<leader>r", function()
            create_tmux_split_if_nil()
            require("harpoon.tmux").gotoTerminal(vim.env.TMUX_SPLIT_ID)
            local command = "python " .. vim.fn.expand('%') .. "\n"
            require("harpoon.tmux").sendCommand(vim.env.TMUX_SPLIT_ID, command)
        end, {})
    end
})

nnoremap("<leader>t", function()
    create_tmux_split_if_nil()
    require("harpoon.tmux").gotoTerminal(vim.env.TMUX_SPLIT_ID)
end)

vim.api.nvim_create_user_command("Term", function()
    create_tmux_split_if_nil()
end, {})
