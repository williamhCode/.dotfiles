local nnoremap = require('keymap').nnoremap
local xnoremap = require('keymap').xnoremap
local create_tmux_split_if_nil = require('tmux_funcs').create_tmux_split_if_nil


nnoremap("<leader>f", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<C-_>", "<C-^>")

-- tmux pane
nnoremap("<leader>t", function()
    create_tmux_split_if_nil()
    require("harpoon.tmux").gotoTerminal(vim.env.TMUX_SPLIT_ID)
end)


-- nvim tree
-- nnoremap("<leader>e", function() require('nvim-tree').toggle() end)

-- quickfix shortcuts
nnoremap("<leader>k", "<cmd>cnext<CR>zz")
nnoremap("<leader>j", "<cmd>cprev<CR>zz")


-- commenting
nnoremap("<M-/>", "<Plug>(comment_toggle_linewise_current)")
xnoremap("<M-/>", "<Plug>(comment_toggle_linewise_visual)")


-- harpoon config
local silent = { silent = true }
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, silent)
for i = 1, 9 do
    nnoremap(string.format("<leader>%d", i), function() require("harpoon.ui").nav_file(i) end, silent)
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


nnoremap("<C-p>", ":Telescope<CR>")
nnoremap("<leader>sf", better_find_files)
nnoremap("<leader>sg", require("telescope.builtin").live_grep)
nnoremap("<leader>sb", require("telescope.builtin").buffers)
nnoremap("<leader>so", require("telescope.builtin").oldfiles)
-- nnoremap("<leader>sh", ":Telescope harpoon marks<CR>")
