return {
  'rmagatti/goto-preview',
  event = 'VeryLazy',
  config = function()
    require('goto-preview').setup {}

    vim.keymap.set("n", "gp", function()
      require('goto-preview').goto_preview_definition()
    end, {noremap = true})

    vim.keymap.set("n", "gP", function()
      require('goto-preview').close_all_win()
    end, {noremap = true})

  end
}
