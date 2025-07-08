return {
	"CopilotC-Nvim/CopilotChat.nvim",
	ft = { "typescript" },
	dependencies = {
		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		mappings = {
			complete = {
				insert = "<C-O>",
			},
		},
		-- See Configuration section for options
	},
}
