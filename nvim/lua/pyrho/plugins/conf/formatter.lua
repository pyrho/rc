local M = {}
function M.config()
  require("formatter").setup({
    logging = false,
    filetype = {
      typescript = {require"formatter.defaults".prettierd},
      typescriptreact = {require"formatter.defaults".prettierd},
      elm = {
        function()
          return {exe = "elm-format", args = {"--stdin"}, stdin = true}
        end
      },
      lua = {
        -- luafmt
        function()
          return {exe = "lua-format", args = {"--indent-width=2"}, stdin = true}
        end
      },
      html = {require"formatter.filetypes.html".prettierd}
    }
  })
end
return M
