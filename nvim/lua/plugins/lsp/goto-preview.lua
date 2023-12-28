return {
	"rmagatti/goto-preview",
	event = "VeryLazy",
	config = function()
		require("goto-preview").setup({
			post_open_hook = function(buf, win_)
				vim.keymap.set("n", "q", "<CMD>q<CR>", { buffer = buf })
			end,

			post_close_hook = function(buf, win_)
				vim.keymap.del("n", "q", "<CMD>q<CR>", { buffer = buf })
			end,
		})

		vim.keymap.set("n", "gp", function()
			require("goto-preview").goto_preview_definition()
		end, { noremap = true })

		vim.keymap.set("n", "gP", function()
			require("goto-preview").close_all_win()
		end, { noremap = true })
	end,
}
