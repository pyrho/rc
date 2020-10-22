lua require('format').setup()
" Provided by setup function
nnoremap <silent> <localleader>f :Format<CR>


lua <<EOF
require('format').setup({
  typescript = {
      prettier = function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
  },
  lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
})
EOF
