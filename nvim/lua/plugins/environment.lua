local vim_cool = {
    "romainl/vim-cool"
}

local nvim_dev_icons = {
    "nvim-tree/nvim-web-devicons"
}

local plenary = {
    "nvim-lua/plenary.nvim",
}

local telescope = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        },
    }
}

local telescope_file_browser = {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    }
}

-- keybinds
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', ":Telescope file_browser<CR>", {})

return { vim_cool, plenary, telescope, telescope_file_browser, nvim_dev_icons }
