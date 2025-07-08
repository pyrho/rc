return {
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufNewFile", "BufReadPost" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"r_language_server",
					"lua_ls",
					"elixirls",
					"elmls",
					"prismals",

					-- 2025-04-03 as of this date, there's an issue with the manifest for this
					-- "zk",

					"ltex",
					"yamlls",
					"ts_ls",
				},
                automatic_enable = false,
			})
            -- vim.lsp.enable("ltex")
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
		build = ":MasonUpdate",
	},
	{
		-- local signs = { Error = '', Warn = '', Hint = '', Info = '' }

		"nvim-lspconfig",
		config = function()
			-- Highlight entire line for errors
			-- Highlight the line number for warnings
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
					linehl = {
						-- [vim.diagnostic.severity.ERROR] = "",
					},
					numhl = {
						[vim.diagnostic.severity.WARN] = "WarningMsg",
					},
				},
			})
			-- vim.fn.sign_define("DiagnosticSignError", {
			-- 	texthl = "DiagnosticSignError",
			-- 	text = " ",
			-- 	numhl = "DiagnosticSignError",
			-- })
			-- vim.fn.sign_define("DiagnosticSignWarn", {
			-- 	texthl = "DiagnosticSignWarn",
			-- 	text = " ",
			-- 	numhl = "DiagnosticSignWarn",
			-- })
			-- vim.fn.sign_define("DiagnosticSignHint", {
			-- 	texthl = "DiagnosticSignHint",
			-- 	text = " ",
			-- 	numhl = "DiagnosticSignHint",
			-- })
			-- vim.fn.sign_define("DiagnosticSignInfo", {
			-- 	texthl = "DiagnosticSignInfo",
			-- 	text = " ",
			-- 	numhl = "DiagnosticSignInfo",
			-- })
		end,
	},
}
