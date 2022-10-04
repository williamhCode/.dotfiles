-- set glsl filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.vert", "*.frag" },
    callback = function()
        vim.bo.filetype = "glsl"
    end
})

