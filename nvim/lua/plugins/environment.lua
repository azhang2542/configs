local vim_cool = {
	"romainl/vim-cool",
}

local nvim_dev_icons = {
	"nvim-tree/nvim-web-devicons",
}

local mini = {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup({})
	end,
}

local plenary = {
	"nvim-lua/plenary.nvim",
}

local telescope = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("config.telescope")
	end,
}

local telecope_fzf_native = {
	"nvim-telescope/telescope-fzf-native.nvim",
	-- this build did not work initially and
	-- was forced to cd into .local/shared/nvim/lazy/telescope-fzf-native.nvim
	-- and evoke make command
	build = "make",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
}

local telescope_file_browser = {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
}

local gitsigns = {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({})
	end,
}

local indent_blankline = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({})
	end,
}

local diffview = {
	"sindrets/diffview.nvim",
}

local lualine = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("config.lualine")
	end,
}

local which_key = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

local notify = {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
	end,
}

return {
	vim_cool,
	plenary,
	telescope,
	telescope_file_browser,
	telecope_fzf_native,
	nvim_dev_icons,
	gitsigns,
	diffview,
	lualine,
	which_key,
	indent_blankline,
	notify,
	mini,
}
