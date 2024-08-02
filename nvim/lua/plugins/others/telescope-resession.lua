return {
	"scottmckendry/telescope-resession.nvim",

	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("telescope").setup({
			-- Other telescope config...
			extensions = {
				resession = {
					prompt_title = "Find Sessions", -- telescope prompt title
					dir = "session", -- directory where resession stores sessions
				},
			},
		})
	end,
}
