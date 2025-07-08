return {
	"pyrho/pick-resession.nvim",
	dev = true,
	event = "VeryLazy",
	branch = "feat/custom-session-finder",
	dependencies = {
		"stevearc/resession.nvim",
		"folke/snacks.nvim", -- Ensure snacks.nvim is available
	},
	config = function()
		require("pick-resession").setup({ layout = "select" })

		local function generate_sessions()
			local cwd = vim.fn.getcwd()
            print(cwd)
			local sessions = {}
			for idx, session in ipairs(require("resession").list({ dir = "gitsession" })) do
				local formatted = session:gsub("__", ":/"):gsub("_", "/")
				if formatted:find(cwd, 1, true) == 1 then
					sessions[#sessions + 1] = {
						score = 0,
						text = session,
						value = session,
						idx = idx,
						display_value = formatted,
						file = formatted,
					}
				end
			end
			return sessions
		end

		vim.keymap.set("n", "<leader>L", function()
			require("pick-resession").pick({
				snacks_finder = generate_sessions,
				dir = "gitsession",
			})
		end, { desc = "List sessions for current directory" })
	end,
}
