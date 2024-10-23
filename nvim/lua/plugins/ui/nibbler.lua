return {
	"skosulor/nibbler",
	cmd = {
		"Nibbler",
		"NibblerToHex",
		"NibblerToBin",
		"NibblerToDec",
		"NibblerToggle",
		"NibblerToggleDisplay",
		"NibblerToCArray",
		"NibblerHexStringToCArray",
	},
	config = function()
		require("nibbler").setup({
			display_enabled = true, -- Set to false to disable real-time display (default: true)
		})
	end,
}
