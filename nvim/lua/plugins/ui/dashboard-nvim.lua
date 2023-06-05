local function find_config_file()
  local opts = {
    search_dirs = {
      require('plenary.path'):new(vim.env.HOME, 'rc', 'nvim'):absolute()
    }
  }

  require('telescope.builtin').find_files(opts)
end

local function mappings()
  vim.keymap.set('n', 'q', ':q<CR>', {buffer = true})
  vim.keymap.set('n', 'e', ':enew<CR>', {buffer = true})
  vim.keymap.set('n', '0', '<cmd>SessionLoad<CR>', {buffer = true})
  vim.keymap.set('n', 'c', find_config_file, {buffer = true})
  vim.keymap
      .set('n', 's', require"telescope.builtin".live_grep, {buffer = true})
  vim.keymap.set('n', 'o', require"telescope.builtin".fd, {buffer = true})
  vim.keymap.set('n', 'O', require"telescope.builtin".oldfiles, {buffer = true})
end

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
                    autocmd Filetype dashboard call luaeval('require"pyrho.plugins.conf.dashboard".mappings()')
                augroup END
            ]]
  end

}
