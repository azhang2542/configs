local catppuccin = require("catppuccin")

catppuccin.setup({
	no_italic = true,
	integrations = {
		alpha = true,
		gitsigns = true,
		neotree = true,
		native_lsp = {
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
	},
})

vim.cmd.colorscheme("catppuccin")
