-- Snippets
return {
  'hrsh7th/vim-vsnip',
  event = "InsertEnter",
  config = function()
    vim.g.vsnip_snippet_dir = '~/rc/nvim/snippets'
    vim.g.vsnip_filetypes = {typescriptreact = {'typescript'}}
    --[[ vim.g.vsnip_filetypes.typescriptreact = {'typescript'}
            vim.g.vsnip_filetypes.javascript = {'typescript'} ]]
    -- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
    -- See https://github.com/hrsh7th/vim-vsnip/pull/50
    local opts = {noremap = true, silent = false}
    vim.api
        .nvim_set_keymap("x", "<Leader><Tab>", "<Plug>(vsnip-cut-text)", opts)
  end
}
