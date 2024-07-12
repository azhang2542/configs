local nvim_treesitter = require("nvim-treesitter.configs")

nvim_treesitter.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

    auto_install = true,

    highlight = {
        enable = true,
    },
}
