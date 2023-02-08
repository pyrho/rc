local M = {}
function M.config()
  vim.fn.sign_define("DiagnosticSignError", {
    texthl = "DiagnosticSignError",
    text = "",
    numhl = "DiagnosticSignError"
  })
  vim.fn.sign_define("DiagnosticSignWarn", {
    texthl = "DiagnosticSignWarn",
    text = "",
    numhl = "DiagnosticSignWarn"
  })
  vim.fn.sign_define("DiagnosticSignHint", {
    texthl = "DiagnosticSignHint",
    text = "",
    numhl = "DiagnosticSignHint"
  })
  vim.fn.sign_define("DiagnosticSignInfo", {
    texthl = "DiagnosticSignInfo",
    text = "",
    numhl = "DiagnosticSignInfo"
  })

end
return M
