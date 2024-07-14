local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			["n"] = {
				["t"] = { actions.select_tab, type = "action" },
                -- binding it as '"' does not work ):
				["v"] = { actions.select_vertical, type = "action" },
				["%"] = { actions.select_horizontal, type = "action" },
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			hidden = true,
			mapping = {
				["n"] = {
					["c"] = { fb_actions.create, desc = "telescope file browser|create" },
					["r"] = { fb_actions.rename, desc = "telescope file browser|rename" },
				},
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help" })
vim.keymap.set("n", "<leader>fd", ":Telescope file_browser<CR>", { desc = "Telescope file browser" })
