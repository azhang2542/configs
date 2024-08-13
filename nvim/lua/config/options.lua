-- bindings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>1", "1gt", { desc = "go to tab 1", noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", "2gt", { desc = "go to tab 2", noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", "3gt", { desc = "go to tab 3", noremap = true, silent = true })
vim.keymap.set("n", "<leader>4", "4gt", { desc = "go to tab 4", noremap = true, silent = true })
vim.keymap.set("n", "<leader>5", "5gt", { desc = "go to tab 5", noremap = true, silent = true })
vim.keymap.set("n", "<leader>6", "6gt", { desc = "go to tab 6", noremap = true, silent = true })
vim.keymap.set("n", "<leader>7", "7gt", { desc = "go to tab 7", noremap = true, silent = true })
vim.keymap.set("n", "<leader>8", "8gt", { desc = "go to tab 8", noremap = true, silent = true })
vim.keymap.set("n", "<leader>9", "9gt", { desc = "go to tab 9", noremap = true, silent = true })
vim.keymap.set("n", "<leader>0", ":tablast<CR>", { desc = "go to last tab", noremap = true, silent = true })

vim.keymap.set("n", "<leader>l", ":tabprevious<CR>", { desc = "next tab", noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":tabnext<CR>", { desc = "previous tab", noremap = true, silent = true })

vim.keymap.set("n", "<leader>&", ":tabc<CR>", { desc = "close tab", noremap = true })

vim.keymap.set("n", "<leader>%", ":sp<CR>", { desc = "split horizontally", noremap = true })
vim.keymap.set("n", '<leader>"', ":vs<CR>", { desc = "split vertically", noremap = true })

vim.keymap.set(
	"n",
	"<",
	":vertical resize +5<CR>",
	{ desc = "window bigger vertically", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	">",
	":vertical resize -5<CR>",
	{ desc = "window smaller vertically", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"+",
	":horizontal resize +2<CR>",
	{ desc = "window bigger horizontally", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"_",
	":horizontal resize -2<CR>",
	{ desc = "window bigger horizontally", noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>L", ":Lazy<CR>", { desc = "lazy.nvim", noremap = true, silent = true })

vim.keymap.set("n", "<leader>b", ":b#<CR>", { desc = "go to pervious buffer", noremap = true, silent = true })

-- options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

-- symbols for diagnostics
vim.opt.signcolumn = "yes:1"
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- disable autocomments
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- shows diagnostics on cursor hover
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	callback = function()
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			if vim.api.nvim_win_get_config(winid).zindex then
				return
			end
		end
		vim.diagnostic.open_float({
			scope = "cursor",
			-- focusable = false,
			close_events = {
				"CursorMoved",
				"CursorMovedI",
				"BufHidden",
				"InsertCharPre",
				"WinLeave",
			},
		})
	end,
})

vim.o.updatetime = 300
