return {
	"atiladefreitas/dooing",
	cmd = {
		"Dooing",
        "DooingLocal",
        "DooingDue"
	},
	config = function()
		require("dooing").setup()
	end,
}
