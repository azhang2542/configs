local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("config.catppuccin")
	end,
}

return { catppuccin }
