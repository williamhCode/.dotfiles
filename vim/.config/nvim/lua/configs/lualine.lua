local c = require('onedark.colors')
local custom_onedark = require('lualine.themes.onedark')
custom_onedark.normal.c.fg = c.fg

require('lualine').setup({
    options = {
        theme = custom_onedark
    }
})

