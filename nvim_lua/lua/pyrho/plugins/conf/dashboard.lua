local M = {}

local function find_config_file()
  local opts = {
    search_dirs = {
      require('plenary.path'):new(vim.env.HOME, 'rc', 'nvim_lua'):absolute()
    }
  }

  require('telescope.builtin').find_files(opts)
end

function M.mappings()
  vim.keymap.nnoremap {'q', ":q<CR>", buffer = true}
  vim.keymap.nnoremap {'e', ":enew<CR>", buffer = true}
  vim.keymap.nnoremap {'0', ":source Session.vim<CR>", buffer = true}
  vim.keymap.nnoremap {'c', find_config_file, buffer = true}
  vim.keymap.nnoremap {'s', require"telescope.builtin".live_grep, buffer = true}
  vim.keymap.nnoremap {'o', require"telescope.builtin".fd, buffer = true}
  vim.keymap.nnoremap {'O', require"telescope.builtin".oldfiles, buffer = true}
end

function M.config()
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
      description = {'  Browse                                  SPC o o'},
      command = require('telescope.builtin').fd
    },
    b_old = {
      description = {'  Old files                               SPC d c'},
      command = require('telescope.builtin').oldfiles
    },
    c_search = {
      description = {'  Grep                                    SPC d g'},
      command = require('telescope.builtin').live_grep
    },
    d_new = {
      description = {'  New File                                SPC d e'},
      command = function() vim.cmd "enew" end
    },
    z_nvimconf = {
      description = {'  Browse config                           SPC d c'},
      -- command = find_config_file
      -- command = require('telescope.builtin').live_grep
      command  = function() find_config_file() end
    }
  }

  if require('plenary.path'):new(vim.fn.getcwd(), 'Session.vim'):exists() then
    custom_sections.a_obsess = {
      description = {'  Resume Obsession                        SPC d o'},
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

return M
