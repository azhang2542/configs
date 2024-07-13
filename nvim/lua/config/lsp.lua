local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
lspconfig.pyright.setup {
    capabilities = capabilities
}
-- rust
lspconfig.rust_analyzer.setup {
    capabilities = capabilities
}
-- bash
lspconfig.bashls.setup {
    capabilities = capabilities
}
-- json
lspconfig.jsonls.setup {
    capabilities = capabilities
}
-- markdown
lspconfig.marksman.setup {
    capabilities = capabilities
}
