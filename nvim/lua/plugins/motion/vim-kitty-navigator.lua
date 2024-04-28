return {
	"knubie/vim-kitty-navigator",
	version = "*",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_set_keymap("n", "<D-h>", ":KittyNavigatorLeft<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<D-j>", ":KittyNavigatorDown<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<D-k>", ":KittyNavigatorUp<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<D-l>", ":KittyNavigatorRight<CR>", { noremap = true, silent = true })
	end,
}
