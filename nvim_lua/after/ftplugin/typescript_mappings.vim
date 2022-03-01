lua << EOF
  vim.api.nvim_set_keymap("n", "<localleader>s", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<localleader>d", "<cmd>Telescope lsp_definitions<CR>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<localleader>r", "<cmd>Telescope lsp_references<CR>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<localleader>t", "<cmd>Telescope lsp_type_definitions<CR>", {noremap = true})
EOF
