local nvim_autopairs = require("nvim-autopairs")

nvim_autopairs.setup {
    ignored_next_char = "[%w%.]",
    enable_check_bracket_line = true,
    enable_afterquote = false,
    fast_wrap = {},
}

nvim_autopairs.remove_rule('"')

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
