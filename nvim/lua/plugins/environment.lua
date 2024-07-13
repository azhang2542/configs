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
            -- this build did not work initially and
            -- was forced to cd into .local/shared/nvim/lazy/telescope-fzf-native.nvim
            -- and evoke make command
            build = 'make',
        },
    },
    config = function()
        require("config.telescope")
    end
}

local telescope_file_browser = {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    }
}

local gitsigns = {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
    end
}

local diffview = {
    "sindrets/diffview.nvim",
}

local lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("config.lualine")
    end
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
-- keybinds
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Telescope grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Telescope buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope help"})
vim.keymap.set('n', '<leader>fd', ":Telescope file_browser<CR>", {desc = "Telescope file browser"})

return { vim_cool, plenary, telescope, telescope_file_browser, nvim_dev_icons, gitsigns, diffview, lualine, which_key }
