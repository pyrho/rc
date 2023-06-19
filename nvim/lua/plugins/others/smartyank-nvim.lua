return {
  'ibhagwan/smartyank.nvim',
  event = 'VeryLazy',
  config = function()
    require('smartyank').setup {highlight = {enabled = false}}
  end
}
