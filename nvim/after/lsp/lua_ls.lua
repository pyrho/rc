return {
  on_attach = function(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
