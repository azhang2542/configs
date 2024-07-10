local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup {}
mason_lspconfig.setup {
    ensure_installed = {
        "pyright",
        "jsonls",
        "lua_ls",
        "marksman",
        "bashls",
    }
}

-- python
lspconfig.pyright.setup {}
-- markdown
lspconfig.marksman.setup {}
-- lua
lspconfig.lua_ls.setup {}
-- json
lspconfig.jsonls.setup {}
-- bash
lspconfig.bashls.setup {}
