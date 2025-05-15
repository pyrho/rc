return {
	"folke/snacks.nvim",
	event = "VeryLazy",
	opts = {
		picker = {
			enabled = true,
			ui_select = true,
		},
		input = {
			enabled = true,
		},
		styles = {
			input = {
				relative = "cursor",
				row = -3,
				col = 0,
			},
		},
	},
}
