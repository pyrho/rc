--     -- Trying https://github.com/zbirenbaum/copilot.lua instead
-- return {
--     enabled = false,
-- 	"github/copilot.vim",
-- 	ft = { "typescript" },
-- 	config = function()
-- 		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
-- 			expr = true,
-- 			replace_keycodes = false,
-- 		})
-- 		vim.g.copilot_no_tab_map = true
-- 	end,
-- }
return {
	"zbirenbaum/copilot.lua",
    -- no more sub
    enabled = false,
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
