local lualine = require("lualine")

local function getLsp()
	local bufnr = vim.api.nvim_get_current_buf()
	local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })

	if next(buf_clients) == nil then
		return ""
	end

	local lsp_names = {}

	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(lsp_names, client.name)
		end
	end

	return "  " .. table.concat(lsp_names, ", ")
end

-- untested
local function getLinter()
	local lint_s, lint = pcall(require, "lint")

	if not lint_s then
		return ""
	end

	local buf_ft = vim.bo.filetype

	local linter_names = {}
	for ft_k, ft_v in pairs(lint.linters_by_ft) do
		if type(ft_v) == "table" then
			for _, linter in ipairs(ft_v) do
				if buf_ft == ft_k then
					table.insert(linter_names, linter)
				end
			end
		elseif type(ft_v) == "string" then
			if buf_ft == ft_k then
				table.insert(linter_names, ft_v)
			end
		end
	end

	return "  " .. table.concat(linter_names, ", ")
end

local function getFormatter()
	local conform_s, conform = pcall(require, "conform")
	local formatters = table.concat(conform.list_formatters_for_buffer(), ", ")

	if not conform_s or #formatters < 1 then
		return ""
	end

	return "  " .. formatters
end

local lsp = {
	function()
		return getLsp()
	end,
}

local linter = {
	function()
		return getLinter()
	end,
}

local formatter = {
	function()
		return getFormatter()
	end,
}

lualine.setup({
	options = {
		theme = "catppuccin",
	},
	sections = {
		lualine_x = {
			lsp,
			linter,
			formatter,
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})
