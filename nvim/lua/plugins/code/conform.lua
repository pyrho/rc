return {
	"stevearc/conform.nvim",
	keys = { { "<LEADER>F", "<CMD>lua require'conform'.format()<CR>" } },
	opts = {
		log_level = vim.log.levels.DEBUG,
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
			javascript = { "prettier", "prettierd", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			vue = { "prettierd", "prettier", stop_after_first = true },
			-- javascript = { { "prettierd", "prettier" } },
			-- typescript = { { "prettierd", "prettier" } },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			sql = { "sql_formatter" },
			json = { "fixjson" },
		},
	},
}
