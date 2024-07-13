local formatter = require("formatter")

formatter.setup {
    ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
    }
}

-- formatter auto save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
