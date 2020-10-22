lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
  ensure_installed = "typescript" -- one of "all", "language", or a list of languages
}
EOF
