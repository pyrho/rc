
return {
  'pyrho/dashboard-nvim',
  branch = 'feat/remove-session-stuff',
  lazy = false,
  priority = 1000,
  dependencies = { 
      'nvim-lua/telescope.nvim',
      'nvim-lua/plenary.nvim',
  },
  config = function()

    local home = os.getenv('HOME')
    local db = require('dashboard')
    -- macos
    db.preview_command = 'cat | lolcat -S 90'

    db.preview_file_path = home .. '/.config/nvim/sunjon.cat'
    db.preview_file_height = 12
    db.preview_file_width = 80
    db.custom_center = {
      {
        icon = '  ',
        desc = 'Recently used session                  ',
        shortcut = '0',
        action = 'Telescope persisted'
      }, {
        icon = '  ',
        desc = 'Recently opened files                   ',
        action = 'Telescope oldfiles',
        shortcut = 'O'
      }, {
        icon = '  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--hidden,--files',
        shortcut = 'o'
      }, {
        icon = '  ',
        desc = 'Find  word                              ',
        action = 'Telescope live_grep',
        shortcut = 's'
      }, {
        icon = '  ',
        desc = 'Open Personal dotfiles                  ',
        action = 'Telescope find_files search_dirs=' .. home .. '/rc',
        shortcut = 'c'
      }
    }

    vim.cmd [[
                augroup MyDashMappingr
                    autocmd!
                    autocmd Filetype dashboard call luaeval('require"pyrho.mappings".dashboard()')
                augroup END
            ]]
  end

}
