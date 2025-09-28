local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup({
	PATH = "append",
})

mason_lspconfig.setup({
	ensure_installed = {
		-- "pyright",
		-- "lua_ls",
		-- "rust_analyzer",
	},
})

-- in_lay on_attach
local in_lay = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

-- Python
vim.lsp.config("pyright", {
	capabilities = capabilities,
})

-- Rust
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	on_attach = in_lay,
})

-- HTML
vim.lsp.config("html", {
	capabilities = capabilities,
})

-- TypeScript/JavaScript
vim.lsp.config("tsserver", {
	capabilities = capabilities,
})

-- CSS
vim.lsp.config("cssls", {
	capabilities = capabilities,
})

-- C/C++
vim.lsp.config("clangd", {
	capabilities = capabilities,
})

-- JSON
vim.lsp.config("jsonls", {
	capabilities = capabilities,
})

-- Java
vim.lsp.config("jdtls", {
	capabilities = capabilities,
})

-- LaTeX
vim.lsp.config("texlab", {
	capabilities = capabilities,
})

-- Enable all configured language servers at once
vim.lsp.enable({
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"html",
	"tsserver",
	"cssls",
	"clangd",
	"jsonls",
	"jdtls",
	"texlab",
})
