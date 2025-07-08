return {
	"3rd/image.nvim",
	ft = { "markdown" },
    enabled = true,
	opts = {},
	config = function()
		require("image").setup({
            backend = "kitty",
            processor = "magick_cli",
			integrations = {
				markdown = {
					only_render_image_at_cursor = true, -- defaults to false
					only_render_image_at_cursor_mode = "popup", -- "popup" or "inline", defaults to "popup"
				},
			},
		})
	end,
}
