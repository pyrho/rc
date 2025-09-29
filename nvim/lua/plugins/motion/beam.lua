return {
	"Piotr1215/beam.nvim",
    -- 2025-09-01: This looks amazing, but I'll try to stick with leap for now.
    enabled = false,
	config = function()
		local beam = require("beam")
		beam.setup() -- Uses default prefix ','
		if beam then
			beam.register_text_objects({
				["f"] = "function (treesitter)",
				["c"] = "class (treesitter)",
				["l"] = "loop (treesitter)",
				["a"] = "parameter (treesitter)",
			})
		end
	end,
}
