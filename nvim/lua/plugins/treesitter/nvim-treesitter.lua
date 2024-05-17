return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true, -- false will disable the whole extension
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
				disable = {
                    "dashboard"
					-- 2022-02-08 Disabling markdown for now because it's messing with concealing (see https://github.com/nvim-treesitter/nvim-treesitter/issues/959)
					-- 2023-06-02: Trying again
					-- "markdown", "c", "rust"
				}, -- list of language that will be disabled
			},
			ensure_installed = {
				-- 2022-02-08 Disabling markdown for now because it's messing with concealing (see https://github.com/nvim-treesitter/nvim-treesitter/issues/959)
				-- "markdown",
				"javascript",
				"typescript",
				"json",
				"prisma",
				"http",
				"lua",
				"markdown_inline",
				"markdown",
			},
			refactor = { highlight_current_scope = { enable = true } },
			textobjects = {
				move = {
					enable = true,
					set_jumps = true,
					-- goto_next_start = {["]]"] = "@function.outer"},
					-- goto_previous_start = {["[["] = "@function.outer"}
				},
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})

		-- From https://github.com/pwntester/octo.nvim#-faq
		-- This enables treesitter HL for octo buffers
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.markdown.filetype_to_parsername = "octo"
	end,

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-refactor",
	},
}
