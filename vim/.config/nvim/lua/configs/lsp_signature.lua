local cfg = {
    doc_lines = 0,
    fix_pos = false,
    hint_enable = false,
    handler_opts = {
        border = "rounded" -- double, rounded, single, shadow, none, or a table of borders
    },
    select_signature_key = "<M-n>"
}

-- recommended:
require('lsp_signature').setup(cfg) -- no need to specify bufnr if you don't use toggle_key
