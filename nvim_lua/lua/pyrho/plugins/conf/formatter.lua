local M = {}
function M.config()
  require("formatter").setup({
    logging = false,
    filetype = {
      typescript = {
        -- prettierd
        function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {exe = "lua-format", args = {"--indent-width=2"}, stdin = true}
        end
      }
    }
  })
end
return M
