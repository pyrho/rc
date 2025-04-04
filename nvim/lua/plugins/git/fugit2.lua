return {
	"SuperBo/fugit2.nvim",
	opts = {
		width = "100%",
		min_width = 50,
		content_width = 60,
		max_width = "90%",
		height = "90%",
		external_diffview = true, -- tell fugit2 to use diffview.nvim instead of builtin implementation.
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{
			"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
			dependencies = { "stevearc/dressing.nvim" },
		},
	},
	cmd = { "Fugit2", "Fugit2Blame", "Fugit2Diff", "Fugit2Graph" },
	keys = {
		{ "<leader>G", mode = "n", "<cmd>Fugit2<cr>" },
	},
}
