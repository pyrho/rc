return {
  'ibhagwan/fzf-lua',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  opts = {winopts = {preview = {layout = 'vertical'}}},
  keys = {
      {"<LEADER>o", "<CMD>FzfLua files<CR>"},
      {"<LEADER>s", "<CMD>FzfLua live_grep<CR>"},
      {"<LEADER>S", "<CMD>FzfLua grep_cword<CR>"},
      {"<LEADER>b", "<CMD>FzfLua buffers<CR>"},
      {"gS", "<CMD>FzfLua lsp_live_workspace_symbols<CR>"},
      {"g0", "<CMD>FzfLua lsp_document_symbols<CR>"},
  }
}
