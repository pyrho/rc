local M = {}

function M.init()
	-- Movement
	-- vim.api.nvim_set_keymap("n", "<Leader>h", ":wincmd h<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd j<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "<Leader>k", ":wincmd k<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd l<CR>", { noremap = true, silent = true })

	-- These mappings are actually used by kitty via the vim-kitty-navigator plugin. They are
	-- never issue by me directly, kitty sends them (via the pass_keys.py kitten)
	-- vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })

	vim.api.nvim_set_keymap("n", "<Leader>w", ":wa<CR>", { noremap = true, silent = true })

	-- Quickfix/Location nav
	vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "[l", ":lprev<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "]l", ":lnext<CR>", { noremap = true, silent = true })

	-- vim.api.nvim_set_keymap("i", "gj", "<Esc>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("i", "jg", "<Esc>", { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap("i", "<S-Del>", "<Del>", { noremap = true, silent = true })

	-- Helpers
	vim.api.nvim_set_keymap(
		"n",
		"<Localleader>k",
		"<cmd>.!toilet -w80 -f pagga -F border<CR>Vjjjj:center<CR>",
		{ noremap = true, silent = true }
	)

	-- Tabs
	vim.api.nvim_set_keymap("n", "te", "<cmd>tab split<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "tc", "<cmd>tabclose<CR>", { noremap = true })

	vim.cmd([[ 
    function s:vertopen_url()
        let mycommand = "reader " . shellescape('<cWORD>')
        execute "vertical terminal " . mycommand
    endfunction
    noremap <Plug>vertopen_url : call <SID>vertopen_url()<CR>
    nmap <Leader>gx <Plug>vertopen_url
  ]])

	-- Include "dumb" motions in jumplist
	-- See https://medium.com/@kadek/understanding-vims-jump-list-7e1bfc72cdf0
	vim.api.nvim_set_keymap("n", "k", [[(v:count > 1 ? "m'" . v:count : '' ) . 'gk']], { noremap = true, expr = true })
	vim.api.nvim_set_keymap("n", "j", [[(v:count > 1 ? "m'" . v:count : '' ) . 'gj']], { noremap = true, expr = true })

    -- Copy link to current file with line #
	vim.keymap.set("n", "<Leader>yy", function()
		local cword = vim.fn.expand("<cword>")
		-- let @* = expand('%') . ':' . line('.')
		local path_and_line = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
		local line = "- [" .. cword .. "](" .. path_and_line .. ")"
        vim.fn.setreg("@", line)
		print(line)
	end, { noremap = true, expr= true })
end

local function find_config_file()
	local opts = {
		search_dirs = {
			require("plenary.path"):new(vim.env.HOME, "rc", "nvim"):absolute(),
		},
	}

	require("telescope.builtin").find_files(opts)
end

function M.dashboard()
	vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
	vim.keymap.set("n", "e", ":enew<CR>", { buffer = true })
	vim.keymap.set("n", "0", "<cmd>SessionLoad<CR>", { buffer = true })
	vim.keymap.set("n", "c", find_config_file, { buffer = true })
	vim.keymap.set("n", "s", "<CMD>FzfLua live_grep<CR>", { buffer = true })
	vim.keymap.set("n", "o", "<CMD>FzfLua files<CR>", { buffer = true })
	vim.keymap.set("n", "O", "<CMD>FzfLua oldfiles<CR>", { buffer = true })
end

return M
