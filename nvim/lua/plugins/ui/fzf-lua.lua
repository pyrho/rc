return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"elanmed/fzf-lua-frecency.nvim",
			config = function()
				require("fzf-lua-frecency").setup()
			end,
		},
	},
	event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
			winopts = {
				fullscren = true,
				preview = {
					layout = "vertical",
				},
			},
			treesitter = { enable = true, disable = {} },
		})

		require("fzf-lua").register_ui_select(function(ui_opts, items)
			local min_h, max_h = 0.15, 0.70
			local h = (#items + 4) / vim.o.lines
			if h < min_h then
				h = min_h
			elseif h > max_h then
				h = max_h
			end
			return {
				prompt = "❯ ",
				winopts = {
					height = h,
					title = ui_opts.prompt:gsub(":%s*$", ""),
					title_pos = "center",
					width = 0.60,
					row = 0.40,
				},
			}
		end)

	end,
	keys = {
		{ "<LEADER>O", "<CMD>FzfLua global<CR>", desc = "Everything fuzzy finder" },
		{ "<LEADER>o", "<CMD>FzfLua files<CR>", desc = "File fuzzy finder" },
		-- { "<LEADER>o", "<CMD>FzfLua frecency cwd_only=true<CR>", desc = "File fuzzy finder" },
		{ "<LEADER>s", "<CMD>FzfLua live_grep<CR>", desc = "Live grep" },
		{ "<LEADER>S", "<CMD>FzfLua grep_cword<CR>", desc = "Grep current word" },
		{ "<LEADER>b", "<CMD>FzfLua buffers<CR>", desc = "Buffer fuzzy finder" },
		{ "<LEADER>B", "<CMD>FzfLua blines<CR>", desc = "Lines fuzzy finder" },
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
