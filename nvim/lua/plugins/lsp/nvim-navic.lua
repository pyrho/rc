return {
	"SmiteshP/nvim-navic",
	ft = require("pyrho.helpers").getFiletypesForLSP(),
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		vim.g.navic_silence = true
	end,
}
