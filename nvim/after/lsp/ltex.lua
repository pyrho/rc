return {
  autostart = false,
  on_attach = function(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
    require("ltex_extra").setup()
  end,
  filetypes = { "markdown" },
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/ltex-ls" },
  settings = {
    ltex = {
      diagnosticSeverity = "information",
      language = "en-US",
      additionalRules = {
        motherTongue = "fr",
        languageModel = "~/.ngrams",
      },
    },
  },
}
