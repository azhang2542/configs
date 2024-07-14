local lualine = require("lualine")

local function getLspName()
	local bufnr = vim.api.nvim_get_current_buf()
	local buf_clients = vim.lsp.get_clients({ bufnr = bufnr })
	local buf_ft = vim.bo.filetype
	if next(buf_clients) == nil then
		return "  No servers"
	end
	local buf_client_names = {}

	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end

	local lint_s, lint = pcall(require, "lint")
	if lint_s then
		for ft_k, ft_v in pairs(lint.linters_by_ft) do
			if type(ft_v) == "table" then
				for _, linter in ipairs(ft_v) do
					if buf_ft == ft_k then
						table.insert(buf_client_names, linter)
					end
				end
			elseif type(ft_v) == "string" then
				if buf_ft == ft_k then
					table.insert(buf_client_names, ft_v)
				end
			end
		end
	end

	local ok, conform = pcall(require, "conform")
	local formatters = table.concat(conform.list_formatters_for_buffer(), " ")
	if ok then
		for formatter in formatters:gmatch("%w+") do
			if formatter then
				table.insert(buf_client_names, formatter)
			end
		end
	end

	local hash = {}
	local unique_client_names = {}

	for _, v in ipairs(buf_client_names) do
		if not hash[v] then
			unique_client_names[#unique_client_names + 1] = v
			hash[v] = true
		end
	end
	local language_servers = table.concat(unique_client_names, ", ")

	return "  " .. language_servers
end

local lsp = {
	function()
		return getLspName()
	end,
}

lualine.setup({
	options = {
		theme = "catppuccin",
	},
	sections = {
		lualine_x = {
			lsp,
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})
