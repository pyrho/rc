return {
  "utilyre/barbecue.nvim",
  lazy = false,
  -- event = "VeryLazy",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" -- optional dependency
  },
  config = function()
    require'barbecue'.setup {theme = 'auto', show_modified = true}
  end,
  dev = false,
}
