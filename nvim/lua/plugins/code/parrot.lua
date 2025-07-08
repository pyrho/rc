return {
	"frankroeder/parrot.nvim",
	dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
    -- 2025-05-30 Can't be bothered to migrate. Mostly useless plugin.
    enabled = false,
	ft = { "typescript", "typescriptreact", "python" },
	config = function()
		require("parrot").setup({
			-- Providers must be explicitly added to make them available.
			providers = {
				anthropic = {
					api_key = os.getenv("ANTHROPIC_API_KEY"),
				},
			},
		})
	end,
}
