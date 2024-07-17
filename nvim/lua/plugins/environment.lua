local vim_cool = {
	"romainl/vim-cool",
}

local tmux_navigator = {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}

local nvim_dev_icons = {
	"nvim-tree/nvim-web-devicons",
}

local mini = {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup({})
		vim.keymap.set(
			"n",
			"<leader>z",
			require("mini.misc").zoom,
			{ desc = "zoom current buffer", noremap = true, silent = true }
		)
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
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
		})
	end,
}

local fugitive = {
	"tpope/vim-fugitive",
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
		local notify = require("notify")
		vim.notify = notify
		vim.keymap.set("n", "<leader>N", notify.dismiss, { desc = "notify dismiss" })
	end,
}

local neo_tree = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	keys = {
		{
			"<leader>t",
			":Neotree toggle<CR>",
			desc = "neo-tree toggle",
			noremap = true,
			silent = true,
		},
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					".DS_Store",
				},
				never_show = {
					".git",
				},
			},
		},
	},
}

return {
	vim_cool,
	plenary,
	telescope,
	telescope_file_browser,
	telecope_fzf_native,
	tmux_navigator,
	nvim_dev_icons,
	gitsigns,
	diffview,
	lualine,
	which_key,
	indent_blankline,
	notify,
	mini,
	neo_tree,
	fugitive,
}
