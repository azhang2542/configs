local telescope = require("telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        },
    },
    extensions = {
        file_browser = {
            hidden = true,
            mapping = {
                ["n"] = {
                    ["c"] = { fb_actions.create, desc = "telescope file browser|create"},
                    ["r"] = { fb_actions.rename, desc = "telescope file browser|rename"},
                }
            }
        }
    }
}

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

-- keybinds
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Telescope grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Telescope buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope help"})
vim.keymap.set('n', '<leader>fd', ":Telescope file_browser<CR>", {desc = "Telescope file browser"})
