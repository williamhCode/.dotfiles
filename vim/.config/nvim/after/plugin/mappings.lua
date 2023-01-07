local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

-- general
-- better find and replace
map('n', "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map('x', "<leader>fr", '"fy:%s/<C-r>f/<C-r>f/gI<Left><Left><Left>')

map('n', "<leader>fc", ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")
map('x', "<leader>fc", [["fy:,$s/<C-r>f/<C-r>f/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]])

map('n', "<C-_>", "<C-^>")

-- window movement
map('n', "<C-h>", '<C-w>h')
map('n', "<C-l>", '<C-w>l')
map('n', "<C-k>", '<C-w>k')
map('n', "<C-j>", '<C-w>j')

-- map('n', "<C-u>", "20<C-u>zz", { silent = true })
-- map('n', "<C-d>", "20<C-d>zz", { silent = true })
map('x', "<C-u>", "20<C-u>", { silent = true })
map('x', "<C-d>", "20<C-d>", { silent = true })

command('OP', "silent !open .", {})
command('CP', "let @+ = expand('%:p')", {})

-- tab movement
map('n', "<leader>]", "gt")
map('n', "<leader>[", "gT")

-- nvim tree
-- map('n', "<leader>e", function() require('nvim-tree').toggle() end)

-- quickfix shortcuts
map('n', "<leader>k", "<cmd>cnext<CR>zz")
map('n', "<leader>j", "<cmd>cprev<CR>zz")


-- commenting
map('n', "<M-s>/", "<Plug>(comment_toggle_linewise_current)")
map('x', "<M-s>/", "<Plug>(comment_toggle_linewise_visual)")


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
        opts.find_command = { "rg", "--files", "--glob", "--ignore-file", ".gitignore" }
    end
    require("telescope.builtin").find_files(opts)
end

map('n', "<C-p>", ":Telescope<CR>")
map('n', "<leader>sf", better_find_files)
map('n', "<leader>sg", function() require("telescope.builtin").live_grep({ hidden = true }) end)
map('n', "<leader>sb", function() require("telescope.builtin").buffers() end)
map('n', "<leader>so", function() require("telescope.builtin").oldfiles() end)
-- map('n', "<leader>sh", ":Telescope harpoon marks<CR>")
