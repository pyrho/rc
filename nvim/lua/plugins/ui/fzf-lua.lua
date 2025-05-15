return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
			winopts = {
				fullscren = true,
				preview = {
					layout = "vertical",
				},
			},
			-- treesitter = { enable = true, disable = {} },
		})
		-- require("fzf-lua").register_ui_select()
	end,
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
				require("fzf-lua").lsp_definitions({ jump1 = true })
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
