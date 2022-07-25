-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').pyright.setup {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'off'
            }
        }
    },
    capabilities = capabilities
}

require('lspconfig').ccls.setup {
    capabilities = capabilities,
}

require('lspconfig').sumneko_lua.setup {
    capabilities = capabilities,
}

