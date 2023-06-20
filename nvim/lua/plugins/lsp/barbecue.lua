return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" -- optional dependency
  },
  opts = {
      theme = 'tokyonight',
      show_modified = true,
  },
  keys = {{"[[", function() require'pyrho.functions'.parent() end}}
}
