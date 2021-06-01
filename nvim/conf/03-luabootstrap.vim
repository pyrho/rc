" Shamefully stolen from https://github.com/fsouza/dotfiles/blob/20aa0be6d06224224a50d24c5b63929f16cdb7da/nvim/lua/fsouza/plugin/init.lua
" https://blog.fsouza.dev/prettierd-neovim-format-on-save/
lua<<EOF
local vcmd = vim.cmd
local vfn = vim.fn
local helpers = require('fsouza.lib.nvim_helpers')


local function setup_autofmt_commands()
  vcmd([[command! ToggleAutofmt lua require('fsouza.lib.autofmt').toggle()]])
  vcmd([[command! ToggleGlobalAutofmt lua require('fsouza.lib.autofmt').toggle_g()]])
end


local function setup_prettierd()
  local auto_fmt_fts = {
    'json';
    'javascript';
    'typescript';
    'css';
    'html';
    'typescriptreact';
    'yaml';
  }
  helpers.augroup('auto_prettierd', {
    {
      events = {'FileType'};
      targets = auto_fmt_fts;
      command = helpers.fn_cmd(function()
        require('plugin.prettierd').setup_autofmt(vim.fn.expand('<abuf>'))
      end);
    };
    {
      events = {'FileType'};
      targets = auto_fmt_fts;
      command = [[nmap <buffer> <silent> <leader>i ]] ..
        [[<cmd>lua require('plugin.prettierd').format(vim.fn.expand('<abuf>'))<cr>]];
    };
  })
end

do
  local schedule = vim.schedule
  -- schedule(function()
  --   require('fsouza.vim-plug').setup_command()
  -- end)
  schedule(function()
    require('fsouza.lib.cleanup').setup()
  end)
  -- schedule(setup_editorconfig)
  -- schedule(setup_fuzzy_mappings)
  -- schedule(setup_hlyank)
  -- schedule(function()
  --   require('fsouza.plugin.mkdir').setup()
  -- end)
  schedule(setup_autofmt_commands)
  -- schedule(setup_word_replace)
  -- schedule(setup_spell)
  schedule(setup_prettierd)
  -- schedule(setup_shortcuts)
  -- schedule(function()
  --   require('colorizer').setup({'css'; 'javascript'; 'html'; 'lua'; 'htmldjango'})
  -- end)
  -- schedule(function()
  --   require('fsouza.plugin.ft').setup()
  -- end)
  -- schedule(setup_terminal_mappings_and_commands)
  -- schedule(function()
  --   require('fsouza.lsp')
  -- end)
  -- schedule(function()
  --   require('fsouza.plugin.ts')
  -- end)
  -- schedule(trigger_ft)
  schedule(function()
    vcmd([[doautocmd User PluginReady]])
  end)
end
EOF
