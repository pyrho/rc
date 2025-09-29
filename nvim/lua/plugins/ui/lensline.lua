return {
	"oribarilan/lensline.nvim",
	-- Lock ups at boot, annoying
	enabled = false,
	tag = "1.1.2", -- or: branch = 'release/1.x' for latest non-breaking updates
	event = "LspAttach",
	config = function()
		require("lensline").setup({
			style = {
				placement = "inline",
				prefix = "",
				render = "focused", -- or "all" for showing lenses in all functions
			},
		})
		-- require("lensline").setup({
		-- 	providers = {
		-- 		-- Replace the default references with this enhanced version
		-- 		{
		-- 			name = "references_with_warning",
		-- 			enabled = true,
		-- 			event = { "LspAttach", "BufWritePost" },
		-- 			handler = function(bufnr, func_info, provider_config, callback)
		-- 				local utils = require("lensline.utils")
		--
		-- 				utils.get_lsp_references(bufnr, func_info, function(references)
		-- 					if references then
		-- 						local count = #references
		-- 						local icon, text
		--
		-- 						if count == 0 then
		-- 							icon = utils.if_nerdfont_else("⚠️ ", "WARN ")
		-- 							text = icon .. "No references"
		-- 						else
		-- 							icon = utils.if_nerdfont_else("󰌹 ", "")
		-- 							local suffix = utils.if_nerdfont_else("", " refs")
		-- 							text = icon .. count .. suffix
		-- 						end
		--
		-- 						callback({ line = func_info.line, text = text })
		-- 					else
		-- 						callback(nil)
		-- 					end
		-- 				end)
		-- 			end,
		-- 		},
		-- 		{ name = "last_author", enabled = true },
		-- 		{ name = "diagnostics", enabled = true },
		-- 		{ name = "complexity", enabled = true },
		--
		-- 		{
		-- 			name = "function_length",
		-- 			enabled = true,
		-- 			event = { "BufWritePost", "TextChanged" },
		-- 			handler = function(bufnr, func_info, provider_config, callback)
		-- 				local utils = require("lensline.utils")
		-- 				local function_lines = utils.get_function_lines(bufnr, func_info)
		-- 				local func_line_count = math.max(0, #function_lines - 1) -- Subtract 1 for signature
		-- 				local total_lines = vim.api.nvim_buf_line_count(bufnr)
		--
		-- 				-- Show line count for all functions
		-- 				callback({
		-- 					line = func_info.line,
		-- 					text = string.format("(%d/%d lines)", func_line_count, total_lines),
		-- 				})
		-- 			end,
		-- 		},
		-- 	},
		-- })
	end,
}
