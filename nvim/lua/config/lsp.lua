local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup {
    PATH = "append"
}

mason_lspconfig.setup {
    ensure_installed = {
        "pyright",
        "lua_ls",
	    "rust_analyzer",
    }
}

-- lua
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}
-- python
lspconfig.pyright.setup {}
-- rust
lspconfig.rust_analyzer.setup {}
-- bash
lspconfig.bashls.setup {}
-- json
lspconfig.jsonls.setup {}
-- markdown
lspconfig.marksman.setup {}
