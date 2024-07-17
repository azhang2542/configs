local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[                                                    ]],
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	[[                                                    ]],
}

dashboard.section.buttons.val = {}
local v = vim.version()
local version = v.major .. "." .. v.minor .. "." .. v.patch
-- local stats = require("lazy").stats()
-- local plugins_count = stats.loaded .. "/" .. stats.count
-- local ms = math.floor(stats.startuptime + 0.5)
local time = vim.fn.strftime("%I:%M%p")
local date = vim.fn.strftime("%m.%d.%Y")

local line1 = " Version " .. version
local line2 = "󰃭 " .. date
local line3 = " " .. time
-- does not measure start up time correctly
-- local line3 = " " .. plugins_count .. " plugins loaded in " .. ms .. "ms"

local line1_width = vim.fn.strdisplaywidth(line1)
local line2Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line2)) / 2) .. line2
local line3Padded = string.rep(" ", (line1_width - vim.fn.strdisplaywidth(line3)) / 2) .. line3

dashboard.section.footer.val = {
	line1,
	line2Padded,
	line3Padded,
}

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaButtons"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaButtons"

dashboard.config = {
	layout = {
		{ type = "padding", val = 20 },
		dashboard.section.header,
		dashboard.section.buttons,
		dashboard.section.footer,
	},
	opts = {
		margin = 5,
	},
}

alpha.setup(dashboard.config)
