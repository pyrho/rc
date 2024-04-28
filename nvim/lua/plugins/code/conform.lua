return {
	"stevearc/conform.nvim",
	keys = { { "<LEADER>F", "<CMD>lua require'conform'.format()<CR>" } },
	opts = {
		log_level = vim.log.levels.DEBUG,
		formatters_by_ft = {
			-- Conform will run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			lua = { "stylua" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettier" } },
			typescript = { { "prettier" } },
			vue = { { "prettier" } },
			-- javascript = { { "prettierd", "prettier" } },
			-- typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			sql = { "sql_formatter" },
			json = { "fixjson" },
		},
	},
}
