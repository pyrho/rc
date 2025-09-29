return {
	"stevearc/conform.nvim",
	keys = { { "<LEADER>F", "<CMD>lua require'conform'.format()<CR>" } },
	config = function()
		require("conform").setup({
			log_level = vim.log.levels.DEBUG,
			formatters = {
				prettier = {
					command = require("conform.util").from_node_modules("prettier"),
					cwd = require("conform.util").root_file({ "package.json", ".editorconfig" }),
				},
			},
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				prisma = { "prismals" },
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				go = { "goimports", "gofmt" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				vue = { "prettier", stop_after_first = true },
				-- javascript = { { "prettierd", "prettier" } },
				-- typescript = { { "prettierd", "prettier" } },
				typescriptreact = { "prettier", stop_after_first = true },
				sql = { "sqlfmt" },
				json = { "fixjson" },
			},
		})
	end,
}
