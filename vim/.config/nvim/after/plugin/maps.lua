local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

-- general ------------------------------------
vim.g.mapleader = ' '
map('n', "<space>", "<nop>")

map('n', "<M-s>a", "ggVG")

map({'n', 'c'}, "<M-bs>", "<C-w>")

-- better deleting/cutting
map('n', 'd', '"_d')
map('n', 'D', '"_D')
map('x', 'd', '"_d')
map('x', 'D', '"_D')

map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('x', 'c', '"_c')
map('x', 'C', '"_C')

map('n', 'x', 'd')
map('n', 'X', 'D')
map('n', 'xx', 'dd')

-- system clipboard
map('n', '<leader>p', '"+p')
map('n', '<leader>P', '"+P')
map('x', '<leader>p', '"+p')
map('x', '<leader>P', '"+P')

map('n', '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')
map('x', '<leader>y', '"+y')
map('x', '<leader>Y', '"+Y')

map('n', "<C-_>", "<C-^>")

-- better find and replace
map('x', "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map('x', "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR>]])

map('n', "<leader>fr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map('x', "<leader>fr", 'y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

map('n', "<leader>fc", ":,$s/\\<<C-r><C-w>\\>/<C-r><C-w>/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")
map('x', "<leader>fc", [[y:,$s/<C-r>f/<C-r>"/gcI|1,''-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]])

map({'n','x'}, "<leader>cn", "*Ncgn", { remap = true })
map({'n','x'}, "<leader>cN", "*NcgN", { remap = true })

local setup_cr = function()
    map('n', "<CR>", ":nnoremap <buffer> <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z", { buffer = true })
end

map({'n', 'x'}, "<leader>cq", function ()
    setup_cr()
    vim.cmd(":norm *Nqz")
end)

-- window movement
map('n', "<C-h>", '<C-w>h')
map('n', "<C-l>", '<C-w>l')
map('n', "<C-k>", '<C-w>k')
map('n', "<C-j>", '<C-w>j')

-- better page up/down
-- map('n', "<C-u>", "20<C-u>zz", { silent = true })
-- map('n', "<C-d>", "20<C-d>zz", { silent = true })
map('x', "<C-u>", "20<C-u>", { silent = true })
map('x', "<C-d>", "20<C-d>", { silent = true })

-- commands
command('OP', "silent !open .", {})
command('CP', "let @+ = expand('%:p')", {})

-- tab movement
map('n', "<leader>]", "gt")
map('n', "<leader>[", "gT")

-- quickfix shortcuts
map('n', "<leader>k", "<cmd>cnext<CR>zz")
map('n', "<leader>j", "<cmd>cprev<CR>zz")

-- plugins ------------------------------------------
-- nvim-tree
local api = require('nvim-tree.api')
map('n', "<M-s>b", function() api.tree.toggle() end)
command('TF', function()
    local f_name = vim.fn.expand('%:p')
    api.tree.open()
    api.tree.find_file(f_name)
end, {})
command('TCB', function() api.fs.print_clipboard() end, {})

-- Comment
map('n', "<M-s>/", "<Plug>(comment_toggle_linewise_current)")
map('x', "<M-s>/", "<Plug>(comment_toggle_linewise_visual)")

-- harpoon
local silent = { silent = true }
map('n', "<leader>a", function() require("harpoon.mark").add_file() end, silent)
map('n', "<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, silent)
for i = 1, 9 do
    map('n', string.format("<leader>%d", i), function() require("harpoon.ui").nav_file(i) end, silent)
end


-- telescope
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

