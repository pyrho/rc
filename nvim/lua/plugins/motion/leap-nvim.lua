return {
	"ggandor/leap.nvim",
	lazy = false,
	config = function()
		require("leap").opts.highlight_unlabeled = true
		require("leap").add_default_mappings()
		vim.keymap.set({ "n", "x", "o" }, "gs", function()
			require("leap.remote").action()
		end)

		vim.keymap.set({ "x", "o" }, "R", function()
			require("leap.treesitter").select({
				-- To increase/decrease the selection in a clever-f-like manner,
				-- with the trigger key itself (vRRRRrr...). The default keys
				-- (<enter>/<backspace>) also work, so feel free to skip this.
				opts = require("leap.user").with_traversal_keys("R", "r"),
			})
		end)
	end,
}
