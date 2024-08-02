return {
	"MeanderingProgrammer/markdown.nvim",
	event = "VeryLazy",
	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown", "typescript" },
			highlights = {
				-- Code blocks
				code = "markdownCode",
			},
		})
	end,
}
