local M = {}

function M.init()
  -- Movement
  vim.api.nvim_set_keymap("n", "<Leader>h", ":wincmd h<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd j<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>k", ":wincmd k<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd l<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>w", ":wa<CR>",
                          {noremap = true, silent = true})

  -- Quickfix/Location nav
  vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "[l", ":lprev<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "]l", ":lnext<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>o",
                          "<Cmd>FzfLua files<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>FzfLua live_grep<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>S", "<cmd>FzfLua grep_cword<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>FzfLua buffers<CR>",
                          {noremap = true, silent = true})

  -- Helpers
  vim.api.nvim_set_keymap("n", "<Leader><Leader>x",
                          "<cmd>lua require'pyrho.helpers'.save_and_exec()<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Localleader>k",
                          "<cmd>.!toilet -w80 -f pagga -F border<CR>Vjjjj:center<CR>",
                          {noremap = true, silent = true})

  -- Tabs
  vim.api.nvim_set_keymap("n", "te", "<cmd>tab split<CR>", {noremap = true})
  vim.api.nvim_set_keymap("n", "tc", "<cmd>tabclose<CR>", {noremap = true})

  vim.cmd [[ 
    function s:vertopen_url()
        let mycommand = "reader " . shellescape('<cWORD>')
        execute "vertical terminal " . mycommand
    endfunction
    noremap <Plug>vertopen_url : call <SID>vertopen_url()<CR>
    nmap <Leader>gx <Plug>vertopen_url
  ]]

  vim.api.nvim_set_keymap("n", '-', '<cmd>m -2<CR>', {noremap = true})
  vim.api.nvim_set_keymap("n", '_', '<cmd>m +1<CR>', {noremap = true})

  -- Include "dumb" motions in jumplist
  -- See https://medium.com/@kadek/understanding-vims-jump-list-7e1bfc72cdf0
  vim.api.nvim_set_keymap("n", "k",
                          [[(v:count > 1 ? "m'" . v:count : '' ) . 'gk']],
                          {noremap = true, expr = true})
  vim.api.nvim_set_keymap("n", "j",
                          [[(v:count > 1 ? "m'" . v:count : '' ) . 'gj']],
                          {noremap = true, expr = true})

  vim.api.nvim_set_keymap("n", "<Leader>F", "<CMD>FormatWrite<CR>",
                          {noremap = true})

  vim.api.nvim_set_keymap("n", "<F12>", "<CMD>LSoutlineToggle<CR>",
                          {noremap = true})


end
return M
