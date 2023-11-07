return {
  'ggandor/leap.nvim',
  lazy = false,
  config = function()
    require('leap').opts.highlight_unlabeled = true
    require('leap').add_default_mappings()
  end
}
