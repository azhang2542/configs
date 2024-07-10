local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

local lsp = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim"
    },
    config = function()
        require("config.lsp")
    end,
}

return { treesitter, lsp }
