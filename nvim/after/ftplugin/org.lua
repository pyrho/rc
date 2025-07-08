vim.o.colorcolumn = ""
vim.keymap.set("i", "<S-CR>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
	silent = true,
	buffer = true,
})
