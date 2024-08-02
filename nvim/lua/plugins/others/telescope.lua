return {
	event = "VeryLazy",
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"scottmckendry/telescope-resession.nvim",
	},
	config = function()
		require("telescope").setup({
			-- Other telescope config...
			extensions = {
				resession = {
					path_substitutions = {
						{ find = "/Users/pyrho/", replace = "🏠" },
					},
					prompt_title = "Find Sessions", -- telescope prompt title
					dir = "gitsession", -- directory where resession stores sessions
				},
			},
		})

		vim.keymap.set("n", "<leader>L", function()
            require("telescope").extensions.resession.resession()
		end)
	end,
}
