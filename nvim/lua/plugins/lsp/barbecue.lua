return {
  "utilyre/barbecue.nvim",
  lazy = false,
  -- event = "VeryLazy",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" -- optional dependency
  },
  config = function()
    require'barbecue'.setup {theme = 'tokyonight', show_modified = true}
  end,
  keys = {{"[[", function() require'pyrho.functions'.parent() end}},
  dev = false,
}
