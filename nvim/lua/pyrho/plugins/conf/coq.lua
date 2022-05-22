local M = {}
function M.config()
  -- Use <Tab> and <S-Tab> to navigate through popup menu
  vim.cmd [[
            imap <tab> <Plug>(completion_smart_tab)
            imap <s-tab> <Plug>(completion_smart_s_tab)
            imap <silent> <c-space> <Plug>(completion_trigger)
        ]]

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = "menuone,noinsert,noselect"

  -- Avoid showing message extra message when using completion
  vim.o.shortmess = vim.o.shortmess .. "c"

  -- Chain completion list
  vim.g.completion_chain_complete_list = {
    default = {
      default = {
        {complete_items = {"lsp", "snippet"}}, {mode = "<c-p>"},
        {mode = "<c-n>"}
      },
      comment = {},
      string = {{complete_items = {"path"}}}
    }
  }
  vim.g.completion_confirm_key = ""
end
return M

