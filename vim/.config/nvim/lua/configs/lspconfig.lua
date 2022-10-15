local Remap = require("keymap")
local nnoremap = Remap.nnoremap

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = false

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("gD", function() vim.lsp.buf.declaration() end)
            nnoremap("gh", function() vim.lsp.buf.hover() end)
            nnoremap("gs", function() vim.lsp.buf.signature_help() end)
            nnoremap("gr", function() vim.lsp.buf.references() end)
            nnoremap("<leader>df", function() vim.diagnostic.open_float() end)
            nnoremap("<leader>dca", function() vim.lsp.buf.code_action() end)
            nnoremap("<leader>drn", function() vim.lsp.buf.rename() end)
            nnoremap("[d", function() vim.diagnostic.goto_prev() end)
            nnoremap("]d", function() vim.diagnostic.goto_next() end)
            nnoremap("<A-f>", function() vim.lsp.buf.format({ async = true }) end)
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

require("lua-dev").setup({
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
