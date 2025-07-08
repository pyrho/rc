local helpers = require("pyrho.helpers")

-- Add the key mappings only for Markdown files in a zk notebook.
if
	helpers.is_zen()
	and helpers.isModuleAvailable("zk.util")
	and require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil
then
	local function map(...)
		vim.api.nvim_buf_set_keymap(0, ...)
	end
	local opts = { noremap = true, silent = false }

	-- Open the link under the caret.
	map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Create a new note after asking for its title.
	-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
	map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)

	-- Create a new note in the same directory as the current buffer, using the current selection for title.
	map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)

	-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
	map(
		"v",
		"<leader>znc",
		":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
		opts
	)

	-- Open notes linking to the current buffer.
	map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
	-- Alternative for backlinks using pure LSP and showing the source context.
	-- map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- Open notes linked by the current buffer.
	map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

	-- Preview a linked note.
	map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- Open the code actions for a visual selection.
	map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)

	map("n", "gzz", "<Cmd>ZkNotes { sort = { 'modified' }, exclude = { 'diary' } }<CR>", opts)
	map("n", "gzt", "<Cmd>ZkTags<CR>", opts)

	-- Search for the notes matching the current visual selection.
	map("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)

	-- vim.api.nvim_del_keymap("n", "<leader>b");
	map("n", "<leader>B", ":ZkBuffer<CR>", opts)
    vim.keymap.set("n", "gzn", function()
      require('zk').new({title = vim.fn.input('Title: ')})
    end, opts)
end
