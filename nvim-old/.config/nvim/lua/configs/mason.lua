require("mason").setup({
    ui = {
        border = "single",
        keymaps = {
            toggle_package_expand = "l"
        }
    },
})
require("mason-lspconfig").setup({
    -- automatic_installation = true
})
