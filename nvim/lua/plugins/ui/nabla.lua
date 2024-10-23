return {
	"jbyuki/nabla.nvim",
	event = "VeryLazy",
	config = function()
  --       vim.o.updatetime = 500
		-- vim.api.nvim_create_autocmd("CursorHold", {
		-- 	pattern = { "*.md" },
		-- 	callback = function()
		-- 		require("nabla").popup()
		-- 	end,
		-- })
	end,
}
