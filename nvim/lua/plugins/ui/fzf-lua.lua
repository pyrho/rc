return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		winopts = {
			fullscren = true,
			preview = {
				layout = "vertical",
			},
		},
		-- treesitter = { enable = true, disable = {} },
	},
	keys = {
		{ "<LEADER>o", "<CMD>FzfLua files<CR>" },
		{ "<LEADER>s", "<CMD>FzfLua live_grep<CR>" },
		{ "<LEADER>S", "<CMD>FzfLua grep_cword<CR>" },
		{ "<LEADER>b", "<CMD>FzfLua buffers<CR>" },
		{ "gS", "<CMD>FzfLua lsp_live_workspace_symbols<CR>" },
		{ "g0", "<CMD>FzfLua lsp_document_symbols<CR>" },
		{
			"gr",
			function()
				require("fzf-lua").lsp_references({ ignore_current_line = true, includeDeclaration = false })
			end,
		},
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
			end,
		},
		{
			"gx",
			function()
				require("fzf-lua").lsp_code_actions({ sync = true })
			end,
		},
		{
			"gj",
			function()
				vim.diagnostic.goto_next()
			end,
		},
		{
			"gk",
			function()
				vim.diagnostic.goto_prev()
			end,
		},
	},
}
