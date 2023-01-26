local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = require("utils.lsp").on_attach,
    }, _config or {})
end

-- lsp setups ----------------------------------
local setup = function (language_server, opts)
    require("lspconfig")[language_server].setup(config(opts))
end

-- lua
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

require("neodev").setup()

setup("sumneko_lua", {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                -- path = runtime_path,
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
})

-- python
setup("pyright", {
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
})

-- latex
setup("texlab")

-- c/c++
setup("clangd")

-- vim
setup("vimls")


-- unity omnisharp
local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/williamhou/.local/share/nvim/mason/bin/omnisharp-mono"
setup("omnisharp_mono", {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
})


-- UI ----------------------------------------------------------
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

