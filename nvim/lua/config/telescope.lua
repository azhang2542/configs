local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

-- Function to save all selected buffers
local save_selected_buffers = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")

	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local multi_selection = current_picker:get_multi_selection()

	if vim.tbl_isempty(multi_selection) then
		multi_selection = { action_state.get_selected_entry() }
	end

	-- Loop through each selected buffer and save
	for _, entry in ipairs(multi_selection) do
		vim.api.nvim_buf_call(entry.bufnr, function()
			vim.cmd("write")
		end)
	end

	-- not working as expected
	-- local finder = current_picker.finder
	-- current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
	actions.close(prompt_bufnr)
end

telescope.setup({
	defaults = {
		mappings = {
			["n"] = {
				["t"] = { actions.select_tab, type = "action" },
				['"'] = { actions.select_vertical, type = "action" },
				["%"] = { actions.select_horizontal, type = "action" },
			},
		},
		file_ignore_patterns = {
			".git/",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		buffers = {
			mappings = {
				["n"] = {
					["d"] = { actions.delete_buffer, type = "action" },
					["<C-S>"] = { save_selected_buffers, type = "action" },
				},
			},
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
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help" })
vim.keymap.set("n", "<leader>fd", ":Telescope file_browser<CR>", { desc = "Telescope file browser" })
vim.keymap.set(
	"n",
	"<leader>f.",
	":Telescope file_browser path=%:p:h<CR>",
	{ desc = "Telescope current buffer directory" }
)

vim.keymap.set(
	"n",
	"<leader>gr",
	builtin.lsp_references,
	{ desc = "Telescope references", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>gd",
	builtin.lsp_definitions,
	{ desc = "Telescope definitions", noremap = true, silent = true }
)
