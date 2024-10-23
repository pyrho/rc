local function get_current_area()
	-- See :h filename-modifiers
	local x = vim.fn.expand("%:h:t")
end
local function is_whitelisted_cwd()
	local name = vim.fn.getcwd()
	local whitelist = { "code/caribou" }
	for i = 1, #whitelist do
		if string.find(name, whitelist[i], nil, true) then
			return true
		end
	end
	return false
end

_G.testme = is_whitelisted_cwd

local function get_session_name()
	local name = vim.fn.getcwd()
	local branch = vim.trim(vim.fn.system("git branch --show-current"))
	if vim.v.shell_error == 0 then
		return name .. branch
	else
		return name
	end
end

return {
	"stevearc/resession.nvim",
	lazy = false,
	opts = {},
	config = function()
		local resession = require("resession")
		resession.setup()

		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function()
		-- 		-- Only load the session if nvim was started with no args
		-- 		if vim.fn.argc(-1) == 0 then
		-- 			resession.load(get_session_name(), { dir = "gitsession", silence_errors = true })
		-- 		end
		-- 	end,
		-- })
		vim.api.nvim_create_user_command("ResessionDirStart", function()
			resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
		end, {})

		vim.api.nvim_create_user_command("ResessionDirLoad", function()
			resession.load(vim.fn.getcwd(), { dir = "dirsession", notify = false })
		end, {})

		vim.api.nvim_create_user_command("ResessionGitStart", function()
			resession.save(get_session_name(), { dir = "gitsession", notify = false })
		end, {})

		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				if resession.get_current() then
					resession.save(get_session_name(), { dir = "gitsession", notify = false })
				end
			end,
		})

		-- This works {{{
		-- Save session based on git branch
		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function()
		-- 		-- Only load the session if nvim was started with no args
		-- 		if vim.fn.argc(-1) == 0 then
		-- 			-- Save these to a different directory, so our manual sessions don't get polluted
		-- 			resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
		-- 		end
		-- 	end,
		-- 	nested = true,
		-- })
		-- vim.api.nvim_create_autocmd("VimLeavePre", {
		-- 	callback = function()
		-- 		resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
		-- 	end,
		-- })
		-- }}}
	end,
}
