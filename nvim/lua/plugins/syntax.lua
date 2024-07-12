local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("config.tree_sitter")
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

local formatter = {
    "mhartington/formatter.nvim",
    config = function()
        require("config.formatter")
    end,
}

-- formatter auto save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

return { treesitter, lsp, formatter }
