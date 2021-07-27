local M = {}
function M.config()
  vim.cmd("let $FZF_DEFAULT_OPTS = ''")
  vim.api.nvim_set_keymap("n", "<Leader>o", "<cmd>Files<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>s", ":<cmd>Rg<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Buffers<CR>",
                          {noremap = true, silent = true})

end

return M
