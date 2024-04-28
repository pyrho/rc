return {
	"NeogitOrg/neogit",
	lazy = false,
	keys = { { "<LEADER>N", "<CMD>Neogit<CR>" } },
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"ibhagwan/fzf-lua", -- optional
	},
	opts = {
        graph_style = 'unicode'
    }
}
