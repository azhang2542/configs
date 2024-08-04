local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup({
	PATH = "append",
})

mason_lspconfig.setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"rust_analyzer",
	},
})

-- in_lay on_attach
local in_lay = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

-- lua
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	capabilities = capabilities,
})
-- python
lspconfig.pyright.setup({
	capabilities = capabilities,
})
-- rust
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = in_lay,
})
-- html
lspconfig.html.setup({
	capabilities = capabilities,
})
-- js
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
-- css
lspconfig.cssls.setup({
	capabilities = capabilities,
})
