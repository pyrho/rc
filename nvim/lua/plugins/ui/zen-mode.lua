return { -- Lua
	cmd = "ZenMode",
	"folke/zen-mode.nvim",
	opts = {
		window = {
			backdrop = 1,
			width = 0.8, -- width of the Zen window
			height = 0.8, -- height of the Zen window
			options = {
				colorcolumn = "",
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			wezterm = {
				enabled = false,
				-- can be either an absolute font size or the number of incremental steps
				font = "+4", -- (10% increase per step)
			},
		},
	},
}
