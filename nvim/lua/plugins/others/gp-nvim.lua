return {
	"robitx/gp.nvim",
	event = "VeryLazy",
	keys = { "<Leader>G" },
	config = function()
		require("gp").setup({
			hooks = {
				-- example of adding command which writes unit tests for the selected code
				UnitTests = function(gp, params)
					local template = "I have the following code from {{filename}}:\n\n"
						.. "```{{filetype}}\n{{selection}}\n```\n\n"
						.. "Please respond by writing table driven unit tests for the code above."
					gp.Prompt(
						params,
						gp.Target.enew,
						nil,
						gp.config.command_model,
						template,
						gp.config.command_system_prompt
					)
				end,
				-- example of adding command which explains the selected code
				Explain = function(gp, params)
					local template = "I have the following code from {{filename}}:\n\n"
						.. "```{{filetype}}\n{{selection}}\n```\n\n"
						.. "Please respond by explaining the code above."
					gp.Prompt(
						params,
						gp.Target.popup,
						nil,
						gp.config.command_model,
						template,
						gp.config.chat_system_prompt
					)
				end,
				-- example of usig enew as a function specifying type for the new buffer
				CodeReview = function(gp, params)
					local template = "I have the following code from {{filename}}:\n\n"
						.. "```{{filetype}}\n{{selection}}\n```\n\n"
						.. "Please analyze for code smells and suggest improvements."
					gp.Prompt(
						params,
						gp.Target.enew("markdown"),
						nil,
						gp.config.command_model,
						template,
						gp.config.command_system_prompt
					)
				end,
			},
		})

		local function keymapOptions(desc)
			return {
				noremap = true,
				silent = true,
				nowait = true,
				desc = "GPT prompt " .. desc,
			}
		end

		-- Chat commands
		vim.keymap.set("n", "<Leader>G", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))

		-- or setup with your own config (see Install > Configuration in Readme)
		-- require("gp").setup(conf)

		-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
	end,
}
