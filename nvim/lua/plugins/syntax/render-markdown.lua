return {
	"MeanderingProgrammer/render-markdown.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown" },

			-- Using nabla.nvim instead
			latex = { enabled = false },
			on = {
				attach = function()
					require("nabla").enable_virt({ autogen = true })
				end,
			},
			win_options = {
				conceallevel = {
					-- Used when not being rendered, get user setting
					default = vim.api.nvim_get_option_value("conceallevel", {}),
					-- This is needed for nabla
					rendered = 2,
				},
			},
		})
	end,
}
