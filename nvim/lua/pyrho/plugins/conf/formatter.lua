local M = {}
function M.config()
  require("formatter").setup({
    logging = false,
    filetype = {
      typescript = {require"formatter.defaults".prettierd},
      typescriptreact = {require"formatter.defaults".prettierd},
      elm = {
        -- luafmt
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
      html = {require"formatter.filetypes.html".prettierd},
      mysql = {
        function()
          return {exe = "sql-formatter", args = {"-lmysql"}, stdin = true}
        end
      }
    }
  })
end
return M
