return {
	dir = "~/code/perso/scratchpad.nvim",
	event = "VeryLazy",
	config = {
    },
	keys = {
		{
			"<C-t>",
			function()
				require("scratchpad").toggle("~/mtmp/NOTES.md")
			end,
		},
	},
}
