return {
	"folke/snacks.nvim",
	lazy = false,
	keys = {
		{
			"<leader>.",
			function()
				require("snacks").scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>>",
			function()
				require("snacks").scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
	},

	opts = {
		notifier = { enabled = true },

		scratch = {
			win_by_ft = {
				markdown = {
					keys = {
						["Goto"] = {
							"<cr>",
							function(self)
								--[[
                                --[navToNextPage](src/pages/Documents/components/FileSteps/components/StepNavigation/useStepNavigation.tsx:113)
                                --]]
								-- Get the current line text under cursor
								local line = vim.api.nvim_get_current_line()

								-- Extract the path from the line
								local path = line:match("%([^%)]+%)")
								if not path then
									print("No path found in current line")
									return
								end

								-- Remove parentheses
								path = path:sub(2, -2)

								-- Split path and line number if applicable
								local file_path, line_num = path:match("([^:]+):?(.*)")

								-- Open the file
								vim.cmd("edit " .. file_path)

								-- Jump to line number if provided
								if line_num and line_num ~= "" then
									vim.cmd(":" .. line_num)
								end
								require("snacks").scratch.open()
							end,
							desc = "Goto file",
							mode = { "n", "x" },
						},
					},
				},
			},
			ft = function()
				-- Except for lua where I can run the code, I only want markdown
				if vim.bo.buftype == "" and vim.bo.filetype == "lua" then
					return vim.bo.filetype
				end
				return "markdown"
			end,
		},
		picker = {
			enabled = true,
			ui_select = true,
		},
		input = {
			enabled = true,
		},
		styles = {
			scratch = {
				height = 20,
			},
			input = {
				relative = "cursor",
				row = -3,
				col = 0,
			},
		},
	},
}
