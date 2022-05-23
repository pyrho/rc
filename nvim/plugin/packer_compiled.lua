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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nÇ\3\0\0\14\0\20\1(6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0005\3\4\0006\4\0\0'\6\5\0B\4\2\0029\4\6\0044\6\3\0006\a\0\0'\t\a\0B\a\2\2\18\t\a\0009\a\2\a6\n\b\0009\n\t\n9\n\n\n'\v\v\0'\f\f\0'\r\r\0B\a\6\2\18\t\a\0009\a\14\aB\a\2\0?\a\0\0B\4\2\2=\4\15\0036\4\0\0'\6\16\0B\4\2\0029\4\17\4B\4\1\2=\4\18\3B\0\3\2\18\2\0\0009\0\19\0B\0\2\1K\0\1\0\tfind\vsorter\26fuzzy_with_index_bias\22telescope.sorters\vfinder\rabsolute\rinit.lua\rnvim_lua\f.config\tHOME\benv\bvim\17plenary.path\14new_table\22telescope.finders\1\0\1\17prompt_title\18Custom Picker\topts\bnew\22telescope.pickers\frequire\3ÄÄ¿ô\4(\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\tenew\bcmd\bvim\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0›\v\1\0\6\0016\0f6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0006\1\0\0009\1\t\0019\1\n\1'\2\v\0&\1\2\1=\1\b\0006\0\0\0009\0\1\0)\1\f\0=\1\f\0006\0\0\0009\0\1\0)\1P\0=\1\r\0003\0\14\0007\0\15\0005\0\23\0005\1\17\0005\2\16\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\21\2=\2\22\1=\1\24\0005\1\26\0005\2\25\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\27\2=\2\22\1=\1\28\0005\1\30\0005\2\29\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\31\2=\2\22\1=\1 \0005\1\"\0005\2!\0=\2\18\0013\2#\0=\2\22\1=\1$\0005\1&\0005\2%\0=\2\18\0013\2'\0=\2\22\1=\1(\0006\1\19\0'\3)\0B\1\2\2\18\3\1\0009\1*\0016\4\0\0009\4+\0049\4,\4B\4\1\2'\5-\0B\1\4\2\18\3\1\0009\1.\1B\1\2\2\15\0\1\0X\2\4Ä5\0011\0005\0020\0=\2\18\1=\1/\0006\1\0\0009\1\1\1=\0002\0016\1\0\0009\1\1\1)\2\1\0=\0023\0016\1\0\0009\0014\1'\0035\0B\1\2\1K\0\1\0\1¿·\1                augroup MyDashMappingr\n                    autocmd!\n                    autocmd Filetype dashboard call luaeval('require\"pyrho.plugins.conf.dashboard\".mappings()')\n                augroup END\n            \bcmd!dashboard_disable_statusline\29dashboard_custom_section\1\0\1\fcommand\23source Session.vim\1\2\0\0009ÔÑå  Resume Obsession                              0\ra_obsess\vexists\16Session.vim\vgetcwd\afn\bnew\17plenary.path\15z_nvimconf\0\1\0\0\1\2\0\0009Óò´  Browse config                                 c\nd_new\0\1\0\0\1\2\0\0009ÔÖõ  New File                                      e\rc_search\14live_grep\1\0\0\1\2\0\0009Ô°à  Grep                                          s\nb_old\roldfiles\1\0\0\1\2\0\0009Ôáö  Old files                                     O\ra_browse\1\0\0\fcommand\afd\22telescope.builtin\frequire\16description\1\0\0\1\2\0\0009ÔÖú  Browse                                        o\21my_custom_picker\0!dashboard_preview_file_width\"dashboard_preview_file_height\29/.config/nvim/sunjon.cat\tHOME\benv\27dashboard_preview_file\17lolcat -S 90\31dashboard_preview_pipeline\bcat\30dashboard_preview_command\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["fern-git-status.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern-git-status.vim",
    url = "https://github.com/lambdalisue/fern-git-status.vim"
  },
  ["fern-hijack.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern-hijack.vim",
    url = "https://github.com/lambdalisue/fern-hijack.vim"
  },
  ["fern-renderer-nerdfont.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim",
    url = "https://github.com/lambdalisue/fern-renderer-nerdfont.vim"
  },
  ["fern.vim"] = {
    config = { "\27LJ\2\n˙\2\0\0\6\0\f\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0√\1    augroup MyFernStuff\n        au!\n        autocmd FileType fern call glyph_palette#apply()\n        autocmd FileType fern :lua require\"pyrho.plugins.conf.fern\".mappings()\n    augroup END\n  \bcmd\rnerdfont\18fern#renderer\6g\1\0\2\vsilent\2\fnoremap\2\30:Fern %:h -reveal=%:p<CR>\14<Leader>f\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fern.vim",
    url = "https://github.com/lambdalisue/fern.vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\nl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4A\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\f--stdin\1\0\2\nstdin\2\bexe\15elm-formatJ\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\21--indent-width=2\1\0\2\nstdin\2\bexe\15lua-formatl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4∑\1\1\0\6\0\14\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\0034\4\3\0003\5\t\0>\5\1\4=\4\n\0034\4\3\0003\5\v\0>\5\1\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\rfiletype\thtml\0\blua\0\belm\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["fugitive-gitlab.vim"] = {
    commands = { "GBrowse" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/fugitive-gitlab.vim",
    url = "https://github.com/shumphrey/fugitive-gitlab.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\nª\2\0\0\6\0\15\0\0296\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\21<cmd>Buffers<CR>\14<Leader>b\1\0\2\vsilent\2\fnoremap\2\16<cmd>Rg<CR>\14<Leader>s\1\0\2\vsilent\2\fnoremap\2\20<cmd>GFiles<CR>\14<Leader>o\6n\20nvim_set_keymap\bapi\31let $FZF_DEFAULT_OPTS = ''\bcmd\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["glyph-palette.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/glyph-palette.vim",
    url = "https://github.com/lambdalisue/glyph-palette.vim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    config = { "\27LJ\2\n1\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\b70%\16goyo_height\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["heirline.nvim"] = {
    config = { "\27LJ\2\nh\0\0\5\0\a\0\0146\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2\18\2\0\0009\0\3\0'\3\4\0'\4\5\0B\0\4\3'\2\6\0\18\3\0\0&\2\3\2L\2\2\0\tÔíâ \5\b.*:\tgsub\22nvim_buf_get_name\bapi\bvimU\0\1\6\0\6\0\v'\1\0\0009\2\1\0006\3\2\0009\3\3\0039\3\4\3)\5\1\0B\3\2\0028\2\3\2'\3\5\0&\1\3\1L\1\2\0\a%)\tmode\afn\bvim\15mode_names\fÔûü %2(M\0\1\4\1\5\0\t\18\3\0\0009\1\0\0B\1\2\0025\2\2\0-\3\0\0009\3\1\3=\3\3\2=\1\4\2L\2\2\0\3¿\abg\afg\1\0\1\tbold\2\nblack\15mode_color\30\0\1\4\0\1\0\3\18\3\0\0009\1\0\0D\1\2\0\15mode_colorF\0\1\4\0\4\0\a6\1\1\0009\1\2\0019\1\3\1)\3\0\0B\1\2\2=\1\0\0K\0\1\0\22nvim_buf_get_name\bapi\bvim\rfilename≥\1\0\1\b\0\v\0\0189\1\0\0006\2\1\0009\2\2\0029\2\3\2\18\4\1\0'\5\4\0B\2\3\0026\3\a\0'\5\b\0B\3\2\0029\3\t\3\18\5\1\0\18\6\2\0005\a\n\0B\3\4\3=\4\6\0=\3\5\0K\0\1\0\1\0\1\fdefault\2\19get_icon_color\22nvim-web-devicons\frequire\15icon_color\ticon\a:e\16fnamemodify\afn\bvim\rfilename*\0\1\3\0\2\0\a9\1\0\0\15\0\1\0X\2\3Ä9\1\0\0'\2\1\0&\1\2\1L\1\2\0\6 \ticon(\0\1\3\0\3\0\0045\1\1\0009\2\0\0=\2\2\1L\1\2\0\afg\1\0\0\15icon_colorπ\1\0\1\6\1\t\1\0246\1\0\0009\1\1\0019\1\2\0019\3\3\0'\4\4\0B\1\3\2\a\1\5\0X\2\2Ä'\2\6\0L\2\2\0-\2\0\0009\2\a\2\21\4\1\0*\5\0\0B\2\3\2\14\0\2\0X\2\6Ä6\2\0\0009\2\1\0029\2\b\2\18\4\1\0B\2\2\2\18\1\2\0L\1\2\0\1¿\16pathshorten\24width_percent_below\14[No Name]\5\a:.\rfilename\16fnamemodify\afn\bvim\1ÄÄ¿˛\3;\0\0\1\0\4\0\b6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0L\0\2\0K\0\1\0\b[+]\rmodified\abo\bvimZ\0\0\1\0\5\0\r6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\0\5Ä6\0\0\0009\0\1\0009\0\3\0\15\0\0\0X\1\2Ä'\0\4\0L\0\2\0K\0\1\0\bÔÄ£\rreadonly\15modifiable\abo\bvim]\0\0\2\1\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5Ä5\0\4\0-\1\0\0009\1\3\1=\1\5\0L\0\2\0K\0\1\0\3¿\afg\1\0\2\tbold\1\nforce\2\tcyan\rmodified\abo\bvim<\0\0\3\0\5\0\0066\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2D\0\2\0\rfiletype\abo\bvim\nupper\vstringÇ\1\0\0\4\0\b\0\0236\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\5Ä6\0\0\0009\0\1\0009\0\2\0\14\0\0\0X\1\3Ä6\0\0\0009\0\4\0009\0\5\0\6\0\6\0X\1\4Ä\18\3\0\0009\1\a\0B\1\2\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\nupper\nutf-8\benc\6o\5\tfenc\abo\bvimX\0\0\4\0\5\0\r6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\1\4Ä\18\3\0\0009\1\4\0B\1\2\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\nupper\tunix\15fileformat\abo\bvimù\2\0\0\n\0\14\0-5\0\0\0006\1\1\0009\1\2\0019\1\3\0016\3\1\0009\3\4\0039\3\5\3)\5\0\0B\3\2\0A\1\0\2)\2\0\0\1\1\2\0X\2\2Ä)\1\0\0X\2\0Ä)\2\0\0\3\1\2\0X\2\4Ä'\2\6\0:\3\1\0&\2\3\2L\2\2\0006\2\a\0009\2\b\0026\4\a\0009\4\t\4\18\6\1\0B\4\2\0026\5\a\0009\5\t\5)\a\0\4B\5\2\2#\4\5\4B\2\2\0026\3\n\0009\3\v\3'\5\f\0006\6\a\0009\6\r\6)\b\0\4\18\t\2\0B\6\3\2#\6\6\0018\a\2\0D\3\4\0\bpow\v%.2g%s\vformat\vstring\blog\nfloor\tmath\0060\22nvim_buf_get_name\bapi\rgetfsize\afn\bvim\1\b\0\0\6b\6k\6M\6G\6T\6P\6Eê\1\0\0\5\0\b\0\0226\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0A\0\0\2)\1\0\0\1\1\0\0X\1\6Ä6\1\5\0009\1\6\1'\3\a\0\18\4\0\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%c\tdate\aos\22nvim_buf_get_name\bapi\rgetftime\afn\bvimª\1\0\1\b\0\t\1\0266\1\0\0009\1\1\0019\1\2\1)\3\0\0B\1\2\2:\1\1\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0B\2\2\0026\3\4\0009\3\5\3\23\5\0\1#\5\2\0059\6\6\0\21\6\6\0\"\5\6\5B\3\2\2\22\3\0\0036\4\a\0009\4\b\0049\6\6\0008\6\3\6)\a\2\0D\4\3\0\brep\vstring\tsbar\nfloor\tmath\24nvim_buf_line_count\24nvim_win_get_cursor\bapi\bvim\2n\0\1\6\0\b\0\15'\1\1\0=\1\0\0006\1\2\0009\1\3\0019\1\4\1)\3\0\0B\1\2\0026\2\2\0009\2\3\0029\2\6\2\18\4\1\0'\5\a\0B\2\3\2=\2\5\0K\0\1\0\a:~\16fnamemodify\bcwd\vgetcwd\afn\bvim\tÔêì \ticonS\0\1\5\0\5\0\0159\1\0\0\18\3\1\0009\1\1\1)\4ˇˇB\1\3\2\a\1\2\0X\1\2Ä'\1\3\0X\2\1Ä'\1\2\0009\2\4\0009\3\0\0\18\4\1\0&\2\4\2L\2\2\0\ticon\5\6/\bsub\bcwdz\0\1\6\0\b\0\0206\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\0029\2\3\0\18\4\2\0009\2\4\2)\5ˇˇB\2\3\2\a\2\5\0X\2\2Ä'\2\6\0X\3\1Ä'\2\5\0009\3\a\0\18\4\1\0\18\5\2\0&\3\5\3L\3\2\0\ticon\5\6/\bsub\bcwd\16pathshorten\afn\bvim≥\2\0\1\6\0\16\00056\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\6\0006\5\1\0009\5\2\0059\5\4\0059\5\5\5=\5\4\4B\1\3\2\21\1\1\0=\1\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\t\0006\5\1\0009\5\2\0059\5\4\0059\5\b\5=\5\4\4B\1\3\2\21\1\1\0=\1\a\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\f\0006\5\1\0009\5\2\0059\5\4\0059\5\v\5=\5\4\4B\1\3\2\21\1\1\0=\1\n\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\15\0006\5\1\0009\5\2\0059\5\4\0059\5\14\5=\5\4\4B\1\3\2\21\1\1\0=\1\r\0K\0\1\0\1\0\0\tINFO\tinfo\1\0\0\tHINT\nhints\1\0\0\tWARN\rwarnings\1\0\0\nERROR\rseverity\bget\15diagnostic\bvim\verrorsO\0\1\4\0\3\0\r9\1\0\0)\2\0\0\1\2\1\0X\1\5Ä9\1\1\0009\2\0\0'\3\2\0&\1\3\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\6 \15error_icon\verrorsP\0\1\4\0\3\0\r9\1\0\0)\2\0\0\1\2\1\0X\1\5Ä9\1\1\0009\2\0\0'\3\2\0&\1\3\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\6 \14warn_icon\rwarningsL\0\1\4\0\3\0\r9\1\0\0)\2\0\0\1\2\1\0X\1\5Ä9\1\1\0009\2\0\0'\3\2\0&\1\3\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\6 \14info_icon\tinfoG\0\1\3\0\2\0\f9\1\0\0)\2\0\0\1\2\1\0X\1\4Ä9\1\1\0009\2\0\0&\1\2\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\14hint_icon\nhints•\1\0\1\2\0\b\1\0216\1\1\0009\1\2\0019\1\3\1=\1\0\0009\1\0\0009\1\5\1\t\1\0\0X\1\nÄ9\1\0\0009\1\6\1\t\1\0\0X\1\6Ä9\1\0\0009\1\a\1\t\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0=\1\4\0K\0\1\0\fchanged\fremoved\nadded\16has_changes\25gitsigns_status_dict\6b\bvim\16status_dict\0001\0\1\3\0\3\0\5'\1\0\0009\2\1\0009\2\2\2&\1\2\1L\1\2\0\thead\16status_dict\tÔêò \27\0\1\2\0\1\0\0029\1\0\0L\1\2\0\16has_changes[\0\1\4\0\3\0\0169\1\0\0009\1\1\1\14\0\1\0X\2\1Ä)\1\0\0)\2\0\0\1\2\1\0X\2\4Ä'\2\2\0\18\3\1\0&\2\3\2X\3\3Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6+\nadded\16status_dict]\0\1\4\0\3\0\0169\1\0\0009\1\1\1\14\0\1\0X\2\1Ä)\1\0\0)\2\0\0\1\2\1\0X\2\4Ä'\2\2\0\18\3\1\0&\2\3\2X\3\3Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6-\fremoved\16status_dict]\0\1\4\0\3\0\0169\1\0\0009\1\1\1\14\0\1\0X\2\1Ä)\1\0\0)\2\0\0\1\2\1\0X\2\4Ä'\2\2\0\18\3\1\0&\2\3\2X\3\3Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6~\fchanged\16status_dict\27\0\1\2\0\1\0\0029\1\0\0L\1\2\0\16has_changesÄ\1\0\0\4\1\6\0\b-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\2D\0\2\0\1¿\rfiletype\1\3\0\0\v^git.*\rfugitive\fbuftype\1\0\0\1\5\0\0\vnofile\vprompt\thelp\rquickfix\19buffer_matchesH\0\0\4\1\4\0\6-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\2D\0\2\0\1¿\fbuftype\1\0\0\1\2\0\0\rterminal\19buffer_matches'\0\0\2\1\1\0\5-\0\0\0009\0\0\0B\0\1\2\19\0\0\0L\0\2\0\1¿\14is_active'\0\0\2\1\1\0\5-\0\0\0009\0\0\0B\0\1\2\19\0\0\0L\0\2\0\1¿\14is_activeÄ\1\0\0\4\1\6\0\b-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\2D\0\2\0\1¿\rfiletype\1\3\0\0\v^git.*\rfugitive\fbuftype\1\0\0\1\5\0\0\vnofile\vprompt\thelp\rquickfix\19buffer_matchesH\0\0\4\1\4\0\6-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\2D\0\2\0\1¿\fbuftype\1\0\0\1\2\0\0\rterminal\19buffer_matches”\1\0\0\4\2\b\0#-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\15Ä5\0\4\0-\1\1\0009\1\1\1'\3\2\0B\1\2\0029\1\3\1=\1\3\0-\1\1\0009\1\1\1'\3\2\0B\1\2\0029\1\5\1=\1\5\0L\0\2\0X\0\14Ä5\0\a\0-\1\1\0009\1\1\1'\3\6\0B\1\2\0029\1\3\1=\1\3\0-\1\1\0009\1\1\1'\3\6\0B\1\2\0029\1\5\1=\1\5\0L\0\2\0K\0\1\0\1¿\2¿\1\0\0\17StatusLineNC\abg\1\0\0\afg\15StatusLine\18get_highlight\14is_activei\0\1\3\1\6\0\15-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6Ä6\1\1\0009\1\2\0019\1\3\1B\1\1\2\14\0\1\0X\2\1Ä'\1\4\0009\2\5\0008\2\1\2L\2\2\0\1¿\16mode_colors\6n\tmode\afn\bvim\14is_active˜\28\1\0%\0”\1\2∆\0035\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0026\3\1\0'\5\4\0B\3\2\0029\3\5\0034\5\0\0B\3\2\0026\4\1\0'\6\6\0B\4\2\0025\5\a\0005\6\n\0'\a\b\0009\b\t\0'\t\b\0&\a\t\a=\a\v\0065\a\r\0009\b\f\3=\b\14\a=\a\15\0065\a\16\0005\b\18\0003\t\17\0=\t\v\b5\t\19\0009\n\f\3=\n\14\t=\t\15\b5\t\23\0005\n\21\0005\v\20\0=\v\22\n=\n\24\t3\n\25\0=\n\v\t3\n\26\0=\n\15\t9\n\27\0025\f\28\0003\r\29\0005\14\31\0>\t\1\0145\15\30\0=\15\15\14B\n\4\2\18\t\n\0005\n!\0003\v \0=\v\"\n5\v$\0003\f#\0=\f\"\v3\f%\0=\f\v\v3\f&\0=\f\15\v5\f(\0003\r'\0=\r\v\f5\r+\0009\14)\2'\16*\0B\14\2\0029\14\14\14=\14\14\r=\r\15\f4\r\3\0005\14-\0003\15,\0=\15\v\0145\15/\0009\16.\3=\16\14\15=\15\15\14>\14\1\r5\0141\0003\0150\0=\15\v\0145\0153\0009\0162\3=\16\14\15=\15\15\14>\14\2\r5\0145\0003\0154\0=\15\15\0149\0156\2\18\17\n\0\18\18\v\0009\0196\2\18\21\14\0\18\22\f\0B\19\3\0026\0207\0\18\22\r\0B\20\2\0025\0218\0B\15\6\2\18\n\15\0005\15:\0003\0169\0=\16\v\0155\16<\0009\17)\2'\19;\0B\17\2\0029\17\14\17=\17\14\16=\16\15\0155\16>\0003\17=\0=\17\v\0165\17@\0003\18?\0=\18\v\0175\18B\0003\19A\0=\19\v\0185\19D\0003\20C\0=\20\v\0195\20E\0005\21I\0005\22G\0005\23F\0=\23H\22=\22\24\0213\22J\0=\22\v\0215\22L\0009\23K\3=\23\14\0229\23M\3=\23N\22=\22\15\0215\22P\0003\23O\0=\23\v\0225\23Q\0009\24\f\3=\24\14\23=\23\15\0229\23R\2)\25\1\0005\26T\0003\27S\0=\27\v\0265\27V\0003\28U\0=\28\v\0275\28W\0B\23\5\0?\23\0\0005\23Y\0009\24X\1=\24Z\0235\24[\0009\25.\3=\25\14\24=\24\15\0235\24^\0006\25\1\0'\27\\\0B\25\2\0029\25]\25=\25Z\0246\25\1\0'\27\\\0B\25\2\0029\25_\25=\25\v\0245\25a\0009\26`\3=\26\14\25=\25\15\0245\25c\0009\26b\1=\26Z\0255\26i\0006\27d\0009\27e\0279\27f\27'\29g\0B\27\2\2:\27\1\0279\27h\27=\27j\0266\27d\0009\27e\0279\27f\27'\29k\0B\27\2\2:\27\1\0279\27h\27=\27l\0266\27d\0009\27e\0279\27f\27'\29m\0B\27\2\2:\27\1\0279\27h\27=\27n\0266\27d\0009\27e\0279\27f\27'\29o\0B\27\2\2:\27\1\0279\27h\27=\27p\26=\26\24\0253\26q\0=\26\"\0255\26r\0>\26\1\0255\26t\0003\27s\0=\27\v\0265\27v\0009\28u\3=\28\14\27=\27\15\26>\26\2\0255\26x\0003\27w\0=\27\v\0265\27z\0009\28y\3=\28\14\27=\27\15\26>\26\3\0255\26|\0003\27{\0=\27\v\0265\27~\0009\28}\3=\28\14\27=\27\15\26>\26\4\0255\26Ä\0003\27\127\0=\27\v\0265\27Ç\0009\28Å\3=\28\14\27=\27\15\26>\26\5\0255\26É\0>\26\6\0255\26Ö\0009\27Ñ\1=\27Z\0263\27Ü\0=\27\"\0265\27à\0009\28á\3=\28\14\27=\27\15\0265\27ä\0003\28â\0=\28\v\0275\28ã\0=\28\15\27>\27\1\0265\27ç\0003\28å\0=\28Z\27>\27\2\0265\27è\0003\28é\0=\28\v\0275\28í\0009\29ê\0039\29ë\29=\29\14\28=\28\15\27>\27\3\0265\27î\0003\28ì\0=\28\v\0275\28ñ\0009\29ê\0039\29ï\29=\29\14\28=\28\15\27>\27\4\0265\27ò\0003\28ó\0=\28\v\0275\28ö\0009\29ê\0039\29ô\29=\29\14\28=\28\15\27>\27\5\0265\27ú\0003\28õ\0=\28Z\27>\27\6\0265\27û\0009\28ù\2=\28\"\0275\28†\0003\29ü\0=\29Z\28>\28\1\0275\28¢\0003\29°\0=\29Z\0289\29\27\0025\31£\0009 §\0034!\4\0>\15\1!>\5\2!>\b\3!B\29\4\0?\29\0\0>\28\2\0275\28¶\0003\29•\0=\29Z\28>\28\3\0275\28ß\0009\29b\1=\29Z\0289\29\27\0024\31\3\0009 ®\0> \1\0319 ©\0> \2\0319 ™\0035!¨\0005\"´\0009#\f\3=#\14\"=\"\15!>\25\1!B\29\4\0?\29\0\0>\28\4\0274\28\17\0>\t\1\28>\5\2\28>\n\3\28>\6\4\28>\26\5\28>\a\6\28>\24\a\28>\a\b\28>\23\t\28>\5\n\28>\5\v\28>\15\f\28>\5\r\28>\20\14\28>\5\15\28>\21\16\0285\29Æ\0003\30≠\0=\30Z\29>\n\1\29>\a\2\0295\30±\0009\31Ø\0049!∞\3*\"\1\0B\31\3\2=\31\14\0309\31≤\3=\31N\30=\30\15\0295\30¥\0003\31≥\0=\31Z\30>\15\1\30>\5\2\30>\a\3\0305\31∂\0003 µ\0= Z\0315 ∏\0009!∑\3=!N = \15\0315 ∫\0009!π\1=!Z >\t\1 >\5\2 > \1\31>\15\2\31>\5\3\31>\b\4\31>\a\5\0315 º\0003!ª\0=!\15 5!Œ\0005\"Ω\0009#\f\3=#æ\"9#.\3=#ø\"9#¿\3=#¡\"9#¿\3=#¬\"9#¿\3=#√\"9#2\3=#ƒ\"9#≈\3=#∆\"9#≈\3=#«\"9#≈\3=#»\"9#2\3=#…\"9#2\3=# \"9#À\3=#Ã\"9#.\3=#Õ\"=\"œ!3\"–\0=\"—!=!\24 9!ù\2=!\" >\30\1 >\31\2 >\29\3 >\28\4 6!\1\0'#“\0B!\2\0029!\5!\18# \0\18$\27\0B!\3\0012\0\0ÄK\0\1\0\rheirline\15mode_color\0\16mode_colors\1\0\0\6t\6!\bred\6r\6R\6\19\6S\6s\vpurple\6c\6\22\6V\6v\tcyan\6i\6n\1\0\0\1\0\0\0\1\0\0\14is_active\1\0\0\rdark_red\1\0\0\0\1\0\0\0\fbg_dark\1\0\2\tbold\1\nforce\2\17bg_highlight\rbrighten\1\0\0\0\1\0\0\1\0\0\14fg_gutter\18right_rounded\17left_rounded\1\0\0\1\0\1\rprovider\5\0\tred1\1\3\0\0\bÓÇ∂\bÓÇ¥\1\0\0\0\1\0\1\rprovider\5\0\1\0\0\28pick_child_on_condition\1\0\1\rprovider\6)\0\1\0\0\vchange\1\0\0\0\1\0\0\vdelete\1\0\0\0\1\0\0\badd\bgit\1\0\0\0\1\0\1\rprovider\6(\0\1\0\1\tbold\2\1\0\0\0\1\0\0\nblue6\0\1\0\0\16is_git_repo\1\0\1\rprovider\6]\1\0\0\thint\1\0\0\0\1\0\0\tinfo\1\0\0\0\1\0\0\fwarning\1\0\0\0\1\0\0\nerror\1\0\0\0\1\0\1\rprovider\a![\0\14hint_icon\23DiagnosticSignHint\14info_icon\23DiagnosticSignInfo\14warn_icon\23DiagnosticSignWarn\15error_icon\1\0\0\ttext\24DiagnosticSignError\20sign_getdefined\afn\bvim\1\0\0\20has_diagnostics\1\0\0\tgray\17get_location\1\0\0\17is_available\rnvim-gps\1\0\1\tbold\2\14condition\1\0\1\rprovider\fLSP ÔàÖ\17lsp_attached\1\0\1\rprovider\5\1\0\0\0\1\0\0\0\28make_flexible_component\1\0\1\tbold\1\1\0\0\0\abg\nblue7\1\0\0\nblue0\0\1\0\0\tsbar\1\0\0\1\t\0\0\b‚ñÅ\b‚ñÇ\b‚ñÉ\b‚ñÑ\b‚ñÖ\b‚ñÜ\b‚ñá\b‚ñà\1\0\1\rprovider\23%7(%l/%3L%):%2c %P\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\1\tbold\2\tType\1\0\0\0\1\0\1\rprovider\a%<\vunpack\vinsert\1\0\0\0\1\0\0\vorange\1\0\0\0\1\0\0\ngreen\1\0\0\0\1\0\0\14Directory\18get_highlight\1\0\0\0\0\0\1\0\0\0\tinit\1\0\0\0\1\0\0\1\0\1\afg\nblack\0\1\3\0\0\bÓÇ∂\bÓÇ¥\rsurround\0\0\vstatic\1\0\0\15mode_names\1\0\0\1\0\"\6r\b...\bniI\aNi\6V\bVI_\6v\aVI\6S\aS_\bniR\aNr\6i\aIN\ano\aN?\6!\6!\6\19\a^S\6\22\a^V\aix\aIx\aic\aIc\bniV\aNv\6R\aRE\6c\aCO\6t\tTERM\avs\aVs\aVs\aVs\a\22s\a^V\aRc\aRc\aRx\aRx\bRvc\aRv\aRv\aRv\bRvx\aRv\6s\6S\acv\aEx\ar?\6?\ant\aNt\arm\6M\bnoV\aN?\bnov\aN?\6n\aNO\bno\22\aN?\1\0\1\tbold\2\1\0\0\0\1\0\1\rprovider\a%=\ahl\afg\1\0\0\tblue\rprovider\1\0\0\22vertical_bar_thin\6 \1\0\1\rprovider\6 \20tokyonight.util\nsetup\22tokyonight.colors\19heirline.utils\24heirline.conditions\frequire\1\0\22\21slant_right_thin\bÓÇπ\22vertical_bar_thin\b‚îÇ\nright\bÓÇ±\23right_rounded_thin\bÓÇµ\18right_rounded\bÓÇ¥\17vertical_bar\b‚îÉ\22left_rounded_thin\bÓÇ∑\16folder_icon\tÓóæ \vcircle\b‚óè\16left_filled\bÓÇ≤\tleft\bÓÇ≥\17right_filled\bÓÇ∞\15slant_left\bÓÇ∫\17left_rounded\bÓÇ∂\20slant_left_thin\bÓÇª\16slant_right\bÓÇ∏\16github_icon\n ÔØô \17slant_left_2\bÓÇæ\22slant_left_2_thin\bÓÇø\nblock\b‚ñà\18slant_right_2\bÓÇº\23slant_right_2_thin\bÓÇΩ\3ÄÄ¿ô\4ÁÃô≥\6≥ÊÃ˛\3\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lexima.vim"] = {
    config = { "\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\30lexima_enable_basic_rules\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nerdfont.vim",
    url = "https://github.com/lambdalisue/nerdfont.vim"
  },
  nrrwrgn = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nrrwrgn",
    url = "https://github.com/chrisbra/nrrwrgn"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÂ\1\0\1\5\3\b\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5Ä-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\1¿\0¿\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\vÄ6\0\2\0009\0\3\0009\0\4\0)\2ˇˇB\0\2\2\t\0\0\0X\0\4Ä-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\2¿\1¿\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2‚\a\1\0\f\0>\0Ç\0013\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\3\4\0025\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0023\t\v\0005\n\f\0B\a\3\2=\a\14\0069\a\n\0023\t\15\0005\n\16\0B\a\3\2=\a\17\0069\a\n\0029\t\n\0029\t\18\t)\v¸ˇB\t\2\0025\n\19\0B\a\3\2=\a\20\0069\a\n\0029\t\n\0029\t\18\t)\v\4\0B\t\2\0025\n\21\0B\a\3\2=\a\22\0069\a\n\0029\t\n\0029\t\23\tB\t\1\0025\n\24\0B\a\3\2=\a\25\0069\a\n\0029\t\n\0029\t\23\tB\t\1\0025\n\26\0B\a\3\2=\a\27\0069\a\28\0029\a\29\a=\a\30\0069\a\n\0025\t \0009\n\n\0029\n\31\nB\n\1\2=\n!\t9\n\n\0029\n\"\nB\n\1\2=\n#\tB\a\2\2=\a$\0069\a\n\0029\a%\a5\t&\0B\a\2\2=\a'\6=\6\n\0059\6\28\0029\6(\0064\b\3\0005\t)\0>\t\1\b5\t*\0>\t\2\b4\t\3\0005\n+\0>\n\1\tB\6\3\2=\6(\5B\3\2\0019\3\4\0029\3,\3'\5-\0005\6/\0004\a\3\0005\b.\0>\b\1\a=\a(\6B\3\3\0019\3\4\0029\3,\3'\0050\0005\0063\0009\a\28\0029\a(\a4\t\3\0005\n1\0>\n\1\t4\n\3\0005\v2\0>\v\1\nB\a\3\2=\a(\6B\3\3\0016\3\2\0'\0054\0B\3\2\0029\0035\0036\0056\0009\0057\0059\0058\0059\0059\5B\5\1\0A\3\0\0026\4\2\0'\6:\0B\4\2\0029\4;\0049\4\4\0045\6<\0=\3=\6B\4\2\0012\0\0ÄK\0\1\0\17capabilities\1\0\0\rtsserver\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\nvsnip\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<m-Space>\1\3\0\0\6i\6c\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0\0\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\n∫\b\0\0\6\0\29\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\b\0005\4\a\0005\5\6\0=\5\5\4=\4\t\0035\4\v\0005\5\n\0=\5\5\4=\4\f\0035\4\14\0005\5\r\0=\5\5\4=\4\15\0035\4\17\0005\5\16\0=\5\5\4=\4\18\0035\4\20\0005\5\19\0=\5\5\4=\4\21\0035\4\23\0005\5\22\0=\5\5\4=\4\24\0035\4\26\0005\5\25\0=\5\5\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\14languages\tyang\1\0\0\1\0\n\16module-name\tÔú£ \17augment-path\tÔ£™ \19container-name\tÔò≠ \16action-name\tÔÉß \14leaf-name\tÔ†© \19leaf-list-name\tÔ†© \14list-name\tÔ¨ò \18identity-name\tÔ¢Å \17typedef-name\tÔíß \18grouping-name\tÔò∞ \tyaml\1\0\0\1\0\a\14null-name\v[Óúñ] \17boolean-name\fÔ∞∞Ô∞¥ \17integer-name\a# \18sequence-name\tÔô© \17mapping-name\tÔô® \16string-name\tÔî´ \15float-name\tÔ£Ø \fverilog\1\0\0\1\0\1\16module-name\tÓâ¶ \ttoml\1\0\0\1\0\n\14date-name\tÔóµ \15table-name\tÔô® \17boolean-name\fÔ∞∞Ô∞¥ \16string-name\tÔî´ \14time-name\tÔÄó \17integer-name\a# \22inline-table-name\tÔô® \15float-name\tÔ£Ø \19date-time-name\tÔóØ \15array-name\tÔô© \tnorg\1\0\0\1\0\1\15title-name\tÔî´ \nlatex\1\0\0\1\0\2\15label-name\tÔî´ \15title-name\a# \tjson\1\0\0\1\0\0\1\0\6\16number-name\a# \17boolean-name\fÔ∞∞Ô∞¥ \16string-name\tÔî´ \14null-name\v[Óúñ] \16object-name\tÔô® \15array-name\tÔô© \nicons\1\0\5\19container-name\t‚õ∂ \rtag-name\bÔßª\16method-name\tÔö¶ \18function-name\tÔûî \15class-name\tÔ†ñ \1\0\4\18disable_icons\1\26depth_limit_indicator\a..\14separator\b > \ndepth\3\0\nsetup\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    cond = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\19\0\0\0L\0\2\0\vis_zen\18pyrho.helpers\frequire\0" },
    config = { "\27LJ\2\n≤\t\0\2\n\0(\0_6\2\0\0009\2\1\0029\2\2\2\18\3\2\0)\5\0\0'\6\3\0'\a\4\0'\b\5\0005\t\6\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\a\0'\b\b\0005\t\t\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\n\0'\b\v\0005\t\f\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\r\0'\b\14\0005\t\15\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\16\0'\b\17\0005\t\18\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\4\0'\b\19\0005\t\20\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\21\0'\b\22\0005\t\23\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\24\0'\b\25\0005\t\26\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\27\0'\b\28\0005\t\29\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a\30\0'\b\31\0005\t \0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a!\0'\b\"\0005\t#\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a$\0'\b%\0004\t\0\0B\3\6\1\18\3\2\0)\5\0\0'\6\3\0'\a&\0'\b'\0004\t\0\0B\3\6\1K\0\1\0E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>\n<C-d>F<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>\n<C-u>\1\0\2\fnoremap\2\vsilent\2*<cmd>Lspsaga diagnostic_jump_prev<cr>\agk\1\0\2\fnoremap\2\vsilent\2*<cmd>Lspsaga diagnostic_jump_next<cr>\agj\1\0\2\fnoremap\2\vsilent\0025<cmd>Telescope lsp_dynamic_workspace_symbols<cr>\agS\1\0\2\fnoremap\2\vsilent\2,<cmd>Telescope lsp_document_symbols<cr>\ag0\1\0\2\fnoremap\2\vsilent\2,<cmd>Telescope lsp_type_definitions<cr>\agy\1\0\2\fnoremap\2\vsilent\2&<cmd>Telescope lsp_references<cr>\1\0\2\fnoremap\2\vsilent\2'<cmd>Telescope lsp_definitions<cr>\agd\1\0\2\fnoremap\2\vsilent\2+<cmd>Lspsaga show_line_diagnostics<cr>\ago\1\0\2\fnoremap\2\vsilent\2\31<cmd>Lspsaga hover_doc<cr>\6K\1\0\2\fnoremap\2\vsilent\2!<cmd>Lspsaga code_action<cr>\agx\1\0\2\fnoremap\2\vsilent\2\28<cmd>Lspsaga rename<cr>\agr\6n\24nvim_buf_set_keymap\bapi\bvimø\1\0\1\4\0\b\0\t5\1\1\0=\1\0\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1=\1\2\0K\0\1\0\tltex\1\0\0\20additionalRules\1\0\2\18languageModel\14~/.ngrams\17motherTongue\afr\1\0\2\23diagnosticSeverity\16information\rlanguage\nen-US\rsettings\1\2\0\0\rmarkdown\14filetypesk\0\1\6\2\4\0\0185\1\0\0-\2\0\0=\2\1\1-\2\1\0009\3\2\0008\2\3\2\15\0\2\0X\3\5Ä-\2\1\0009\3\2\0008\2\3\2\18\4\1\0B\2\2\1\18\4\0\0009\2\3\0\18\5\1\0B\2\3\1K\0\1\0\1¿\2¿\nsetup\tname\14on_attach\1\0\0m\1\0\6\0\b\0\f6\0\0\0'\2\1\0B\0\2\0023\1\2\0005\2\4\0003\3\3\0=\3\5\0029\3\6\0003\5\a\0B\3\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\tltex\1\0\0\0\0\23nvim-lsp-installer\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nó\4\0\0\4\0\v\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\3\nnumhl\"LspDiagnosticsSignInformation\ttext\bÔÅö\vtexthl\"LspDiagnosticsSignInformation\"LspDiagnosticsSignInformation\1\0\3\nnumhl\27LspDiagnosticsSignHint\ttext\bÔÅ™\vtexthl\27LspDiagnosticsSignHint\27LspDiagnosticsSignHint\1\0\3\nnumhl\30LspDiagnosticsSignWarning\ttext\bÔÅ±\vtexthl\30LspDiagnosticsSignWarning\30LspDiagnosticsSignWarning\1\0\3\nnumhl\28LspDiagnosticsSignError\ttext\bÔÅó\vtexthl\28LspDiagnosticsSignError\28LspDiagnosticsSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rlspfuzzy\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy",
    url = "https://github.com/ojroques/nvim-lspfuzzy"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nú\5\0\0\6\0\31\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\19\0005\4\14\0005\5\15\0=\5\16\0045\5\17\0=\5\18\4=\4\20\0035\4\21\0005\5\22\0=\5\23\4=\4\24\3=\3\25\2B\0\2\0016\0\0\0'\2\26\0B\0\2\0029\0\27\0B\0\1\0029\1\28\0'\2\30\0=\2\29\1K\0\1\0\tocto\27filetype_to_parsername\rmarkdown\23get_parser_configs\28nvim-treesitter.parsers\16textobjects\vselect\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\tmove\1\0\0\24goto_previous_start\1\0\1\a[[\20@function.outer\20goto_next_start\1\0\1\a]]\20@function.outer\1\0\2\14set_jumps\2\venable\2\rrefactor\28highlight_current_scope\1\0\0\1\0\1\venable\2\21ensure_installed\1\a\0\0\15javascript\15typescript\tjson\vprisma\thttp\blua\14highlight\1\0\0\fdisable\1\4\0\0\rmarkdown\6c\trust\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pgsql.vim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/pgsql.vim",
    url = "https://github.com/lifepillar/pgsql.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup-menu.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/popup-menu.nvim",
    url = "https://github.com/kamykn/popup-menu.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["registers.nvim"] = {
    config = { "\27LJ\2\nA\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\frounded\28registers_window_border\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\nü\2\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\1\0\3\17show_headers\2\rshow_url\2\19show_http_info\2\14highlight\1\0\2\ftimeout\3ñ\1\fenabled\2\1\0\5\26skip_ssl_verification\2\20jump_to_request\1\28result_split_horizontal\1\17yank_dry_run\2\renv_file\t.env\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/pyrho/rest.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nñ\3\0\0\6\0\21\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\20\0'\2\f\0B\0\2\1K\0\1\0\19load_extension\fpickers\15find_files\1\0\1\ntheme\rdropdown\fbuffers\1\0\0\1\0\3\rsort_mru\2\ntheme\rdropdown\18sort_lastused\2\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\nfuzzy\2\28override_generic_sorter\2\25override_file_sorter\2\rdefaults\1\0\0\18layout_config\1\0\0\rvertical\1\0\0\1\0\1\nwidth\4\0ÄÄÄˇ\3\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-lua/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\nô\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\1\15navigation\1\0\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nÊ\3\0\0\3\0\19\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\15\0\0\0X\1\5Ä6\0\3\0009\0\4\0'\1\6\0=\1\5\0X\0\4Ä6\0\3\0009\0\4\0'\1\a\0=\1\5\0006\0\3\0009\0\b\0'\1\n\0=\1\t\0006\0\3\0009\0\b\0)\1\0\0=\1\v\0006\0\3\0009\0\b\0)\1\0\0=\1\f\0006\0\3\0009\0\b\0)\1\0\0=\1\r\0006\0\3\0009\0\b\0005\1\15\0=\1\14\0006\0\3\0009\0\b\0+\1\2\0=\1\16\0006\0\3\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0\29 colorscheme tokyonight \bcmd(tokyonight_hide_inactive_statusline\1\a\0\0\aqf\15vista_kind\vpacker\tdefx\18lspsagafinder\tfern\24tokyonight_sidebars tokyonight_italic_variables\31tokyonight_italic_keywords tokyonight_italic_functions\nstorm\21tokyonight_style\6g\tdark\nlight\15background\6o\bvim\vis_zen\18pyrho.helpers\frequire\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    config = { "\27LJ\2\nÿ\2\0\0\2\0\t\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0K\0\1\0\1\0\b\16saved_query\6*\18connection_ok\b‚úì\rexpanded\b‚ñæ\fbuffers\a¬ª\21connection_error\b‚úï\14collapsed\b‚ñ∏\14new_query\6+\vtables\6~\16db_ui_icons\26db_ui_execute_on_save%db_ui_auto_execute_table_helpers\25db_ui_use_nerd_fonts\1\0\1\bdev%mysql://root:root@127.0.0.1:8889\bdbs\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nº\3\0\0\6\0\16\1!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\5\0006\0\0\0009\0\1\0*\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\2\0=\1\a\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\0\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0á\1                inoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n                tnoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n        \bcmd\1\0\1\fnoremap\2\24:FloatermToggle<CR>\n<C-t>\6n\20nvim_set_keymap\bapi\23floaterm_autoclose\20floaterm_height\19floaterm_width\22floaterm_winblend\vcenter\22floaterm_position\6g\bvimõ≥ÊÃ\25Ãô≥ˇ\3\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-http-client"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-http-client",
    url = "https://github.com/aquach/vim-http-client"
  },
  ["vim-js-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-js-indent",
    url = "https://github.com/jason0x43/vim-js-indent"
  },
  ["vim-json"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-just"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-just",
    url = "https://github.com/NoahTheDuke/vim-just"
  },
  ["vim-mark"] = {
    config = { "\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19:MarkClear<CR>\14<Leader>N\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-mark",
    url = "https://github.com/Yggdroot/vim-mark"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\25vim_markdown_conceal\6g\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/benknoble/vim-obsession"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0002 runtime macros/sandwich/keymap/surround.vim \bcmd\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-slash"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-slash",
    url = "https://github.com/junegunn/vim-slash"
  },
  ["vim-sneak"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\16sneak#label\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\ná\2\0\0\a\0\14\0\0206\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\6\0005\2\5\0=\2\a\1=\1\4\0005\0\b\0006\1\0\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\1K\0\1\0\27<Plug>(vsnip-cut-text)\18<Leader><Tab>\6x\20nvim_set_keymap\bapi\1\0\2\vsilent\1\fnoremap\2\20typescriptreact\1\0\0\1\2\0\0\15typescript\20vsnip_filetypes\27~/rc/nvim_lua/snippets\22vsnip_snippet_dir\6g\bvim\0" },
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-yaml"] = {
    loaded = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/start/vim-yaml",
    url = "https://github.com/stephpy/vim-yaml"
  },
  ["zk-nvim"] = {
    cond = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\vis_zen\18pyrho.helpers\frequire\0" },
    config = { "\27LJ\2\nJ\0\2\5\0\4\0\0066\2\0\0009\2\1\0029\2\2\0025\4\3\0B\2\2\1K\0\1\0\1\0\2\nsigns\1\14underline\1\vconfig\15diagnostic\bvimº\4\1\0\a\0\30\00046\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0043\5\a\0=\5\b\4=\4\n\0035\4\v\0005\5\f\0=\5\r\4=\4\14\3=\3\15\2B\0\2\0015\0\16\0006\1\17\0009\1\18\0019\1\19\1'\3\20\0'\4\21\0'\5\22\0\18\6\0\0B\1\5\0016\1\17\0009\1\18\0019\1\19\1'\3\20\0'\4\23\0'\5\24\0\18\6\0\0B\1\5\0016\1\17\0009\1\18\0019\1\19\1'\3\20\0'\4\25\0'\5\26\0\18\6\0\0B\1\5\0016\1\17\0009\1\18\0019\1\19\1'\3\27\0'\4\28\0'\5\29\0\18\6\0\0B\1\5\1K\0\1\0\22:'<,'>ZkMatch<CR>\15<leader>zf\6v\20<Cmd>ZkTags<CR>\bgztF<Cmd>ZkNotes { sort = { 'modified' }, exclude = { 'diary' } }<CR>\bgzz7<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>\bgzn\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\1\fnoremap\2\blsp\16auto_attach\14filetypes\1\2\0\0\rmarkdown\1\0\1\fenabled\2\vconfig\1\0\0\14on_attach\0\bcmd\1\0\1\tname\azk\1\3\0\0\azk\blsp\1\0\1\vpicker\14telescope\nsetup\azk\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/pyrho/.local/share/nvim/site/pack/packer/opt/zk-nvim",
    url = "https://github.com/mickael-menu/zk-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\nª\2\0\0\6\0\15\0\0296\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\21<cmd>Buffers<CR>\14<Leader>b\1\0\2\vsilent\2\fnoremap\2\16<cmd>Rg<CR>\14<Leader>s\1\0\2\vsilent\2\fnoremap\2\20<cmd>GFiles<CR>\14<Leader>o\6n\20nvim_set_keymap\bapi\31let $FZF_DEFAULT_OPTS = ''\bcmd\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: vim-sandwich
time([[Config for vim-sandwich]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0002 runtime macros/sandwich/keymap/surround.vim \bcmd\bvim\0", "config", "vim-sandwich")
time([[Config for vim-sandwich]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\2\n∫\b\0\0\6\0\29\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\b\0005\4\a\0005\5\6\0=\5\5\4=\4\t\0035\4\v\0005\5\n\0=\5\5\4=\4\f\0035\4\14\0005\5\r\0=\5\5\4=\4\15\0035\4\17\0005\5\16\0=\5\5\4=\4\18\0035\4\20\0005\5\19\0=\5\5\4=\4\21\0035\4\23\0005\5\22\0=\5\5\4=\4\24\0035\4\26\0005\5\25\0=\5\5\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\14languages\tyang\1\0\0\1\0\n\16module-name\tÔú£ \17augment-path\tÔ£™ \19container-name\tÔò≠ \16action-name\tÔÉß \14leaf-name\tÔ†© \19leaf-list-name\tÔ†© \14list-name\tÔ¨ò \18identity-name\tÔ¢Å \17typedef-name\tÔíß \18grouping-name\tÔò∞ \tyaml\1\0\0\1\0\a\14null-name\v[Óúñ] \17boolean-name\fÔ∞∞Ô∞¥ \17integer-name\a# \18sequence-name\tÔô© \17mapping-name\tÔô® \16string-name\tÔî´ \15float-name\tÔ£Ø \fverilog\1\0\0\1\0\1\16module-name\tÓâ¶ \ttoml\1\0\0\1\0\n\14date-name\tÔóµ \15table-name\tÔô® \17boolean-name\fÔ∞∞Ô∞¥ \16string-name\tÔî´ \14time-name\tÔÄó \17integer-name\a# \22inline-table-name\tÔô® \15float-name\tÔ£Ø \19date-time-name\tÔóØ \15array-name\tÔô© \tnorg\1\0\0\1\0\1\15title-name\tÔî´ \nlatex\1\0\0\1\0\2\15label-name\tÔî´ \15title-name\a# \tjson\1\0\0\1\0\0\1\0\6\16number-name\a# \17boolean-name\fÔ∞∞Ô∞¥ \16string-name\tÔî´ \14null-name\v[Óúñ] \16object-name\tÔô® \15array-name\tÔô© \nicons\1\0\5\19container-name\t‚õ∂ \rtag-name\bÔßª\16method-name\tÔö¶ \18function-name\tÔûî \15class-name\tÔ†ñ \1\0\4\18disable_icons\1\26depth_limit_indicator\a..\14separator\b > \ndepth\3\0\nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nñ\3\0\0\6\0\21\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\20\0'\2\f\0B\0\2\1K\0\1\0\19load_extension\fpickers\15find_files\1\0\1\ntheme\rdropdown\fbuffers\1\0\0\1\0\3\rsort_mru\2\ntheme\rdropdown\18sort_lastused\2\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\nfuzzy\2\28override_generic_sorter\2\25override_file_sorter\2\rdefaults\1\0\0\18layout_config\1\0\0\rvertical\1\0\0\1\0\1\nwidth\4\0ÄÄÄˇ\3\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\nô\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vresize\1\0\1\31enable_default_keybindings\1\15navigation\1\0\0\1\0\1\31enable_default_keybindings\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: vim-sneak
time([[Config for vim-sneak]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\16sneak#label\6g\bvim\0", "config", "vim-sneak")
time([[Config for vim-sneak]], false)
-- Config for: fern.vim
time([[Config for fern.vim]], true)
try_loadstring("\27LJ\2\n˙\2\0\0\6\0\f\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\1\t\0=\1\b\0006\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0√\1    augroup MyFernStuff\n        au!\n        autocmd FileType fern call glyph_palette#apply()\n        autocmd FileType fern :lua require\"pyrho.plugins.conf.fern\".mappings()\n    augroup END\n  \bcmd\rnerdfont\18fern#renderer\6g\1\0\2\vsilent\2\fnoremap\2\30:Fern %:h -reveal=%:p<CR>\14<Leader>f\6n\20nvim_set_keymap\bapi\bvim\0", "config", "fern.vim")
time([[Config for fern.vim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nÊ\3\0\0\3\0\19\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\15\0\0\0X\1\5Ä6\0\3\0009\0\4\0'\1\6\0=\1\5\0X\0\4Ä6\0\3\0009\0\4\0'\1\a\0=\1\5\0006\0\3\0009\0\b\0'\1\n\0=\1\t\0006\0\3\0009\0\b\0)\1\0\0=\1\v\0006\0\3\0009\0\b\0)\1\0\0=\1\f\0006\0\3\0009\0\b\0)\1\0\0=\1\r\0006\0\3\0009\0\b\0005\1\15\0=\1\14\0006\0\3\0009\0\b\0+\1\2\0=\1\16\0006\0\3\0009\0\17\0'\2\18\0B\0\2\1K\0\1\0\29 colorscheme tokyonight \bcmd(tokyonight_hide_inactive_statusline\1\a\0\0\aqf\15vista_kind\vpacker\tdefx\18lspsagafinder\tfern\24tokyonight_sidebars tokyonight_italic_variables\31tokyonight_italic_keywords tokyonight_italic_functions\nstorm\21tokyonight_style\6g\tdark\nlight\15background\6o\bvim\vis_zen\18pyrho.helpers\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nó\4\0\0\4\0\v\0\0256\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\1K\0\1\0\1\0\3\nnumhl\"LspDiagnosticsSignInformation\ttext\bÔÅö\vtexthl\"LspDiagnosticsSignInformation\"LspDiagnosticsSignInformation\1\0\3\nnumhl\27LspDiagnosticsSignHint\ttext\bÔÅ™\vtexthl\27LspDiagnosticsSignHint\27LspDiagnosticsSignHint\1\0\3\nnumhl\30LspDiagnosticsSignWarning\ttext\bÔÅ±\vtexthl\30LspDiagnosticsSignWarning\30LspDiagnosticsSignWarning\1\0\3\nnumhl\28LspDiagnosticsSignError\ttext\bÔÅó\vtexthl\28LspDiagnosticsSignError\28LspDiagnosticsSignError\16sign_define\afn\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: vim-mark
time([[Config for vim-mark]], true)
try_loadstring("\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\19:MarkClear<CR>\14<Leader>N\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-mark")
time([[Config for vim-mark]], false)
-- Config for: nvim-lspfuzzy
time([[Config for nvim-lspfuzzy]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rlspfuzzy\frequire\0", "config", "nvim-lspfuzzy")
time([[Config for nvim-lspfuzzy]], false)
-- Config for: vim-dadbod-ui
time([[Config for vim-dadbod-ui]], true)
try_loadstring("\27LJ\2\nÿ\2\0\0\2\0\t\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0K\0\1\0\1\0\b\16saved_query\6*\18connection_ok\b‚úì\rexpanded\b‚ñæ\fbuffers\a¬ª\21connection_error\b‚úï\14collapsed\b‚ñ∏\14new_query\6+\vtables\6~\16db_ui_icons\26db_ui_execute_on_save%db_ui_auto_execute_table_helpers\25db_ui_use_nerd_fonts\1\0\1\bdev%mysql://root:root@127.0.0.1:8889\bdbs\6g\bvim\0", "config", "vim-dadbod-ui")
time([[Config for vim-dadbod-ui]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4A\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\f--stdin\1\0\2\nstdin\2\bexe\15elm-formatJ\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\2\0\0\21--indent-width=2\1\0\2\nstdin\2\bexe\15lua-formatl\0\0\5\0\5\1\n5\0\0\0004\1\3\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0?\2\0\0=\1\4\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\0\2\nstdin\2\bexe\14prettierd\3ÄÄ¿ô\4∑\1\1\0\6\0\14\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\0034\4\3\0003\5\t\0>\5\1\4=\4\n\0034\4\3\0003\5\v\0>\5\1\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\rfiletype\thtml\0\blua\0\belm\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: heirline.nvim
time([[Config for heirline.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\5\0\a\0\0146\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2\18\2\0\0009\0\3\0'\3\4\0'\4\5\0B\0\4\3'\2\6\0\18\3\0\0&\2\3\2L\2\2\0\tÔíâ \5\b.*:\tgsub\22nvim_buf_get_name\bapi\bvimU\0\1\6\0\6\0\v'\1\0\0009\2\1\0006\3\2\0009\3\3\0039\3\4\3)\5\1\0B\3\2\0028\2\3\2'\3\5\0&\1\3\1L\1\2\0\a%)\tmode\afn\bvim\15mode_names\fÔûü %2(M\0\1\4\1\5\0\t\18\3\0\0009\1\0\0B\1\2\0025\2\2\0-\3\0\0009\3\1\3=\3\3\2=\1\4\2L\2\2\0\3¿\abg\afg\1\0\1\tbold\2\nblack\15mode_color\30\0\1\4\0\1\0\3\18\3\0\0009\1\0\0D\1\2\0\15mode_colorF\0\1\4\0\4\0\a6\1\1\0009\1\2\0019\1\3\1)\3\0\0B\1\2\2=\1\0\0K\0\1\0\22nvim_buf_get_name\bapi\bvim\rfilename≥\1\0\1\b\0\v\0\0189\1\0\0006\2\1\0009\2\2\0029\2\3\2\18\4\1\0'\5\4\0B\2\3\0026\3\a\0'\5\b\0B\3\2\0029\3\t\3\18\5\1\0\18\6\2\0005\a\n\0B\3\4\3=\4\6\0=\3\5\0K\0\1\0\1\0\1\fdefault\2\19get_icon_color\22nvim-web-devicons\frequire\15icon_color\ticon\a:e\16fnamemodify\afn\bvim\rfilename*\0\1\3\0\2\0\a9\1\0\0\15\0\1\0X\2\3Ä9\1\0\0'\2\1\0&\1\2\1L\1\2\0\6 \ticon(\0\1\3\0\3\0\0045\1\1\0009\2\0\0=\2\2\1L\1\2\0\afg\1\0\0\15icon_colorπ\1\0\1\6\1\t\1\0246\1\0\0009\1\1\0019\1\2\0019\3\3\0'\4\4\0B\1\3\2\a\1\5\0X\2\2Ä'\2\6\0L\2\2\0-\2\0\0009\2\a\2\21\4\1\0*\5\0\0B\2\3\2\14\0\2\0X\2\6Ä6\2\0\0009\2\1\0029\2\b\2\18\4\1\0B\2\2\2\18\1\2\0L\1\2\0\1¿\16pathshorten\24width_percent_below\14[No Name]\5\a:.\rfilename\16fnamemodify\afn\bvim\1ÄÄ¿˛\3;\0\0\1\0\4\0\b6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0L\0\2\0K\0\1\0\b[+]\rmodified\abo\bvimZ\0\0\1\0\5\0\r6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\0\5Ä6\0\0\0009\0\1\0009\0\3\0\15\0\0\0X\1\2Ä'\0\4\0L\0\2\0K\0\1\0\bÔÄ£\rreadonly\15modifiable\abo\bvim]\0\0\2\1\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5Ä5\0\4\0-\1\0\0009\1\3\1=\1\5\0L\0\2\0K\0\1\0\3¿\afg\1\0\2\tbold\1\nforce\2\tcyan\rmodified\abo\bvim<\0\0\3\0\5\0\0066\0\0\0009\0\1\0006\2\2\0009\2\3\0029\2\4\2D\0\2\0\rfiletype\abo\bvim\nupper\vstringÇ\1\0\0\4\0\b\0\0236\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\0\5Ä6\0\0\0009\0\1\0009\0\2\0\14\0\0\0X\1\3Ä6\0\0\0009\0\4\0009\0\5\0\6\0\6\0X\1\4Ä\18\3\0\0009\1\a\0B\1\2\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\nupper\nutf-8\benc\6o\5\tfenc\abo\bvimX\0\0\4\0\5\0\r6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\1\4Ä\18\3\0\0009\1\4\0B\1\2\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\nupper\tunix\15fileformat\abo\bvimù\2\0\0\n\0\14\0-5\0\0\0006\1\1\0009\1\2\0019\1\3\0016\3\1\0009\3\4\0039\3\5\3)\5\0\0B\3\2\0A\1\0\2)\2\0\0\1\1\2\0X\2\2Ä)\1\0\0X\2\0Ä)\2\0\0\3\1\2\0X\2\4Ä'\2\6\0:\3\1\0&\2\3\2L\2\2\0006\2\a\0009\2\b\0026\4\a\0009\4\t\4\18\6\1\0B\4\2\0026\5\a\0009\5\t\5)\a\0\4B\5\2\2#\4\5\4B\2\2\0026\3\n\0009\3\v\3'\5\f\0006\6\a\0009\6\r\6)\b\0\4\18\t\2\0B\6\3\2#\6\6\0018\a\2\0D\3\4\0\bpow\v%.2g%s\vformat\vstring\blog\nfloor\tmath\0060\22nvim_buf_get_name\bapi\rgetfsize\afn\bvim\1\b\0\0\6b\6k\6M\6G\6T\6P\6Eê\1\0\0\5\0\b\0\0226\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0A\0\0\2)\1\0\0\1\1\0\0X\1\6Ä6\1\5\0009\1\6\1'\3\a\0\18\4\0\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%c\tdate\aos\22nvim_buf_get_name\bapi\rgetftime\afn\bvimª\1\0\1\b\0\t\1\0266\1\0\0009\1\1\0019\1\2\1)\3\0\0B\1\2\2:\1\1\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0B\2\2\0026\3\4\0009\3\5\3\23\5\0\1#\5\2\0059\6\6\0\21\6\6\0\"\5\6\5B\3\2\2\22\3\0\0036\4\a\0009\4\b\0049\6\6\0008\6\3\6)\a\2\0D\4\3\0\brep\vstring\tsbar\nfloor\tmath\24nvim_buf_line_count\24nvim_win_get_cursor\bapi\bvim\2n\0\1\6\0\b\0\15'\1\1\0=\1\0\0006\1\2\0009\1\3\0019\1\4\1)\3\0\0B\1\2\0026\2\2\0009\2\3\0029\2\6\2\18\4\1\0'\5\a\0B\2\3\2=\2\5\0K\0\1\0\a:~\16fnamemodify\bcwd\vgetcwd\afn\bvim\tÔêì \ticonS\0\1\5\0\5\0\0159\1\0\0\18\3\1\0009\1\1\1)\4ˇˇB\1\3\2\a\1\2\0X\1\2Ä'\1\3\0X\2\1Ä'\1\2\0009\2\4\0009\3\0\0\18\4\1\0&\2\4\2L\2\2\0\ticon\5\6/\bsub\bcwdz\0\1\6\0\b\0\0206\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\0029\2\3\0\18\4\2\0009\2\4\2)\5ˇˇB\2\3\2\a\2\5\0X\2\2Ä'\2\6\0X\3\1Ä'\2\5\0009\3\a\0\18\4\1\0\18\5\2\0&\3\5\3L\3\2\0\ticon\5\6/\bsub\bcwd\16pathshorten\afn\bvim≥\2\0\1\6\0\16\00056\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\6\0006\5\1\0009\5\2\0059\5\4\0059\5\5\5=\5\4\4B\1\3\2\21\1\1\0=\1\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\t\0006\5\1\0009\5\2\0059\5\4\0059\5\b\5=\5\4\4B\1\3\2\21\1\1\0=\1\a\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\f\0006\5\1\0009\5\2\0059\5\4\0059\5\v\5=\5\4\4B\1\3\2\21\1\1\0=\1\n\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0005\4\15\0006\5\1\0009\5\2\0059\5\4\0059\5\14\5=\5\4\4B\1\3\2\21\1\1\0=\1\r\0K\0\1\0\1\0\0\tINFO\tinfo\1\0\0\tHINT\nhints\1\0\0\tWARN\rwarnings\1\0\0\nERROR\rseverity\bget\15diagnostic\bvim\verrorsO\0\1\4\0\3\0\r9\1\0\0)\2\0\0\1\2\1\0X\1\5Ä9\1\1\0009\2\0\0'\3\2\0&\1\3\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\6 \15error_icon\verrorsP\0\1\4\0\3\0\r9\1\0\0)\2\0\0\1\2\1\0X\1\5Ä9\1\1\0009\2\0\0'\3\2\0&\1\3\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\6 \14warn_icon\rwarningsL\0\1\4\0\3\0\r9\1\0\0)\2\0\0\1\2\1\0X\1\5Ä9\1\1\0009\2\0\0'\3\2\0&\1\3\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\6 \14info_icon\tinfoG\0\1\3\0\2\0\f9\1\0\0)\2\0\0\1\2\1\0X\1\4Ä9\1\1\0009\2\0\0&\1\2\1X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\14hint_icon\nhints•\1\0\1\2\0\b\1\0216\1\1\0009\1\2\0019\1\3\1=\1\0\0009\1\0\0009\1\5\1\t\1\0\0X\1\nÄ9\1\0\0009\1\6\1\t\1\0\0X\1\6Ä9\1\0\0009\1\a\1\t\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0=\1\4\0K\0\1\0\fchanged\fremoved\nadded\16has_changes\25gitsigns_status_dict\6b\bvim\16status_dict\0001\0\1\3\0\3\0\5'\1\0\0009\2\1\0009\2\2\2&\1\2\1L\1\2\0\thead\16status_dict\tÔêò \27\0\1\2\0\1\0\0029\1\0\0L\1\2\0\16has_changes[\0\1\4\0\3\0\0169\1\0\0009\1\1\1\14\0\1\0X\2\1Ä)\1\0\0)\2\0\0\1\2\1\0X\2\4Ä'\2\2\0\18\3\1\0&\2\3\2X\3\3Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6+\nadded\16status_dict]\0\1\4\0\3\0\0169\1\0\0009\1\1\1\14\0\1\0X\2\1Ä)\1\0\0)\2\0\0\1\2\1\0X\2\4Ä'\2\2\0\18\3\1\0&\2\3\2X\3\3Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6-\fremoved\16status_dict]\0\1\4\0\3\0\0169\1\0\0009\1\1\1\14\0\1\0X\2\1Ä)\1\0\0)\2\0\0\1\2\1\0X\2\4Ä'\2\2\0\18\3\1\0&\2\3\2X\3\3Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6~\fchanged\16status_dict\27\0\1\2\0\1\0\0029\1\0\0L\1\2\0\16has_changesÄ\1\0\0\4\1\6\0\b-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\2D\0\2\0\1¿\rfiletype\1\3\0\0\v^git.*\rfugitive\fbuftype\1\0\0\1\5\0\0\vnofile\vprompt\thelp\rquickfix\19buffer_matchesH\0\0\4\1\4\0\6-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\2D\0\2\0\1¿\fbuftype\1\0\0\1\2\0\0\rterminal\19buffer_matches'\0\0\2\1\1\0\5-\0\0\0009\0\0\0B\0\1\2\19\0\0\0L\0\2\0\1¿\14is_active'\0\0\2\1\1\0\5-\0\0\0009\0\0\0B\0\1\2\19\0\0\0L\0\2\0\1¿\14is_activeÄ\1\0\0\4\1\6\0\b-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\0025\3\4\0=\3\5\2D\0\2\0\1¿\rfiletype\1\3\0\0\v^git.*\rfugitive\fbuftype\1\0\0\1\5\0\0\vnofile\vprompt\thelp\rquickfix\19buffer_matchesH\0\0\4\1\4\0\6-\0\0\0009\0\0\0005\2\2\0005\3\1\0=\3\3\2D\0\2\0\1¿\fbuftype\1\0\0\1\2\0\0\rterminal\19buffer_matches”\1\0\0\4\2\b\0#-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\15Ä5\0\4\0-\1\1\0009\1\1\1'\3\2\0B\1\2\0029\1\3\1=\1\3\0-\1\1\0009\1\1\1'\3\2\0B\1\2\0029\1\5\1=\1\5\0L\0\2\0X\0\14Ä5\0\a\0-\1\1\0009\1\1\1'\3\6\0B\1\2\0029\1\3\1=\1\3\0-\1\1\0009\1\1\1'\3\6\0B\1\2\0029\1\5\1=\1\5\0L\0\2\0K\0\1\0\1¿\2¿\1\0\0\17StatusLineNC\abg\1\0\0\afg\15StatusLine\18get_highlight\14is_activei\0\1\3\1\6\0\15-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\6Ä6\1\1\0009\1\2\0019\1\3\1B\1\1\2\14\0\1\0X\2\1Ä'\1\4\0009\2\5\0008\2\1\2L\2\2\0\1¿\16mode_colors\6n\tmode\afn\bvim\14is_active˜\28\1\0%\0”\1\2∆\0035\0\0\0006\1\1\0'\3\2\0B\1\2\0026\2\1\0'\4\3\0B\2\2\0026\3\1\0'\5\4\0B\3\2\0029\3\5\0034\5\0\0B\3\2\0026\4\1\0'\6\6\0B\4\2\0025\5\a\0005\6\n\0'\a\b\0009\b\t\0'\t\b\0&\a\t\a=\a\v\0065\a\r\0009\b\f\3=\b\14\a=\a\15\0065\a\16\0005\b\18\0003\t\17\0=\t\v\b5\t\19\0009\n\f\3=\n\14\t=\t\15\b5\t\23\0005\n\21\0005\v\20\0=\v\22\n=\n\24\t3\n\25\0=\n\v\t3\n\26\0=\n\15\t9\n\27\0025\f\28\0003\r\29\0005\14\31\0>\t\1\0145\15\30\0=\15\15\14B\n\4\2\18\t\n\0005\n!\0003\v \0=\v\"\n5\v$\0003\f#\0=\f\"\v3\f%\0=\f\v\v3\f&\0=\f\15\v5\f(\0003\r'\0=\r\v\f5\r+\0009\14)\2'\16*\0B\14\2\0029\14\14\14=\14\14\r=\r\15\f4\r\3\0005\14-\0003\15,\0=\15\v\0145\15/\0009\16.\3=\16\14\15=\15\15\14>\14\1\r5\0141\0003\0150\0=\15\v\0145\0153\0009\0162\3=\16\14\15=\15\15\14>\14\2\r5\0145\0003\0154\0=\15\15\0149\0156\2\18\17\n\0\18\18\v\0009\0196\2\18\21\14\0\18\22\f\0B\19\3\0026\0207\0\18\22\r\0B\20\2\0025\0218\0B\15\6\2\18\n\15\0005\15:\0003\0169\0=\16\v\0155\16<\0009\17)\2'\19;\0B\17\2\0029\17\14\17=\17\14\16=\16\15\0155\16>\0003\17=\0=\17\v\0165\17@\0003\18?\0=\18\v\0175\18B\0003\19A\0=\19\v\0185\19D\0003\20C\0=\20\v\0195\20E\0005\21I\0005\22G\0005\23F\0=\23H\22=\22\24\0213\22J\0=\22\v\0215\22L\0009\23K\3=\23\14\0229\23M\3=\23N\22=\22\15\0215\22P\0003\23O\0=\23\v\0225\23Q\0009\24\f\3=\24\14\23=\23\15\0229\23R\2)\25\1\0005\26T\0003\27S\0=\27\v\0265\27V\0003\28U\0=\28\v\0275\28W\0B\23\5\0?\23\0\0005\23Y\0009\24X\1=\24Z\0235\24[\0009\25.\3=\25\14\24=\24\15\0235\24^\0006\25\1\0'\27\\\0B\25\2\0029\25]\25=\25Z\0246\25\1\0'\27\\\0B\25\2\0029\25_\25=\25\v\0245\25a\0009\26`\3=\26\14\25=\25\15\0245\25c\0009\26b\1=\26Z\0255\26i\0006\27d\0009\27e\0279\27f\27'\29g\0B\27\2\2:\27\1\0279\27h\27=\27j\0266\27d\0009\27e\0279\27f\27'\29k\0B\27\2\2:\27\1\0279\27h\27=\27l\0266\27d\0009\27e\0279\27f\27'\29m\0B\27\2\2:\27\1\0279\27h\27=\27n\0266\27d\0009\27e\0279\27f\27'\29o\0B\27\2\2:\27\1\0279\27h\27=\27p\26=\26\24\0253\26q\0=\26\"\0255\26r\0>\26\1\0255\26t\0003\27s\0=\27\v\0265\27v\0009\28u\3=\28\14\27=\27\15\26>\26\2\0255\26x\0003\27w\0=\27\v\0265\27z\0009\28y\3=\28\14\27=\27\15\26>\26\3\0255\26|\0003\27{\0=\27\v\0265\27~\0009\28}\3=\28\14\27=\27\15\26>\26\4\0255\26Ä\0003\27\127\0=\27\v\0265\27Ç\0009\28Å\3=\28\14\27=\27\15\26>\26\5\0255\26É\0>\26\6\0255\26Ö\0009\27Ñ\1=\27Z\0263\27Ü\0=\27\"\0265\27à\0009\28á\3=\28\14\27=\27\15\0265\27ä\0003\28â\0=\28\v\0275\28ã\0=\28\15\27>\27\1\0265\27ç\0003\28å\0=\28Z\27>\27\2\0265\27è\0003\28é\0=\28\v\0275\28í\0009\29ê\0039\29ë\29=\29\14\28=\28\15\27>\27\3\0265\27î\0003\28ì\0=\28\v\0275\28ñ\0009\29ê\0039\29ï\29=\29\14\28=\28\15\27>\27\4\0265\27ò\0003\28ó\0=\28\v\0275\28ö\0009\29ê\0039\29ô\29=\29\14\28=\28\15\27>\27\5\0265\27ú\0003\28õ\0=\28Z\27>\27\6\0265\27û\0009\28ù\2=\28\"\0275\28†\0003\29ü\0=\29Z\28>\28\1\0275\28¢\0003\29°\0=\29Z\0289\29\27\0025\31£\0009 §\0034!\4\0>\15\1!>\5\2!>\b\3!B\29\4\0?\29\0\0>\28\2\0275\28¶\0003\29•\0=\29Z\28>\28\3\0275\28ß\0009\29b\1=\29Z\0289\29\27\0024\31\3\0009 ®\0> \1\0319 ©\0> \2\0319 ™\0035!¨\0005\"´\0009#\f\3=#\14\"=\"\15!>\25\1!B\29\4\0?\29\0\0>\28\4\0274\28\17\0>\t\1\28>\5\2\28>\n\3\28>\6\4\28>\26\5\28>\a\6\28>\24\a\28>\a\b\28>\23\t\28>\5\n\28>\5\v\28>\15\f\28>\5\r\28>\20\14\28>\5\15\28>\21\16\0285\29Æ\0003\30≠\0=\30Z\29>\n\1\29>\a\2\0295\30±\0009\31Ø\0049!∞\3*\"\1\0B\31\3\2=\31\14\0309\31≤\3=\31N\30=\30\15\0295\30¥\0003\31≥\0=\31Z\30>\15\1\30>\5\2\30>\a\3\0305\31∂\0003 µ\0= Z\0315 ∏\0009!∑\3=!N = \15\0315 ∫\0009!π\1=!Z >\t\1 >\5\2 > \1\31>\15\2\31>\5\3\31>\b\4\31>\a\5\0315 º\0003!ª\0=!\15 5!Œ\0005\"Ω\0009#\f\3=#æ\"9#.\3=#ø\"9#¿\3=#¡\"9#¿\3=#¬\"9#¿\3=#√\"9#2\3=#ƒ\"9#≈\3=#∆\"9#≈\3=#«\"9#≈\3=#»\"9#2\3=#…\"9#2\3=# \"9#À\3=#Ã\"9#.\3=#Õ\"=\"œ!3\"–\0=\"—!=!\24 9!ù\2=!\" >\30\1 >\31\2 >\29\3 >\28\4 6!\1\0'#“\0B!\2\0029!\5!\18# \0\18$\27\0B!\3\0012\0\0ÄK\0\1\0\rheirline\15mode_color\0\16mode_colors\1\0\0\6t\6!\bred\6r\6R\6\19\6S\6s\vpurple\6c\6\22\6V\6v\tcyan\6i\6n\1\0\0\1\0\0\0\1\0\0\14is_active\1\0\0\rdark_red\1\0\0\0\1\0\0\0\fbg_dark\1\0\2\tbold\1\nforce\2\17bg_highlight\rbrighten\1\0\0\0\1\0\0\1\0\0\14fg_gutter\18right_rounded\17left_rounded\1\0\0\1\0\1\rprovider\5\0\tred1\1\3\0\0\bÓÇ∂\bÓÇ¥\1\0\0\0\1\0\1\rprovider\5\0\1\0\0\28pick_child_on_condition\1\0\1\rprovider\6)\0\1\0\0\vchange\1\0\0\0\1\0\0\vdelete\1\0\0\0\1\0\0\badd\bgit\1\0\0\0\1\0\1\rprovider\6(\0\1\0\1\tbold\2\1\0\0\0\1\0\0\nblue6\0\1\0\0\16is_git_repo\1\0\1\rprovider\6]\1\0\0\thint\1\0\0\0\1\0\0\tinfo\1\0\0\0\1\0\0\fwarning\1\0\0\0\1\0\0\nerror\1\0\0\0\1\0\1\rprovider\a![\0\14hint_icon\23DiagnosticSignHint\14info_icon\23DiagnosticSignInfo\14warn_icon\23DiagnosticSignWarn\15error_icon\1\0\0\ttext\24DiagnosticSignError\20sign_getdefined\afn\bvim\1\0\0\20has_diagnostics\1\0\0\tgray\17get_location\1\0\0\17is_available\rnvim-gps\1\0\1\tbold\2\14condition\1\0\1\rprovider\fLSP ÔàÖ\17lsp_attached\1\0\1\rprovider\5\1\0\0\0\1\0\0\0\28make_flexible_component\1\0\1\tbold\1\1\0\0\0\abg\nblue7\1\0\0\nblue0\0\1\0\0\tsbar\1\0\0\1\t\0\0\b‚ñÅ\b‚ñÇ\b‚ñÉ\b‚ñÑ\b‚ñÖ\b‚ñÜ\b‚ñá\b‚ñà\1\0\1\rprovider\23%7(%l/%3L%):%2c %P\1\0\0\0\1\0\0\0\1\0\0\0\1\0\0\0\1\0\1\tbold\2\tType\1\0\0\0\1\0\1\rprovider\a%<\vunpack\vinsert\1\0\0\0\1\0\0\vorange\1\0\0\0\1\0\0\ngreen\1\0\0\0\1\0\0\14Directory\18get_highlight\1\0\0\0\0\0\1\0\0\0\tinit\1\0\0\0\1\0\0\1\0\1\afg\nblack\0\1\3\0\0\bÓÇ∂\bÓÇ¥\rsurround\0\0\vstatic\1\0\0\15mode_names\1\0\0\1\0\"\6r\b...\bniI\aNi\6V\bVI_\6v\aVI\6S\aS_\bniR\aNr\6i\aIN\ano\aN?\6!\6!\6\19\a^S\6\22\a^V\aix\aIx\aic\aIc\bniV\aNv\6R\aRE\6c\aCO\6t\tTERM\avs\aVs\aVs\aVs\a\22s\a^V\aRc\aRc\aRx\aRx\bRvc\aRv\aRv\aRv\bRvx\aRv\6s\6S\acv\aEx\ar?\6?\ant\aNt\arm\6M\bnoV\aN?\bnov\aN?\6n\aNO\bno\22\aN?\1\0\1\tbold\2\1\0\0\0\1\0\1\rprovider\a%=\ahl\afg\1\0\0\tblue\rprovider\1\0\0\22vertical_bar_thin\6 \1\0\1\rprovider\6 \20tokyonight.util\nsetup\22tokyonight.colors\19heirline.utils\24heirline.conditions\frequire\1\0\22\21slant_right_thin\bÓÇπ\22vertical_bar_thin\b‚îÇ\nright\bÓÇ±\23right_rounded_thin\bÓÇµ\18right_rounded\bÓÇ¥\17vertical_bar\b‚îÉ\22left_rounded_thin\bÓÇ∑\16folder_icon\tÓóæ \vcircle\b‚óè\16left_filled\bÓÇ≤\tleft\bÓÇ≥\17right_filled\bÓÇ∞\15slant_left\bÓÇ∫\17left_rounded\bÓÇ∂\20slant_left_thin\bÓÇª\16slant_right\bÓÇ∏\16github_icon\n ÔØô \17slant_left_2\bÓÇæ\22slant_left_2_thin\bÓÇø\nblock\b‚ñà\18slant_right_2\bÓÇº\23slant_right_2_thin\bÓÇΩ\3ÄÄ¿ô\4ÁÃô≥\6≥ÊÃ˛\3\0", "config", "heirline.nvim")
time([[Config for heirline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nú\5\0\0\6\0\31\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\19\0005\4\14\0005\5\15\0=\5\16\0045\5\17\0=\5\18\4=\4\20\0035\4\21\0005\5\22\0=\5\23\4=\4\24\3=\3\25\2B\0\2\0016\0\0\0'\2\26\0B\0\2\0029\0\27\0B\0\1\0029\1\28\0'\2\30\0=\2\29\1K\0\1\0\tocto\27filetype_to_parsername\rmarkdown\23get_parser_configs\28nvim-treesitter.parsers\16textobjects\vselect\fkeymaps\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\2\14lookahead\2\venable\2\tmove\1\0\0\24goto_previous_start\1\0\1\a[[\20@function.outer\20goto_next_start\1\0\1\a]]\20@function.outer\1\0\2\14set_jumps\2\venable\2\rrefactor\28highlight_current_scope\1\0\0\1\0\1\venable\2\21ensure_installed\1\a\0\0\15javascript\15typescript\tjson\vprisma\thttp\blua\14highlight\1\0\0\fdisable\1\4\0\0\rmarkdown\6c\trust\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: registers.nvim
time([[Config for registers.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\frounded\28registers_window_border\6g\bvim\0", "config", "registers.nvim")
time([[Config for registers.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\ná\2\0\0\a\0\14\0\0206\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\6\0005\2\5\0=\2\a\1=\1\4\0005\0\b\0006\1\0\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\1K\0\1\0\27<Plug>(vsnip-cut-text)\18<Leader><Tab>\6x\20nvim_set_keymap\bapi\1\0\2\vsilent\1\fnoremap\2\20typescriptreact\1\0\0\1\2\0\0\15typescript\20vsnip_filetypes\27~/rc/nvim_lua/snippets\22vsnip_snippet_dir\6g\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
try_loadstring("\27LJ\2\nü\2\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\1\0\3\17show_headers\2\rshow_url\2\19show_http_info\2\14highlight\1\0\2\ftimeout\3ñ\1\fenabled\2\1\0\5\26skip_ssl_verification\2\20jump_to_request\1\28result_split_horizontal\1\17yank_dry_run\2\renv_file\t.env\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time([[Config for rest.nvim]], false)
-- Config for: lexima.vim
time([[Config for lexima.vim]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\30lexima_enable_basic_rules\6g\bvim\0", "config", "lexima.vim")
time([[Config for lexima.vim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2p\0\2\n\0\4\0\0156\2\0\0009\2\1\0029\2\2\0026\4\0\0009\4\1\0049\4\3\4\18\6\0\0+\a\2\0+\b\2\0+\t\2\0B\4\5\2\18\5\1\0+\6\2\0B\2\4\1K\0\1\0\27nvim_replace_termcodes\18nvim_feedkeys\bapi\bvim;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimÂ\1\0\1\5\3\b\1 -\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\22Ä6\1\2\0009\1\3\0019\1\4\1)\3\1\0B\1\2\2\t\1\0\0X\1\5Ä-\1\1\0'\3\5\0'\4\6\0B\1\3\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\a\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\2¿\1¿\0¿\rcomplete\5!<Plug>(vsnip-expand-or-jump)\20vsnip#available\afn\bvim\21select_next_item\fvisible\2®\1\0\0\4\2\a\1\21-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\vÄ6\0\2\0009\0\3\0009\0\4\0)\2ˇˇB\0\2\2\t\0\0\0X\0\4Ä-\0\1\0'\2\5\0'\3\6\0B\0\3\1K\0\1\0\2¿\1¿\5\28<Plug>(vsnip-jump-prev)\19vsnip#jumpable\afn\bvim\21select_prev_item\fvisible\2‚\a\1\0\f\0>\0Ç\0013\0\0\0003\1\1\0006\2\2\0'\4\3\0B\2\2\0029\3\4\0025\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0055\6\r\0009\a\n\0023\t\v\0005\n\f\0B\a\3\2=\a\14\0069\a\n\0023\t\15\0005\n\16\0B\a\3\2=\a\17\0069\a\n\0029\t\n\0029\t\18\t)\v¸ˇB\t\2\0025\n\19\0B\a\3\2=\a\20\0069\a\n\0029\t\n\0029\t\18\t)\v\4\0B\t\2\0025\n\21\0B\a\3\2=\a\22\0069\a\n\0029\t\n\0029\t\23\tB\t\1\0025\n\24\0B\a\3\2=\a\25\0069\a\n\0029\t\n\0029\t\23\tB\t\1\0025\n\26\0B\a\3\2=\a\27\0069\a\28\0029\a\29\a=\a\30\0069\a\n\0025\t \0009\n\n\0029\n\31\nB\n\1\2=\n!\t9\n\n\0029\n\"\nB\n\1\2=\n#\tB\a\2\2=\a$\0069\a\n\0029\a%\a5\t&\0B\a\2\2=\a'\6=\6\n\0059\6\28\0029\6(\0064\b\3\0005\t)\0>\t\1\b5\t*\0>\t\2\b4\t\3\0005\n+\0>\n\1\tB\6\3\2=\6(\5B\3\2\0019\3\4\0029\3,\3'\5-\0005\6/\0004\a\3\0005\b.\0>\b\1\a=\a(\6B\3\3\0019\3\4\0029\3,\3'\0050\0005\0063\0009\a\28\0029\a(\a4\t\3\0005\n1\0>\n\1\t4\n\3\0005\v2\0>\v\1\nB\a\3\2=\a(\6B\3\3\0016\3\2\0'\0054\0B\3\2\0029\0035\0036\0056\0009\0057\0059\0058\0059\0059\5B\5\1\0A\3\0\0026\4\2\0'\6:\0B\4\2\0029\4;\0049\4\4\0045\6<\0=\3=\6B\4\2\0012\0\0ÄK\0\1\0\17capabilities\1\0\0\rtsserver\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\nvsnip\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<m-Space>\1\3\0\0\6i\6c\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0\0\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nº\3\0\0\6\0\16\1!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\5\0006\0\0\0009\0\1\0*\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\2\0=\1\a\0006\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\0016\0\0\0009\0\14\0'\2\15\0B\0\2\1K\0\1\0á\1                inoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n                tnoremap <C-t> <C-\\><C-n>:FloatermToggle<CR>\n        \bcmd\1\0\1\fnoremap\2\24:FloatermToggle<CR>\n<C-t>\6n\20nvim_set_keymap\bapi\23floaterm_autoclose\20floaterm_height\19floaterm_width\22floaterm_winblend\vcenter\22floaterm_position\6g\bvimõ≥ÊÃ\25Ãô≥ˇ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\nÇ\3\0\0\14\0\20\1(6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0005\3\4\0006\4\0\0'\6\5\0B\4\2\0029\4\6\0044\6\3\0006\a\0\0'\t\a\0B\a\2\2\18\t\a\0009\a\2\a6\n\b\0009\n\t\n9\n\n\n'\v\v\0'\f\f\0'\r\r\0B\a\6\2\18\t\a\0009\a\14\aB\a\2\0?\a\0\0B\4\2\2=\4\15\0036\4\0\0'\6\16\0B\4\2\0029\4\17\4B\4\1\2=\4\18\3B\0\3\2\18\2\0\0009\0\19\0B\0\2\1K\0\1\0\tfind\vsorter\26fuzzy_with_index_bias\22telescope.sorters\vfinder\rabsolute\rinit.lua\rnvim_lua\f.config\tHOME\benv\bvim\17plenary.path\14new_table\22telescope.finders\1\0\1\17prompt_title\18Custom Picker\topts\bnew\22telescope.pickers\frequire\3ÄÄ¿ô\4(\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\tenew\bcmd\bvim\21\0\0\2\1\0\0\3-\0\0\0B\0\1\1K\0\1\0\0\0›\v\1\0\6\0016\0f6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0006\1\0\0009\1\t\0019\1\n\1'\2\v\0&\1\2\1=\1\b\0006\0\0\0009\0\1\0)\1\f\0=\1\f\0006\0\0\0009\0\1\0)\1P\0=\1\r\0003\0\14\0007\0\15\0005\0\23\0005\1\17\0005\2\16\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\21\2=\2\22\1=\1\24\0005\1\26\0005\2\25\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\27\2=\2\22\1=\1\28\0005\1\30\0005\2\29\0=\2\18\0016\2\19\0'\4\20\0B\2\2\0029\2\31\2=\2\22\1=\1 \0005\1\"\0005\2!\0=\2\18\0013\2#\0=\2\22\1=\1$\0005\1&\0005\2%\0=\2\18\0013\2'\0=\2\22\1=\1(\0006\1\19\0'\3)\0B\1\2\2\18\3\1\0009\1*\0016\4\0\0009\4+\0049\4,\4B\4\1\2'\5-\0B\1\4\2\18\3\1\0009\1.\1B\1\2\2\15\0\1\0X\2\4Ä5\0011\0005\0020\0=\2\18\1=\1/\0006\1\0\0009\1\1\1=\0002\0016\1\0\0009\1\1\1)\2\1\0=\0023\0016\1\0\0009\0014\1'\0035\0B\1\2\1K\0\1\0\1¿·\1                augroup MyDashMappingr\n                    autocmd!\n                    autocmd Filetype dashboard call luaeval('require\"pyrho.plugins.conf.dashboard\".mappings()')\n                augroup END\n            \bcmd!dashboard_disable_statusline\29dashboard_custom_section\1\0\1\fcommand\23source Session.vim\1\2\0\0009ÔÑå  Resume Obsession                              0\ra_obsess\vexists\16Session.vim\vgetcwd\afn\bnew\17plenary.path\15z_nvimconf\0\1\0\0\1\2\0\0009Óò´  Browse config                                 c\nd_new\0\1\0\0\1\2\0\0009ÔÖõ  New File                                      e\rc_search\14live_grep\1\0\0\1\2\0\0009Ô°à  Grep                                          s\nb_old\roldfiles\1\0\0\1\2\0\0009Ôáö  Old files                                     O\ra_browse\1\0\0\fcommand\afd\22telescope.builtin\frequire\16description\1\0\0\1\2\0\0009ÔÖú  Browse                                        o\21my_custom_picker\0!dashboard_preview_file_width\"dashboard_preview_file_height\29/.config/nvim/sunjon.cat\tHOME\benv\27dashboard_preview_file\17lolcat -S 90\31dashboard_preview_pipeline\bcat\30dashboard_preview_command\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Conditional loads
time([[Conditional loading of nvim-lsp-installer]], true)
  require("packer.load")({"nvim-lsp-installer"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-lsp-installer]], false)
time([[Conditional loading of zk-nvim]], true)
  require("packer.load")({"zk-nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of zk-nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd tabular ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'fugitive-gitlab.vim'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-js-indent'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], true)
vim.cmd [[source /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]]
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]], false)
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/pyrho/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
