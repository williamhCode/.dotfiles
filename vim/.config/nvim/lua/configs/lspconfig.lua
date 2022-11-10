local Remap = require("keymap")
local nnoremap = Remap.nnoremap

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            local bufopts = { buffer = bufnr }
            nnoremap("gd", function() vim.lsp.buf.definition() end, bufopts)
            nnoremap("gD", function() vim.lsp.buf.declaration() end, bufopts)
            nnoremap("gh", function() vim.lsp.buf.hover() end, bufopts)
            nnoremap("gs", function() vim.lsp.buf.signature_help() end, bufopts)
            nnoremap("gr", function() vim.lsp.buf.references() end, bufopts)
            nnoremap("<leader>lf", function() vim.diagnostic.open_float() end, bufopts)
            nnoremap("<leader>lca", function() vim.lsp.buf.code_action() end, bufopts)
            nnoremap("<leader>lrn", function() vim.lsp.buf.rename() end, bufopts)
            nnoremap("[d", function() vim.diagnostic.goto_prev() end, bufopts)
            nnoremap("]d", function() vim.diagnostic.goto_next() end, bufopts)
            nnoremap("<A-F>", function() vim.lsp.buf.format({ async = true }) end, bufopts)
        end,
    }, _config or {})
end

-- lsp setups
require("lspconfig").pyright.setup(config({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoImportCompletions = false,

                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            }
        }
    },
}))

require("lspconfig").ccls.setup(config())

require("lspconfig").vimls.setup(config())

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

require("lspconfig").sumneko_lua.setup(config({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}))

require("lspconfig").jdtls.setup(config({
    settings = {
        java = {
            signatureHelp = {
                enabled = true,
                description = { enabled = false }
            },
        }
    }
}))

local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/williamhou/.local/share/nvim/mason/bin/omnisharp-mono"
require("lspconfig").omnisharp_mono.setup(config({
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
}))

-- require("lspconfig").omnisharp.setup(config())

-- UI
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
