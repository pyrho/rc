-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/pyrho/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/pyrho/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/pyrho/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/pyrho/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/pyrho/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/beacon.nvim"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\n˚\4\0\0\6\0\30\00056\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\t\0'\1\v\0=\1\n\0006\0\0\0009\0\t\0006\1\0\0009\1\t\0019\1\f\1'\2\r\0&\1\2\1=\1\f\0006\0\0\0009\0\14\0005\1\27\0005\2\21\0004\3\4\0005\4\17\0005\5\16\0=\5\18\4>\4\1\0035\4\19\0>\4\2\0035\4\20\0>\4\3\3=\3\22\0024\3\0\0=\3\23\0024\3\3\0005\4\25\0005\5\24\0=\5\18\4>\4\1\3=\3\26\2=\2\22\1=\1\15\0006\0\0\0009\0\14\0'\1\29\0=\1\28\0K\0\1\0\5\27completion_confirm_key\1\0\0\vstring\1\0\0\1\2\0\0\tpath\fcomment\fdefault\1\0\0\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\3\0\0\blsp\fsnippet#completion_chain_complete_list\6g\6c\14shortmess\30menuone,noinsert,noselect\16completeopt\6o\1\0\2\fnoremap\2\vsilent\2\31<Plug>(completion-trigger)\14<C-Space>\6i\20nvim_set_keymap\bapiy            imap <tab> <Plug>(completion_smart_tab)\n            imap <s-tab> <Plug>(completion_smart_s_tab)\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nÇ\3\0\0\14\0\20\1(6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0005\3\4\0006\4\0\0'\6\5\0B\4\2\0029\4\6\0044\6\3\0006\a\0\0'\t\a\0B\a\2\2\18\t\a\0009\a\2\a6\n\b\0009\n\t\n9\n\n\n'\v\v\0'\f\f\0'\r\r\0B\a\6\2\18\t\a\0009\a\14\aB\a\2\0?\a\0\0B\4\2\2=\4\15\0036\4\0\0'\6\16\0B\4\2\0029\4\17\4B\4\1\2=\4\18\3B\0\3\2\18\2\0\0009\0\19\0B\0\2\1K\0\1\0\tfind\vsorter\26fuzzy_with_index_bias\22telescope.sorters\vfinder\rabsolute\rinit.lua\rnvim_lua\f.config\tHOME\benv\bvim\17plenary.path\14new_table\22telescope.finders\1\0\1\17prompt_title\18Custom Picker\topts\bnew\22telescope.pickers\frequire\3ÄÄ¿ô\4(\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\tenew\bcmd\bvim\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0›\v\1\0\6\0016\0f6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0006\1\0\0009\1\t\0019\1\n\1'\2\v\0&\1\2\1=\1\b\0006\0\0\0009\0\1\0)\1\f\0=\1\f\0006\0\0\0009\0\1\0)\1P\0=\1\r\0003\0\14\0007\0\15\0005\0\23\0005\1\17\0005\2\16\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\21\2=\2\22\1=\1\24\0005\1\26\0005\2\25\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\27\2=\2\22\1=\1\28\0005\1\30\0005\2\29\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\31\2=\2\22\1=\1 \0005\1\"\0005\2!\0=\2\18\0013\2#\0=\2\22\1=\1$\0005\1&\0005\2%\0=\2\18\0013\2'\0=\2\22\1=\1(\0006\1\19\0'\3)\0B\1\2\2\18\3\1\0009\1*\0016\4\0\0009\4+\0049\4,\4B\4\1\2'\5-\0B\1\4\2\18\3\1\0009\1.\1B\1\2\2\15\0\1\0X\2\4Ä5\0011\0005\0020\0=\2\18\1=\1/\0006\1\0\0009\1\1\1=\0002\0016\1\0\0009\1\1\1)\2\1\0=\0023\0016\1\0\0009\0014\1'\0035\0B\1\2\1K\0\1\0\1¿·\1                augroup MyDashMappingr\n                    autocmd!\n                    autocmd Filetype dashboard call luaeval('require\"pyrho.plugins.conf.dashboard\".mappings()')\n                augroup END\n            \bcmd!dashboard_disable_statusline\29dashboard_custom_section\1\0\1\fcommand\23source Session.vim\1\2\0\0009ÔÑå  Resume Obsession                        SPC d o\ra_obsess\vexists\16Session.vim\vgetcwd\afn\bnew\17plenary.path\15z_nvimconf\0\1\0\0\1\2\0\0009Óò´  Browse config                           SPC d c\nd_new\0\1\0\0\1\2\0\0009ÔÖõ  New File                                SPC d e\rc_search\14live_grep\1\0\0\1\2\0\0009Ô°à  Grep                                    SPC d g\nb_old\roldfiles\1\0\0\1\2\0\0009Ôáö  Old files                               SPC d c\ra_browse\1\0\0\fcommand\afd\22telescope.builtin\frequire\16description\1\0\0\1\2\0\0009ÔÖú  Browse                                  SPC o o\21my_custom_picker\0!dashboard_preview_file_width\"dashboard_preview_file_height\29/.config/nvim/sunjon.cat\tHOME\benv\27dashboard_preview_file\17lolcat -S 90\31dashboard_preview_pipeline\bcat\30dashboard_preview_command\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["fern-git-status.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern-git-status.vim"
  },
  ["fern-hijack.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern-hijack.vim"
  },
  ["fern-renderer-nerdfont.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim"
  },
  ["fern.vim"] = {
    config = { "\27LJ\2\n˙\2\0\0\6\0\f\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0√\1    augroup MyFernStuff\n        au!\n        autocmd FileType fern call glyph_palette#apply()\n        autocmd FileType fern :lua require\"pyrho.plugins.conf.fern\".mappings()\n    augroup END\n  \bcmd\rnerdfont\18fern#renderer\6g\1\0\2\fnoremap\2\vsilent\2\30:Fern %:h -reveal=%:p<CR>\14<Leader>f\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern.vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4A\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\f--stdin\1\0\2\nstdin\2\bexe\15elm-formatJ\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\21--indent-width=2\1\0\2\nstdin\2\bexe\15lua-formatl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4∑\1\1\0\6\0\14\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\0034\4\3\0003\5\t\0>\5\1\4=\4\n\0034\4\3\0003\5\v\0>\5\1\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\rfiletype\thtml\0\blua\0\belm\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["fugitive-gitlab.vim"] = {
    commands = { "GBrowse" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/fugitive-gitlab.vim"
  },
  ["glyph-palette.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/glyph-palette.vim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    config = { "\27LJ\2\n1\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\b70%\16goyo_height\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  kommentary = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\30lexima_enable_basic_rules\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\27smart_scroll_with_saga\19lspsaga.action\frequireQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2ˇˇB\0\2\1K\0\1\0\27smart_scroll_with_saga\19lspsaga.action\frequireﬂ\5\1\0\6\0\29\0]6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\a\0006\3\0\0'\5\b\0B\3\2\0029\3\t\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\n\0006\3\0\0'\5\v\0B\3\2\0029\3\f\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\r\0006\3\0\0'\5\14\0B\3\2\0029\3\15\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\16\0003\3\17\0>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\18\0003\3\19\0>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\20\0006\3\0\0'\5\b\0B\3\2\0029\3\21\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\22\0006\3\0\0'\5\23\0B\3\2\0029\3\24\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\25\0006\3\0\0'\5\23\0B\3\2\0029\3\26\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\27\0006\3\0\0'\5\23\0B\3\2\0029\3\28\3>\3\2\2B\0\2\1K\0\1\0\29lsp_jump_diagnostic_next\1\2\0\0\a]e\29lsp_jump_diagnostic_prev\1\2\0\0\a[e\28show_cursor_diagnostics\23lspsaga.diagnostic\1\2\0\0\acc\23preview_definition\1\2\0\0\15<Leader>gd\0\1\2\0\0\n<C-b>\0\1\2\0\0\n<C-f>\21render_hover_doc\18lspsaga.hover\1\2\0\0\6K\16code_action\23lspsaga.codeaction\1\2\0\0\15<Leader>ca\15lsp_finder\21lspsaga.provider\1\2\0\0\agh\rnnoremap\vkeymap\bvim\22astronauta.keymap\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nå\1\0\0\3\0\6\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\2\6\0\4\0X\1\aÄ\n\0\0\0X\1\5Ä'\1\5\0\18\2\0\0&\1\2\1L\1\2\0X\1\2Ä'\1\4\0L\1\2\0K\0\1\0\tÔûî \5\1\0\1\19indicator_size\3d\15statusline\20nvim-treesitter\frequireå\1\0\0\6\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\0026\3\3\0009\3\4\0039\3\5\3'\5\a\0B\3\2\0025\4\b\0D\0\4\0\1\0\1\fdefault\2\b%:e\b%:t\vexpand\afn\bvim\rget_icon\22nvim-web-devicons\frequirec\0\0\4\0\5\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\2\21\1\0\0)\2\0\0\1\2\1\0X\1\2ÄL\0\2\0X\1\2Ä'\1\4\0L\1\2\0K\0\1\0\tÔ£• \bÔ§å\20ObsessionStatus\afn\bvimY\0\0\5\0\6\0\f'\0\0\0006\1\1\0009\1\2\0019\1\3\0016\3\1\0009\3\2\0039\3\4\3B\3\1\2'\4\5\0B\1\3\2&\0\1\0L\0\2\0\a:t\vgetcwd\16fnamemodify\afn\bvim\tÓóæ 5\0\0\2\0\4\0\a6\0\0\0009\0\1\0009\0\2\0B\0\1\2'\1\3\0&\0\1\0L\0\2\0\5\14tabpagenr\afn\bvim\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\tÓüÖ  \0\0\3\1\1\0\5'\0\0\0-\1\0\0B\1\1\2&\0\1\0L\0\2\0\0¿\a%=Ü\b\1\0\14\0006\0e3\0\0\0003\1\1\0003\2\2\0003\3\3\0003\4\4\0006\5\5\0'\a\6\0B\5\2\0029\5\a\0055\a\17\0005\b\t\0005\t\b\0=\t\n\b5\t\v\0=\t\f\b5\t\r\0=\t\14\b5\t\15\0=\t\16\b=\b\18\a5\b\20\0004\t\3\0003\n\19\0>\n\1\t=\t\21\b4\t\3\0>\4\1\t=\t\22\b4\t\3\0005\n\25\0003\v\23\0>\v\1\n5\v\24\0=\v\26\n>\n\1\t=\t\27\b4\t\0\0=\t\28\b4\t\0\0=\t\29\b4\t\3\0>\3\1\t=\t\30\b=\b\31\a5\b!\0005\t \0=\t\21\b5\t\"\0005\n#\0006\v\5\0'\r$\0B\v\2\0029\v\a\vB\v\1\0029\v%\v9\v&\v=\v'\n6\v\5\0'\r$\0B\v\2\0029\v\a\vB\v\1\0029\v%\v9\v(\v=\v)\n6\v\5\0'\r$\0B\v\2\0029\v\a\vB\v\1\0029\v%\v9\v*\v=\v+\n5\v,\0=\v-\n>\n\2\t=\t\22\b4\t\3\0005\n.\0>\n\1\t=\t\27\b4\t\0\0=\t\28\b4\t\3\0>\2\1\t5\n/\0005\v0\0=\v1\n5\v2\0=\v3\n5\v4\0=\v-\n>\n\2\t=\t\29\b5\t5\0>\1\1\t=\t\30\b=\b3\aB\5\2\0012\0\0ÄK\0\1\0\1\4\0\0\0\rprogress\rlocation\1\0\4\nerror\tÔÅó \twarn\tÔÅ± \tinfo\tÔÅö \thint\tÔÅ™ \rsections\1\5\0\0\nerror\twarn\tinfo\thint\fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\1\2\2\0\rfilename\16file_status\2\tpath\3\1\fsymbols\1\0\3\fremoved\6-\rmodified\6~\nadded\6+\18color_removed\vdelete\19color_modified\vchange\16color_added\badd\bgit\22tokyonight.colors\1\2\1\0\tdiff\fcolored\2\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\ftabline\14lualine_z\14lualine_y\14lualine_x\14lualine_c\ncolor\1\0\0\1\0\2\bgui\vitalic\afg\f#2ac3de\0\14lualine_b\14lualine_a\1\0\0\0\foptions\1\0\0\23disabled_filetypes\1\2\0\0\14dashboard\15extensions\1\2\0\0\rfugitive\25component_separators\1\3\0\0\bÓÇπ\bÓÇø\23section_separators\1\0\1\ntheme\15tokyonight\1\3\0\0\bÓÇ∏\bÓÇæ\nsetup\flualine\frequire\0\0\0\0\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
  },
  ["nerveux.nvim"] = {
    config = { "\27LJ\2\nì\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\14use_cache\2\17start_daemon\2\24kill_daemon_at_exit\2\19virtual_titles\2\28create_default_mappings\2\nsetup\fnerveux\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nerveux.nvim"
  },
  nrrwrgn = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nrrwrgn"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nó\4\0\0\4\0\v\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\3\nnumhl\"LspDiagnosticsSignInformation\ttext\bÔÅö\vtexthl\"LspDiagnosticsSignInformation\"LspDiagnosticsSignInformation\1\0\3\nnumhl\27LspDiagnosticsSignHint\ttext\bÔÅ™\vtexthl\27LspDiagnosticsSignHint\27LspDiagnosticsSignHint\1\0\3\nnumhl\30LspDiagnosticsSignWarning\ttext\bÔÅ±\vtexthl\30LspDiagnosticsSignWarning\30LspDiagnosticsSignWarning\1\0\3\nnumhl\28LspDiagnosticsSignError\ttext\bÔÅó\vtexthl\28LspDiagnosticsSignError\28LspDiagnosticsSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvimÇ\1\0\0\3\0\b\0\0186\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\5\0009\0\6\0009\0\a\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\14:wincmd _\14:wincmd j\b:sp\bcmd\bvimœ\4\1\2\v\0\23\0/3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0006\5\5\0009\5\6\0059\5\a\0055\a\b\0006\b\5\0009\b\t\b9\b\n\b9\b\v\b>\b\2\aB\5\2\0016\5\5\0009\5\6\0059\5\a\0055\a\f\0006\b\5\0009\b\t\b9\b\n\b9\b\r\b>\b\2\aB\5\2\0016\5\5\0009\5\6\0059\5\a\0055\a\14\0003\b\15\0>\b\2\aB\5\2\1\18\5\2\0'\a\16\0'\b\17\0'\t\18\0\18\n\4\0B\5\5\0016\5\19\0'\a\20\0B\5\2\0025\6\22\0=\6\21\0052\0\0ÄK\0\1\0\1\26\0\0\bÔûÉ\a∆í\a∆í\bÓàè\bÔßº\tùëã\bÓÉç\bÔÖê\bÔ£ñ\rProperty\tUnit\nValue\bÔ¶∫\bÔ†Ö\bÔ¨å\nColor\bÔÖõ\14Reference\bÔÑï\bÔÖù\bÓà¨\bÔÉä\nEvent\rOperator\18TypeParameter\23CompletionItemKind\21vim.lsp.protocol\frequire2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q\6n\0\1\2\1\0\15<leader>gs\vbuffer\2\15definition\1\2\1\0\agd\vsilent\2\16declaration\bbuf\blsp\1\2\1\0\agD\vsilent\2\rnnoremap\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0ø\1\0\0\3\1\v\0\0156\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0015\1\b\0=\0\t\1-\2\0\0=\2\n\1L\1\2\0\2¿\14on_attach\17capabilities\1\0\0\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvimÀ\1\0\0\n\2\b\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\0026\1\4\0\18\3\0\0B\1\2\4H\4\rÄ-\6\0\0B\6\1\2\a\5\5\0X\a\2Ä-\a\1\0=\a\6\0066\a\0\0'\t\a\0B\a\2\0028\a\5\a9\a\2\a\18\t\6\0B\a\2\1F\4\3\3R\4ÒK\0\1\0\3¿\0¿\14lspconfig\rsettings\blua\npairs\22installed_servers\nsetup\15lspinstall\frequireÑ\3\1\0\a\0\26\0,5\0\19\0005\1\6\0005\2\0\0006\3\1\0009\3\2\0036\5\3\0009\5\4\5'\6\5\0B\3\3\2=\3\4\2=\2\a\0015\2\t\0005\3\b\0=\3\n\2=\2\v\0015\2\16\0004\3\0\b6\4\1\0009\4\f\0049\4\r\4'\6\14\0B\4\2\2+\5\2\0<\5\4\0036\4\1\0009\4\f\0049\4\r\4'\6\15\0B\4\2\2+\5\2\0<\5\4\3=\3\17\2=\2\18\1=\1\20\0006\1\21\0'\3\22\0B\1\2\0023\2\23\0003\3\24\0003\4\25\0\18\5\4\0B\5\1\0012\0\0ÄK\0\1\0\0\0\0\14lspconfig\frequire\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\6\0\0\bvim\rdescribe\ait\tdump\buse\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n†\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\21ensure_installed\15maintained\fdisable\1\3\0\0\6c\trust\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    config = { "\27LJ\2\nã\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rrefactor\1\0\0\28highlight_current_scope\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\nÌ\3\0\0\a\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\n\0005\5\v\0005\6\f\0=\6\r\5=\5\14\4=\4\15\3=\3\17\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\fkeymaps\aiF\1\0\4\6c$(function_definition) @function\vpython$(function_definition) @function\bcpp$(function_definition) @function\tjava#(method_declaration) @function\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\1\venable\2\tmove\1\0\0\24goto_previous_start\1\0\1\a[[\20@function.outer\20goto_next_start\1\0\1\a]]\20@function.outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pgsql.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/pgsql.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup-menu.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/popup-menu.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/snippets.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÜ\5\0\0\6\0\26\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\23\0'\4\24\0005\5\25\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2,<cmd>Telescope lsp_document_symbols<CR>\ag0\1\0\2\fnoremap\2\vsilent\2\31<cmd>Telescope buffers<CR>\14<Leader>b\1\0\2\fnoremap\2\vsilent\2K<cmd>lua require('telescope.builtin').live_grep({ cwd =  'src'  })<CR>\14<Leader>s\1\0\2\fnoremap\2\vsilent\2N<cmd>lua require('telescope.builtin').find_files({ previewer=false })<CR>\14<Leader>o\6n\20nvim_set_keymap\bapi\bvim\fpickers\1\0\0\15find_files\1\0\1\ntheme\rdropdown\fbuffers\1\0\0\1\0\2\18sort_lastused\2\ntheme\rdropdown\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\nô\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\1\15navigation\1\0\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/tmux.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nÊ\3\0\0\3\0\19\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\15\0\0\0X\1\5Ä6\0\3\0009\0\4\0'\1\6\0=\1\5\0X\0\4Ä6\0\3\0009\0\4\0'\1\a\0=\1\5\0006\0\3\0009\0\b\0'\1\n\0=\1\t\0006\0\3\0009\0\b\0)\1\0\0=\1\v\0006\0\3\0009\0\b\0)\1\0\0=\1\f\0006\0\3\0009\0\b\0)\1\0\0=\1\r\0006\0\3\0009\0\b\0005\1\15\0=\1\14\0006\0\3\0009\0\b\0+\1\2\0=\1\16\0006\0\3\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0\29 colorscheme tokyonight \bcmd(tokyonight_hide_inactive_statusline\1\a\0\0\aqf\15vista_kind\vpacker\tdefx\18lspsagafinder\tfern\24tokyonight_sidebars tokyonight_italic_variables\31tokyonight_italic_keywords tokyonight_italic_functions\nstorm\21tokyonight_style\6g\tdark\nlight\15background\6o\bvim\vis_zen\18pyrho.helpers\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nº\3\0\0\6\0\16\1!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\5\0006\0\0\0009\0\1\0*\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\2\0=\1\a\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\0\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0á\1                inoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n                tnoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n        \bcmd\1\0\1\fnoremap\2\24:FloatermToggle<CR>\n<C-t>\6n\20nvim_set_keymap\bapi\23floaterm_autoclose\20floaterm_height\19floaterm_width\22floaterm_winblend\vcenter\22floaterm_position\6g\bvimõ≥ÊÃ\25Ãô≥ˇ\3\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\nö\2\0\0\2\0\f\0\0256\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\4\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0K\0\1\0\b‚ñã$gitgutter_sign_modified_removed\b‚ñî&gitgutter_sign_removed_first_line\b‚ñè\27gitgutter_sign_removed\28gitgutter_sign_modified\b‚ñé\25gitgutter_sign_added\23gitgutter_map_keys\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-http-client"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-http-client"
  },
  ["vim-js-indent"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-js-indent"
  },
  ["vim-json"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json"
  },
  ["vim-just"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-just"
  },
  ["vim-mark"] = {
    config = { "\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\19:MarkClear<CR>\14<Leader>N\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-mark"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-rhubarb"] = {
    commands = { "GBrowse" },
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0002 runtime macros/sandwich/keymap/surround.vim \bcmd\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-slash"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-slash"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\16sneak#label\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-yaml"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-yaml"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: lualine.nvim
time([[Setup for lualine.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\28tokyonight_lualine_bold\6g\bvim\0", "setup", "lualine.nvim")
time([[Setup for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nó\4\0\0\4\0\v\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\3\nnumhl\"LspDiagnosticsSignInformation\ttext\bÔÅö\vtexthl\"LspDiagnosticsSignInformation\"LspDiagnosticsSignInformation\1\0\3\nnumhl\27LspDiagnosticsSignHint\ttext\bÔÅ™\vtexthl\27LspDiagnosticsSignHint\27LspDiagnosticsSignHint\1\0\3\nnumhl\30LspDiagnosticsSignWarning\ttext\bÔÅ±\vtexthl\30LspDiagnosticsSignWarning\30LspDiagnosticsSignWarning\1\0\3\nnumhl\28LspDiagnosticsSignError\ttext\bÔÅó\vtexthl\28LspDiagnosticsSignError\28LspDiagnosticsSignError\16sign_define\afn\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
try_loadstring("\27LJ\2\nö\2\0\0\2\0\f\0\0256\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\4\0=\1\5\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0K\0\1\0\b‚ñã$gitgutter_sign_modified_removed\b‚ñî&gitgutter_sign_removed_first_line\b‚ñè\27gitgutter_sign_removed\28gitgutter_sign_modified\b‚ñé\25gitgutter_sign_added\23gitgutter_map_keys\6g\bvim\0", "config", "vim-gitgutter")
time([[Config for vim-gitgutter]], false)
-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvimÇ\1\0\0\3\0\b\0\0186\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\5\0009\0\6\0009\0\a\0B\0\1\1K\0\1\0\15definition\bbuf\blsp\14:wincmd _\14:wincmd j\b:sp\bcmd\bvimœ\4\1\2\v\0\23\0/3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0006\5\5\0009\5\6\0059\5\a\0055\a\b\0006\b\5\0009\b\t\b9\b\n\b9\b\v\b>\b\2\aB\5\2\0016\5\5\0009\5\6\0059\5\a\0055\a\f\0006\b\5\0009\b\t\b9\b\n\b9\b\r\b>\b\2\aB\5\2\0016\5\5\0009\5\6\0059\5\a\0055\a\14\0003\b\15\0>\b\2\aB\5\2\1\18\5\2\0'\a\16\0'\b\17\0'\t\18\0\18\n\4\0B\5\5\0016\5\19\0'\a\20\0B\5\2\0025\6\22\0=\6\21\0052\0\0ÄK\0\1\0\1\26\0\0\bÔûÉ\a∆í\a∆í\bÓàè\bÔßº\tùëã\bÓÉç\bÔÖê\bÔ£ñ\rProperty\tUnit\nValue\bÔ¶∫\bÔ†Ö\bÔ¨å\nColor\bÔÖõ\14Reference\bÔÑï\bÔÖù\bÓà¨\bÔÉä\nEvent\rOperator\18TypeParameter\23CompletionItemKind\21vim.lsp.protocol\frequire2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q\6n\0\1\2\1\0\15<leader>gs\vbuffer\2\15definition\1\2\1\0\agd\vsilent\2\16declaration\bbuf\blsp\1\2\1\0\agD\vsilent\2\rnnoremap\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0ø\1\0\0\3\1\v\0\0156\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0015\1\b\0=\0\t\1-\2\0\0=\2\n\1L\1\2\0\2¿\14on_attach\17capabilities\1\0\0\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvimÀ\1\0\0\n\2\b\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\0026\1\4\0\18\3\0\0B\1\2\4H\4\rÄ-\6\0\0B\6\1\2\a\5\5\0X\a\2Ä-\a\1\0=\a\6\0066\a\0\0'\t\a\0B\a\2\0028\a\5\a9\a\2\a\18\t\6\0B\a\2\1F\4\3\3R\4ÒK\0\1\0\3¿\0¿\14lspconfig\rsettings\blua\npairs\22installed_servers\nsetup\15lspinstall\frequireÑ\3\1\0\a\0\26\0,5\0\19\0005\1\6\0005\2\0\0006\3\1\0009\3\2\0036\5\3\0009\5\4\5'\6\5\0B\3\3\2=\3\4\2=\2\a\0015\2\t\0005\3\b\0=\3\n\2=\2\v\0015\2\16\0004\3\0\b6\4\1\0009\4\f\0049\4\r\4'\6\14\0B\4\2\2+\5\2\0<\5\4\0036\4\1\0009\4\f\0049\4\r\4'\6\15\0B\4\2\2+\5\2\0<\5\4\3=\3\17\2=\2\18\1=\1\20\0006\1\21\0'\3\22\0B\1\2\0023\2\23\0003\3\24\0003\4\25\0\18\5\4\0B\5\1\0012\0\0ÄK\0\1\0\0\0\0\14lspconfig\frequire\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\6\0\0\bvim\rdescribe\ait\tdump\buse\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0", "config", "nvim-lspinstall")
time([[Config for nvim-lspinstall]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n†\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\21ensure_installed\15maintained\fdisable\1\3\0\0\6c\trust\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-treesitter-refactor
time([[Config for nvim-treesitter-refactor]], true)
try_loadstring("\27LJ\2\nã\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rrefactor\1\0\0\28highlight_current_scope\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-refactor")
time([[Config for nvim-treesitter-refactor]], false)
-- Config for: vim-mark
time([[Config for vim-mark]], true)
try_loadstring("\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\19:MarkClear<CR>\14<Leader>N\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-mark")
time([[Config for vim-mark]], false)
-- Config for: lexima.vim
time([[Config for lexima.vim]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\30lexima_enable_basic_rules\6g\bvim\0", "config", "lexima.vim")
time([[Config for lexima.vim]], false)
-- Config for: completion-nvim
time([[Config for completion-nvim]], true)
try_loadstring("\27LJ\2\n˚\4\0\0\6\0\30\00056\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\t\0'\1\v\0=\1\n\0006\0\0\0009\0\t\0006\1\0\0009\1\t\0019\1\f\1'\2\r\0&\1\2\1=\1\f\0006\0\0\0009\0\14\0005\1\27\0005\2\21\0004\3\4\0005\4\17\0005\5\16\0=\5\18\4>\4\1\0035\4\19\0>\4\2\0035\4\20\0>\4\3\3=\3\22\0024\3\0\0=\3\23\0024\3\3\0005\4\25\0005\5\24\0=\5\18\4>\4\1\3=\3\26\2=\2\22\1=\1\15\0006\0\0\0009\0\14\0'\1\29\0=\1\28\0K\0\1\0\5\27completion_confirm_key\1\0\0\vstring\1\0\0\1\2\0\0\tpath\fcomment\fdefault\1\0\0\1\0\1\tmode\n<c-n>\1\0\1\tmode\n<c-p>\19complete_items\1\0\0\1\3\0\0\blsp\fsnippet#completion_chain_complete_list\6g\6c\14shortmess\30menuone,noinsert,noselect\16completeopt\6o\1\0\2\fnoremap\2\vsilent\2\31<Plug>(completion-trigger)\14<C-Space>\6i\20nvim_set_keymap\bapiy            imap <tab> <Plug>(completion_smart_tab)\n            imap <s-tab> <Plug>(completion_smart_s_tab)\n        \bcmd\bvim\0", "config", "completion-nvim")
time([[Config for completion-nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\27smart_scroll_with_saga\19lspsaga.action\frequireQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2ˇˇB\0\2\1K\0\1\0\27smart_scroll_with_saga\19lspsaga.action\frequireﬂ\5\1\0\6\0\29\0]6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\a\0006\3\0\0'\5\b\0B\3\2\0029\3\t\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\n\0006\3\0\0'\5\v\0B\3\2\0029\3\f\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\r\0006\3\0\0'\5\14\0B\3\2\0029\3\15\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\16\0003\3\17\0>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\18\0003\3\19\0>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\20\0006\3\0\0'\5\b\0B\3\2\0029\3\21\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\22\0006\3\0\0'\5\23\0B\3\2\0029\3\24\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\25\0006\3\0\0'\5\23\0B\3\2\0029\3\26\3>\3\2\2B\0\2\0016\0\4\0009\0\5\0009\0\6\0005\2\27\0006\3\0\0'\5\23\0B\3\2\0029\3\28\3>\3\2\2B\0\2\1K\0\1\0\29lsp_jump_diagnostic_next\1\2\0\0\a]e\29lsp_jump_diagnostic_prev\1\2\0\0\a[e\28show_cursor_diagnostics\23lspsaga.diagnostic\1\2\0\0\acc\23preview_definition\1\2\0\0\15<Leader>gd\0\1\2\0\0\n<C-b>\0\1\2\0\0\n<C-f>\21render_hover_doc\18lspsaga.hover\1\2\0\0\6K\16code_action\23lspsaga.codeaction\1\2\0\0\15<Leader>ca\15lsp_finder\21lspsaga.provider\1\2\0\0\agh\rnnoremap\vkeymap\bvim\22astronauta.keymap\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\nô\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\1\15navigation\1\0\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nÊ\3\0\0\3\0\19\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\15\0\0\0X\1\5Ä6\0\3\0009\0\4\0'\1\6\0=\1\5\0X\0\4Ä6\0\3\0009\0\4\0'\1\a\0=\1\5\0006\0\3\0009\0\b\0'\1\n\0=\1\t\0006\0\3\0009\0\b\0)\1\0\0=\1\v\0006\0\3\0009\0\b\0)\1\0\0=\1\f\0006\0\3\0009\0\b\0)\1\0\0=\1\r\0006\0\3\0009\0\b\0005\1\15\0=\1\14\0006\0\3\0009\0\b\0+\1\2\0=\1\16\0006\0\3\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0\29 colorscheme tokyonight \bcmd(tokyonight_hide_inactive_statusline\1\a\0\0\aqf\15vista_kind\vpacker\tdefx\18lspsagafinder\tfern\24tokyonight_sidebars tokyonight_italic_variables\31tokyonight_italic_keywords tokyonight_italic_functions\nstorm\21tokyonight_style\6g\tdark\nlight\15background\6o\bvim\vis_zen\18pyrho.helpers\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4A\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\f--stdin\1\0\2\nstdin\2\bexe\15elm-formatJ\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\21--indent-width=2\1\0\2\nstdin\2\bexe\15lua-formatl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4∑\1\1\0\6\0\14\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\0034\4\3\0003\5\t\0>\5\1\4=\4\n\0034\4\3\0003\5\v\0>\5\1\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\rfiletype\thtml\0\blua\0\belm\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: vim-sandwich
time([[Config for vim-sandwich]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0002 runtime macros/sandwich/keymap/surround.vim \bcmd\bvim\0", "config", "vim-sandwich")
time([[Config for vim-sandwich]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nº\3\0\0\6\0\16\1!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\5\0006\0\0\0009\0\1\0*\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\2\0=\1\a\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\0\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0á\1                inoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n                tnoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n        \bcmd\1\0\1\fnoremap\2\24:FloatermToggle<CR>\n<C-t>\6n\20nvim_set_keymap\bapi\23floaterm_autoclose\20floaterm_height\19floaterm_width\22floaterm_winblend\vcenter\22floaterm_position\6g\bvimõ≥ÊÃ\25Ãô≥ˇ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: nerveux.nvim
time([[Config for nerveux.nvim]], true)
try_loadstring("\27LJ\2\nì\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\14use_cache\2\17start_daemon\2\24kill_daemon_at_exit\2\19virtual_titles\2\28create_default_mappings\2\nsetup\fnerveux\frequire\0", "config", "nerveux.nvim")
time([[Config for nerveux.nvim]], false)
-- Config for: fern.vim
time([[Config for fern.vim]], true)
try_loadstring("\27LJ\2\n˙\2\0\0\6\0\f\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0√\1    augroup MyFernStuff\n        au!\n        autocmd FileType fern call glyph_palette#apply()\n        autocmd FileType fern :lua require\"pyrho.plugins.conf.fern\".mappings()\n    augroup END\n  \bcmd\rnerdfont\18fern#renderer\6g\1\0\2\fnoremap\2\vsilent\2\30:Fern %:h -reveal=%:p<CR>\14<Leader>f\6n\20nvim_set_keymap\bapi\bvim\0", "config", "fern.vim")
time([[Config for fern.vim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\nÌ\3\0\0\a\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\b\0005\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\n\0005\5\v\0005\6\f\0=\6\r\5=\5\14\4=\4\15\3=\3\17\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\fkeymaps\aiF\1\0\4\6c$(function_definition) @function\vpython$(function_definition) @function\bcpp$(function_definition) @function\tjava#(method_declaration) @function\1\0\4\aac\17@class.outer\aaf\20@function.outer\aif\20@function.inner\aic\17@class.inner\1\0\1\venable\2\tmove\1\0\0\24goto_previous_start\1\0\1\a[[\20@function.outer\20goto_next_start\1\0\1\a]]\20@function.outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: vim-sneak
time([[Config for vim-sneak]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\16sneak#label\6g\bvim\0", "config", "vim-sneak")
time([[Config for vim-sneak]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÜ\5\0\0\6\0\26\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\23\0'\4\24\0005\5\25\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2,<cmd>Telescope lsp_document_symbols<CR>\ag0\1\0\2\fnoremap\2\vsilent\2\31<cmd>Telescope buffers<CR>\14<Leader>b\1\0\2\fnoremap\2\vsilent\2K<cmd>lua require('telescope.builtin').live_grep({ cwd =  'src'  })<CR>\14<Leader>s\1\0\2\fnoremap\2\vsilent\2N<cmd>lua require('telescope.builtin').find_files({ previewer=false })<CR>\14<Leader>o\6n\20nvim_set_keymap\bapi\bvim\fpickers\1\0\0\15find_files\1\0\1\ntheme\rdropdown\fbuffers\1\0\0\1\0\2\18sort_lastused\2\ntheme\rdropdown\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\nÇ\3\0\0\14\0\20\1(6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0005\3\4\0006\4\0\0'\6\5\0B\4\2\0029\4\6\0044\6\3\0006\a\0\0'\t\a\0B\a\2\2\18\t\a\0009\a\2\a6\n\b\0009\n\t\n9\n\n\n'\v\v\0'\f\f\0'\r\r\0B\a\6\2\18\t\a\0009\a\14\aB\a\2\0?\a\0\0B\4\2\2=\4\15\0036\4\0\0'\6\16\0B\4\2\0029\4\17\4B\4\1\2=\4\18\3B\0\3\2\18\2\0\0009\0\19\0B\0\2\1K\0\1\0\tfind\vsorter\26fuzzy_with_index_bias\22telescope.sorters\vfinder\rabsolute\rinit.lua\rnvim_lua\f.config\tHOME\benv\bvim\17plenary.path\14new_table\22telescope.finders\1\0\1\17prompt_title\18Custom Picker\topts\bnew\22telescope.pickers\frequire\3ÄÄ¿ô\4(\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\tenew\bcmd\bvim\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0›\v\1\0\6\0016\0f6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0006\1\0\0009\1\t\0019\1\n\1'\2\v\0&\1\2\1=\1\b\0006\0\0\0009\0\1\0)\1\f\0=\1\f\0006\0\0\0009\0\1\0)\1P\0=\1\r\0003\0\14\0007\0\15\0005\0\23\0005\1\17\0005\2\16\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\21\2=\2\22\1=\1\24\0005\1\26\0005\2\25\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\27\2=\2\22\1=\1\28\0005\1\30\0005\2\29\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\31\2=\2\22\1=\1 \0005\1\"\0005\2!\0=\2\18\0013\2#\0=\2\22\1=\1$\0005\1&\0005\2%\0=\2\18\0013\2'\0=\2\22\1=\1(\0006\1\19\0'\3)\0B\1\2\2\18\3\1\0009\1*\0016\4\0\0009\4+\0049\4,\4B\4\1\2'\5-\0B\1\4\2\18\3\1\0009\1.\1B\1\2\2\15\0\1\0X\2\4Ä5\0011\0005\0020\0=\2\18\1=\1/\0006\1\0\0009\1\1\1=\0002\0016\1\0\0009\1\1\1)\2\1\0=\0023\0016\1\0\0009\0014\1'\0035\0B\1\2\1K\0\1\0\1¿·\1                augroup MyDashMappingr\n                    autocmd!\n                    autocmd Filetype dashboard call luaeval('require\"pyrho.plugins.conf.dashboard\".mappings()')\n                augroup END\n            \bcmd!dashboard_disable_statusline\29dashboard_custom_section\1\0\1\fcommand\23source Session.vim\1\2\0\0009ÔÑå  Resume Obsession                        SPC d o\ra_obsess\vexists\16Session.vim\vgetcwd\afn\bnew\17plenary.path\15z_nvimconf\0\1\0\0\1\2\0\0009Óò´  Browse config                           SPC d c\nd_new\0\1\0\0\1\2\0\0009ÔÖõ  New File                                SPC d e\rc_search\14live_grep\1\0\0\1\2\0\0009Ô°à  Grep                                    SPC d g\nb_old\roldfiles\1\0\0\1\2\0\0009Ôáö  Old files                               SPC d c\ra_browse\1\0\0\fcommand\afd\22telescope.builtin\frequire\16description\1\0\0\1\2\0\0009ÔÖú  Browse                                  SPC o o\21my_custom_picker\0!dashboard_preview_file_width\"dashboard_preview_file_height\29/.config/nvim/sunjon.cat\tHOME\benv\27dashboard_preview_file\17lolcat -S 90\31dashboard_preview_pipeline\bcat\30dashboard_preview_command\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Conditional loads
time("Condition for { 'lualine.nvim' }", true)
if
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\19\0\0\0L\0\2\0\vis_zen\18pyrho.helpers\frequire\0", "condition", '{ "lualine.nvim" }')
then
time("Condition for { 'lualine.nvim' }", false)
time([[packadd for lualine.nvim]], true)
		vim.cmd [[packadd lualine.nvim]]
	time([[packadd for lualine.nvim]], false)
	-- Config for: lualine.nvim
	time([[Config for lualine.nvim]], true)
	try_loadstring("\27LJ\2\nå\1\0\0\3\0\6\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\2\6\0\4\0X\1\aÄ\n\0\0\0X\1\5Ä'\1\5\0\18\2\0\0&\1\2\1L\1\2\0X\1\2Ä'\1\4\0L\1\2\0K\0\1\0\tÔûî \5\1\0\1\19indicator_size\3d\15statusline\20nvim-treesitter\frequireå\1\0\0\6\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\0026\3\3\0009\3\4\0039\3\5\3'\5\a\0B\3\2\0025\4\b\0D\0\4\0\1\0\1\fdefault\2\b%:e\b%:t\vexpand\afn\bvim\rget_icon\22nvim-web-devicons\frequirec\0\0\4\0\5\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\2\21\1\0\0)\2\0\0\1\2\1\0X\1\2ÄL\0\2\0X\1\2Ä'\1\4\0L\1\2\0K\0\1\0\tÔ£• \bÔ§å\20ObsessionStatus\afn\bvimY\0\0\5\0\6\0\f'\0\0\0006\1\1\0009\1\2\0019\1\3\0016\3\1\0009\3\2\0039\3\4\3B\3\1\2'\4\5\0B\1\3\2&\0\1\0L\0\2\0\a:t\vgetcwd\16fnamemodify\afn\bvim\tÓóæ 5\0\0\2\0\4\0\a6\0\0\0009\0\1\0009\0\2\0B\0\1\2'\1\3\0&\0\1\0L\0\2\0\5\14tabpagenr\afn\bvim\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\tÓüÖ  \0\0\3\1\1\0\5'\0\0\0-\1\0\0B\1\1\2&\0\1\0L\0\2\0\0¿\a%=Ü\b\1\0\14\0006\0e3\0\0\0003\1\1\0003\2\2\0003\3\3\0003\4\4\0006\5\5\0'\a\6\0B\5\2\0029\5\a\0055\a\17\0005\b\t\0005\t\b\0=\t\n\b5\t\v\0=\t\f\b5\t\r\0=\t\14\b5\t\15\0=\t\16\b=\b\18\a5\b\20\0004\t\3\0003\n\19\0>\n\1\t=\t\21\b4\t\3\0>\4\1\t=\t\22\b4\t\3\0005\n\25\0003\v\23\0>\v\1\n5\v\24\0=\v\26\n>\n\1\t=\t\27\b4\t\0\0=\t\28\b4\t\0\0=\t\29\b4\t\3\0>\3\1\t=\t\30\b=\b\31\a5\b!\0005\t \0=\t\21\b5\t\"\0005\n#\0006\v\5\0'\r$\0B\v\2\0029\v\a\vB\v\1\0029\v%\v9\v&\v=\v'\n6\v\5\0'\r$\0B\v\2\0029\v\a\vB\v\1\0029\v%\v9\v(\v=\v)\n6\v\5\0'\r$\0B\v\2\0029\v\a\vB\v\1\0029\v%\v9\v*\v=\v+\n5\v,\0=\v-\n>\n\2\t=\t\22\b4\t\3\0005\n.\0>\n\1\t=\t\27\b4\t\0\0=\t\28\b4\t\3\0>\2\1\t5\n/\0005\v0\0=\v1\n5\v2\0=\v3\n5\v4\0=\v-\n>\n\2\t=\t\29\b5\t5\0>\1\1\t=\t\30\b=\b3\aB\5\2\0012\0\0ÄK\0\1\0\1\4\0\0\0\rprogress\rlocation\1\0\4\nerror\tÔÅó \twarn\tÔÅ± \tinfo\tÔÅö \thint\tÔÅ™ \rsections\1\5\0\0\nerror\twarn\tinfo\thint\fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\1\2\2\0\rfilename\16file_status\2\tpath\3\1\fsymbols\1\0\3\fremoved\6-\rmodified\6~\nadded\6+\18color_removed\vdelete\19color_modified\vchange\16color_added\badd\bgit\22tokyonight.colors\1\2\1\0\tdiff\fcolored\2\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\ftabline\14lualine_z\14lualine_y\14lualine_x\14lualine_c\ncolor\1\0\0\1\0\2\bgui\vitalic\afg\f#2ac3de\0\14lualine_b\14lualine_a\1\0\0\0\foptions\1\0\0\23disabled_filetypes\1\2\0\0\14dashboard\15extensions\1\2\0\0\rfugitive\25component_separators\1\3\0\0\bÓÇπ\bÓÇø\23section_separators\1\0\1\ntheme\15tokyonight\1\3\0\0\bÓÇ∏\bÓÇæ\nsetup\flualine\frequire\0\0\0\0\0\0", "config", "lualine.nvim")
	time([[Config for lualine.nvim]], false)
else
time("Condition for { 'lualine.nvim' }", false)
end

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-rhubarb', 'fugitive-gitlab.vim'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-js-indent'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
