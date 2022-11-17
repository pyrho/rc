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

  -- Files/Buffers/Search
  --[[ vim.api.nvim_set_keymap("n", "<Leader>o", "<cmd>Telescope find_files<CR>",
                          {noremap = true, silent = true}) ]]
  vim.api.nvim_set_keymap("n", "<Leader>o",
                          "<CMD>lua require'pyrho.plugins.conf.telescope'.project_files()<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>Rg<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Buffers<CR>",
                          {noremap = true, silent = true})

  -- Helpers
  vim.api.nvim_set_keymap("n", "<Leader><Leader>x",
                          "<cmd>lua require'pyrho.helpers'.save_and_exec()<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Localleader>k",
                          "<cmd>.!toilet -w80 -f pagga -F border<CR>Vjjjj:center<CR>",
                          {noremap = true, silent = true})

  -- Touchbar fix ;)
  vim.api.nvim_set_keymap("i", "jf", "<Esc>", {noremap = true})
  vim.api.nvim_set_keymap("i", "fj", "<Esc>", {noremap = true})

  -- Misc
  vim.api.nvim_set_keymap("n", "<Leader>w<Leader>w",
                          "<cmd>e ~/repos/perso/Zettelkasten/diary/`date +\\%Y-\\%m-\\%d`.md<CR>",
                          {noremap = true})

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

  vim.api.nvim_set_keymap("n", '-', '<cmd>m -2<CR>', {noremap =true})
  vim.api.nvim_set_keymap("n", '_', '<cmd>m +1<CR>', {noremap =true})

end
return M
