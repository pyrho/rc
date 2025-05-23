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
				},
			})
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							require("nvim-navic").attach(client, bufnr)
						end,
					})
				end,
				-- ["zk"] = function()
				-- 	require("lspconfig").zk.setup({
				-- 		on_attach = function(client, bufnr)
				-- 			require("nvim-navic").attach(client, bufnr)
				-- 			vim.diagnostic.config({ signs = false, underline = false })
				-- 		end,
				-- 	})
				-- end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				["ltex"] = function()
					require("lspconfig").ltex.setup({
						autostart = false,
						on_attach = function(client, bufnr)
							require("nvim-navic").attach(client, bufnr)
						end,
						filetypes = { "markdown" },
						cmd = { "/opt/homebrew/bin/ltex-ls" },
						settings = {
							ltex = {
								dictionary = { ["en_US"] = { "HPAQ" } },
								diagnosticSeverity = "information",
								language = "en-US",
								additionalRules = {
									motherTongue = "fr",
									languageModel = "~/.ngrams",
								},
							},
						},
					})
				end,

				["yamlls"] = function()
					require("lspconfig").yamlls.setup({
						on_attach = function(client, bufnr)
							require("nvim-navic").attach(client, bufnr)
						end,
						settings = {
							yaml = {
								schemas = {
									["https://json.schemastore.org/taskfile.json"] = "Taskfile*.yml",
									["https://json.schemastore.org/circleciconfig.json"] = ".circleci/config.yml",
								},
							},
						},
					})
				end,
			})
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
