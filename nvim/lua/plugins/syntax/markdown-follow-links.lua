return {
	"jghauser/follow-md-links.nvim",
	event = "VeryLazy",
	ft = "markdown",
	config = function()
		vim.keymap.set("n", "<bs>", ":edit #<cr>", { silent = true })
	end,
}
