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
		require("pick-resession").setup({
			-- Add any configuration options here
			-- For example, you can set the default session directory
			layout = "dropdown",
		})
		-- Make sure pick-resession is set up first

		-- Get the resession module
		local resession = require("resession")

		-- Create a custom function to list only sessions for current directory
		local function list_sessions_for_current_dir()
			local cwd = vim.fn.getcwd()

			-- Get all sessions
			local sessions = resession.list({ dir = "gitsession" })

			-- Filter sessions that start with the current directory
			local filtered_sessions = {}
			for _, session in ipairs(sessions) do
				-- if session:match("^" .. cwd) then
				table.insert(filtered_sessions, session)
				-- end
			end

			local function generate_sessions()
				local sessions = {}
				for idx, session in ipairs(require("resession").list({ dir = "gitsession" })) do
					local formatted = session:gsub("__", ":/"):gsub("_", "/")
					--- @type snacks.picker.Item
					sessions[#sessions + 1] = {
						score = 0,
						text = session,
						value = session,
						idx = idx,
						display_value = formatted,
						file = formatted,
					}
				end
				return sessions
			end

			-- Launch the snacks picker with the filtered sessions
			require("pick-resession").pick({
				snacks_finder = generate_sessions,
				dir = "gitsession",
			})
		end

		-- Create a user command to call this function
		vim.api.nvim_create_user_command("SessionPickCwd", list_sessions_for_current_dir, {})

		-- Setup a keymap to use this function instead of the default
		vim.keymap.set("n", "<leader>L", function()
			list_sessions_for_current_dir()
		end, { desc = "List sessions for current directory" })
	end,
}
