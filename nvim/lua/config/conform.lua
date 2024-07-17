local conform = require("conform")

conform.setup({
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 3000,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "ruff" },
		json = { "jq" },
		["_"] = { "trim_whitespace" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
