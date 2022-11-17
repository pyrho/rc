local M = {}

local function find_config_file()
  local opts = {
    search_dirs = {
      require('plenary.path'):new(vim.env.HOME, 'rc', 'nvim'):absolute()
    }
  }

  require('telescope.builtin').find_files(opts)
end

function M.mappings()
  vim.keymap.set('n', 'q', ':q<CR>', { buffer = true })
  vim.keymap.set('n', 'e', ':enew<CR>', { buffer = true })
  vim.keymap.set('n', '0', '<cmd>SessionLoad<CR>', { buffer = true })
  vim.keymap.set('n', 'c', find_config_file, { buffer = true })
  vim.keymap.set('n', 's', require"telescope.builtin".live_grep, { buffer = true })
  vim.keymap.set('n', 'o', require"telescope.builtin".fd, { buffer = true })
  vim.keymap.set('n', 'O', require"telescope.builtin".oldfiles, { buffer = true })
end

function M.configOLD()
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_preview_command = 'cat'
  vim.g.dashboard_preview_pipeline = 'lolcat -S 90'
  vim.g.dashboard_preview_file = vim.env.HOME .. '/.config/nvim/sunjon.cat'
  vim.g.dashboard_preview_file_height = 12
  vim.g.dashboard_preview_file_width = 80

  --       vim.g.dashboard_custom_header = require"pyrho.helpers".mysplit(vim.fn
  --                                                                          .trim [[
  -- =================     ===============     ===============   ========  ========
  -- \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
  -- ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
  -- || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
  -- ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
  -- || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
  -- ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
  -- || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
  -- ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
  -- ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
  -- ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
  -- ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
  -- ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
  -- ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
  -- ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
  -- ||.=='    _-'                                                     `' |  /==.||
  -- =='    _-'                        N E O V I M                         \/   `==
  -- \   _-'                                                                `-_   /
  --  `''                                                                      ``'
  -- ]], "\n")

  -- vim.cmd [[ hi! DashboardHeader gui=bold guifg=#854cc7]]
  --       let g:dashboard_custom_shortcut_icon['last_session'] = ' '
  -- let g:dashboard_custom_shortcut_icon['find_history'] = 'ﭯ '
  -- 'ﭯ '
  -- let g:dashboard_custom_shortcut_icon['find_file'] = ' '
  -- let g:dashboard_custom_shortcut_icon['new_file'] = ' '
  -- let g:dashboard_custom_shortcut_icon['change_colorscheme'] = ' '
  -- let g:dashboard_custom_shortcut_icon['find_word'] = ' '
  -- let g:dashboard_custom_shortcut_icon['book_marks'] = ' '
  function my_custom_picker()
    require"telescope.pickers".new(opts, {
      prompt_title = 'Custom Picker',
      finder = require"telescope.finders".new_table({
        require('plenary.path'):new(vim.env.HOME, '.config', 'nvim_lua',
                                    'init.lua'):absolute()
      }),
      sorter = require"telescope.sorters".fuzzy_with_index_bias()
    }):find()
  end

  local custom_sections = {
    a_browse = {
      description = {'  Browse                                        o'},
      command = require('telescope.builtin').fd
    },
    b_old = {
      description = {'  Old files                                     O'},
      command = require('telescope.builtin').oldfiles
    },
    c_search = {
      description = {'  Grep                                          s'},
      command = require('telescope.builtin').live_grep
    },
    d_new = {
      description = {'  New File                                      e'},
      command = function() vim.cmd "enew" end
    },
    z_nvimconf = {
      description = {'  Browse config                                 c'},
      -- command = find_config_file
      -- command = require('telescope.builtin').live_grep
      command  = function() find_config_file() end
    }
  }

  if require('plenary.path'):new(vim.fn.getcwd(), 'Session.vim'):exists() then
    custom_sections.a_obsess = {
      description = {'  Resume Obsession                              0'},
      command = "source Session.vim"
    }
  end

  vim.g.dashboard_custom_section = custom_sections;
  vim.g.dashboard_disable_statusline = 1

  vim.cmd [[
                augroup MyDashMappingr
                    autocmd!
                    autocmd Filetype dashboard call luaeval('require"pyrho.plugins.conf.dashboard".mappings()')
                augroup END
            ]]
end

function M.config()

  local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  db.preview_command = 'cat | lolcat -S 90'

  db.preview_file_path = home .. '/.config/nvim/sunjon.cat'
  db.preview_file_height = 12
  db.preview_file_width = 80
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently used session                  ',
      shortcut = '0',
      action ='Telescope persisted'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'Telescope oldfiles',
      shortcut = 'O'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'o'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 's'},
      {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope find_files search_dirs=' .. home ..'/rc',
      shortcut = 'c'},
    }

  vim.cmd [[
                augroup MyDashMappingr
                    autocmd!
                    autocmd Filetype dashboard call luaeval('require"pyrho.plugins.conf.dashboard".mappings()')
                augroup END
            ]]
end

return M
