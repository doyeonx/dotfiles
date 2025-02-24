local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

-- enable mason and configure icons
mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "pyright",
        "jsonls",
        "html",
        "bashls",
        "lua_ls",
        "dockerls",
    },
})
