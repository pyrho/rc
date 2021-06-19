local M = {}
function M.config()
  vim.g.floaterm_position = 'center'
  vim.g.floaterm_winblend = 0
  vim.g.floaterm_width = 0.9
  vim.g.floaterm_height = 0.9
  vim.g.floaterm_autoclose = 2

  vim.api.nvim_set_keymap("n", "<C-t>", ":FloatermToggle<CR>", {noremap = true})

  vim.cmd [[
                inoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
                tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
        ]]
end
return M
