local map = vim.keymap.set

M = {}

M.on_attach = function(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = group,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = group,
        })
    end

    local bufopts = { buffer = bufnr }
    map('n', "gd", function() vim.lsp.buf.definition() end, bufopts)
    map('n', "gD", function() vim.lsp.buf.declaration() end, bufopts)
    map('n', "gh", function() vim.lsp.buf.hover() end, bufopts)
    map('n', "gs", function() vim.lsp.buf.signature_help() end, bufopts)
    map('n', "gr", function() vim.lsp.buf.references() end, bufopts)
    map('n', "<leader>lf", function() vim.diagnostic.open_float() end, bufopts)
    map('n', "<leader>lca", function() vim.lsp.buf.code_action() end, bufopts)
    map('n', "<leader>lrn", function() vim.lsp.buf.rename() end, bufopts)
    map('n', "[d", function() vim.diagnostic.goto_prev() end, bufopts)
    map('n', "]d", function() vim.diagnostic.goto_next() end, bufopts)
    map('n', "<A-F>", function() vim.lsp.buf.format({ async = true }) end, bufopts)
end

return M
