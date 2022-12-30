local map = vim.keymap.set

-- set glsl filetype
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.vert", "*.frag" },
    callback = function()
        vim.bo.filetype = "glsl"
    end
})

-- pyrex file switching
local create_fileswitch_map = function(extensions)
    local create_autocmd = function(patterns)
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*" .. patterns[1],
            callback = function()
                local path_root = vim.fn.expand('%:r')
                local file_exists = vim.fn.filereadable(path_root .. patterns[2])
                if file_exists == 1 then
                    map('n', "<leader>-", ":edit " .. path_root .. patterns[2] .. "<CR>",
                        { silent = true, buffer = true })
                end
            end
        })
    end
    create_autocmd(extensions)
    create_autocmd({ extensions[2], extensions[1] })
end

create_fileswitch_map({ ".pyx", ".pxd" })
create_fileswitch_map({ ".vert", ".frag" })

-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = "#61afef", bg = "#3b3f4c", bold = false, italic = false })
