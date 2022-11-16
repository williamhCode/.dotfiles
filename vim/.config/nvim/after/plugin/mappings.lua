local map = vim.keymap.set
local create_tmux_split_if_nil = require("utils.tmux").create_tmux_split_if_nil


map('n', "<leader>f", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map('x', "<leader>f", '"fy:%s/<C-r>f/<C-r>f/gI<Left><Left><Left>')
map('n', "<C-_>", "<C-^>")


-- tmux pane
map('n', "<leader>t", function()
    create_tmux_split_if_nil()
    require("harpoon.tmux").gotoTerminal(vim.env.TMUX_SPLIT_ID)
end)


-- nvim tree
-- map('n', "<leader>e", function() require('nvim-tree').toggle() end)

-- quickfix shortcuts
map('n', "<leader>k", "<cmd>cnext<CR>zz")
map('n', "<leader>j", "<cmd>cprev<CR>zz")


-- commenting
map('n', "<M-/>", "<Plug>(comment_toggle_linewise_current)")
map('x', "<M-/>", "<Plug>(comment_toggle_linewise_visual)")


-- harpoon config
local silent = { silent = true }
map('n', "<leader>a", function() require("harpoon.mark").add_file() end, silent)
map('n', "<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, silent)
for i = 1, 9 do
    map('n', string.format("<leader>%d", i), function() require("harpoon.ui").nav_file(i) end, silent)
end


-- telescope config
local function better_find_files(opts)
    opts = opts or {}
    -- we only want to do it if we have a gitignore and no .git dir
    if vim.fn.filereadable(".gitignore") == 1 and vim.fn.isdirectory(".git/") == 0 then
        opts.find_command = { "rg", "--files", "--ignore-file", ".gitignore" }
    end
    require("telescope.builtin").find_files(opts)
end

map('n', "<C-p>", ":Telescope<CR>")
map('n', "<leader>sf", better_find_files)
map('n', "<leader>sg", function() require("telescope.builtin").live_grep({ hidden = true }) end)
map('n', "<leader>sb", function() require("telescope.builtin").buffers() end)
map('n', "<leader>so", function() require("telescope.builtin").oldfiles() end)
-- map('n', "<leader>sh", ":Telescope harpoon marks<CR>")

-- tmux navigator
vim.keymap.set('n', "<C-h>", '<CMD>NavigatorLeft<CR>')
vim.keymap.set('n', "<C-l>", '<CMD>NavigatorRight<CR>')
vim.keymap.set('n', "<C-k>", '<CMD>NavigatorUp<CR>')
vim.keymap.set('n', "<C-j>", '<CMD>NavigatorDown<CR>')
-- vim.keymap.set('n', "<A-p>", '<CMD>NavigatorPrevious<CR>')

