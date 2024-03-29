local map = vim.keymap.set

M = {}

M.on_attach = function(client, bufnr)
    if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {
            ui = {
                -- border = "rounded",
                close_events = { "CursorMoved", "CursorMovedI", "InsertCharPre" },
            },
            keymaps = {
                next_signature = "<M-n>",
                previous_signature = "<M-p>",
                next_parameter = nil,
                previous_parameter = nil,
            },
        })
    end

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

    local opts = { buffer = bufnr }
    map('n', "gd", function() vim.lsp.buf.definition() end, opts)
    map('n', "gD", function() vim.lsp.buf.declaration() end, opts)
    map('n', "gh", function() vim.lsp.buf.hover() end, opts)
    map('n', "gs", function() vim.lsp.buf.signature_help() end, opts)
    map('i', "<M-x>", function() vim.lsp.buf.signature_help() end, opts)
    map('n', "gr", function() vim.lsp.buf.references() end, opts)
    map('n', "<leader>lf", function() vim.diagnostic.open_float() end, opts)
    if client.name ~= "texlab" then
        map('n', "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
        map('n', "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    end
    map('n', "[d", function() vim.diagnostic.goto_prev() end, opts)
    map('n', "]d", function() vim.diagnostic.goto_next() end, opts)
    map({ 'n', 'v' }, "<M-F>", function() vim.lsp.buf.format({ async = true }) end, opts)
end

return M
