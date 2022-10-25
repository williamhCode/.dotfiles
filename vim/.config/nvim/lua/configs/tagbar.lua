vim.g.tagbar_sort = 0
vim.g.tagbar_visibility_symbols = {
    public = "+";
    protected = " ",
    -- private = "-"
}
vim.g.tagbar_width = tostring(vim.api.nvim_win_get_width(0) * 0.29)
vim.g.tagbar_autofocus = 1

-- key mappings
vim.g.tagbar_map_jump = "l"
vim.g.tagbar_map_preview = "<Tab>"
