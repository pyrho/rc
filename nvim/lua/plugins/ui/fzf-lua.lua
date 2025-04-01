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
		{ "<LEADER>o", "<CMD>FzfLua files<CR>", desc = "File fuzzy finder" },
		{ "<LEADER>s", "<CMD>FzfLua live_grep<CR>", desc = "Live grep" },
		{ "<LEADER>S", "<CMD>FzfLua grep_cword<CR>", desc = "Grep current word" },
		{ "<LEADER>b", "<CMD>FzfLua buffers<CR>", desc = "Buffer fuzzy finder" },
		{ "gS", "<CMD>FzfLua lsp_live_workspace_symbols<CR>", desc = "Find workspace symbols" },
		{ "g0", "<CMD>FzfLua lsp_document_symbols<CR>", desc = "Find current document symbols" },
		{
			"gD",
			function()
				require("fzf-lua").lsp_finder()
			end,
			desc = "LSP Finder",
		},
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
			end,
			desc = "LSP Definitions",
		},
		{
			"gr",
			function()
				require("fzf-lua").lsp_references({ ignore_current_line = true, includeDeclaration = false })
			end,
			desc = "LSP References",
		},
		{
			"gx",
			function()
				require("fzf-lua").lsp_code_actions({ sync = true })
			end,
			desc = "LSP Code actions",
		},
	},
}
