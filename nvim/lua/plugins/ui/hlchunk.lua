return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			indent = {
				enable = false,
				priority = 10,
				-- style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) },
				use_treesitter = false,
				chars = { "│" },
				ahead_lines = 5,
				delay = 100,
			},
			chunk = {
				enable = true,
				priority = 15,
				style = {
					{ fg = "#aab4f1" },
					{ fg = "#cd758f" },
				},
				use_treesitter = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "─",
				},
				textobject = "",
				max_file_size = 1024 * 1024,
				error_sign = true,
				-- animation related
				duration = 0,
				delay = 0,
			},
			line_num = {
				enable = true,
				style = "#7ba2e2",
				priority = 10,
				use_treesitter = true,
			},
		})
	end,
}
