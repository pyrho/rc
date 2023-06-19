-- A tab line
return {
  'alvarosevilla95/luatab.nvim',
  lazy = false,
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = function()
    require'luatab'.setup {
      windowCount = function(idx) return idx .. " " end,
      modified = function() return "" end,
      separator = function(idx)
        local s = require('pyrho.helpers').separators.vertical_bar_thin
        return (idx < vim.fn.tabpagenr('$') and '%#TabLine#' .. s or '')
      end
    }
  end
}
