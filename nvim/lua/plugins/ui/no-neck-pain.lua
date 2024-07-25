return {
	"shortcuts/no-neck-pain.nvim",
	cmd = "NoNeckPain",
	version = "*",
	config = function()
		require("no-neck-pain").setup({
			width = 120,
            colors ={ blend = -0.1 },
			buffers = {
				-- backgroundColor = "onedark",
				scratchPad = {
					enabled = true,
					fileName = "notes",
					location = "~/mtmp/",
				},
				bo = {
					filetype = "md",
				},
			},
		})
	end,
}
