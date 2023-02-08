vim.cmd [[ packadd packer.nvim ]]

require"pyrho.plugins.reload".setup_autocmd()

return require("packer").startup({
  function()
    use {"wbthomason/packer.nvim", opt = true}

    -- Startpage
    -- Until sessions are opt-out I'll use my fork because the `:SessionLoad` etc. commands
    -- defined in this plugin conflict with the ones defined in persisted.nvim.
    -- https://github.com/glepnir/dashboard-nvim/issues/217
    use {
      'pyrho/dashboard-nvim',
      branch = 'feat/remove-session-stuff',
      config = require'pyrho.plugins.conf.dashboard'.config
    }

    -- See https://github.com/neovim/neovim/issues/12587
    use {
      "antoinemadec/FixCursorHold.nvim",
      run = function() vim.g.curshold_updatime = 1000 end
    }

    -- Distraction free writing
    use {
      "junegunn/goyo.vim",
      config = function() vim.g.goyo_height = "70%" end,
      cmd = "Goyo"
    }

    -- Colorscheme
    use {
      "folke/tokyonight.nvim",
      config = require"pyrho.plugins.conf.tokyonight".config
    }

    -- Smart commenting
    use {
      'numToStr/Comment.nvim',
      config = function() require'Comment'.setup() end
    }

    -- Better JS indent
    use {"jason0x43/vim-js-indent", ft = "javascript"}

    -- Highlight words
    use {
      'azabiong/vim-highlighter',
      config = function()
        local map_opts = {noremap = true, silent = false}
        vim.api.nvim_set_keymap("n", "<CR>", "<Cmd>Hi}<CR>", map_opts)
        vim.api.nvim_set_keymap("n", "<BS>", "<Cmd>Hi{<CR>", map_opts)
        vim.g.HiSyncMode = 1
      end
    }

    -- Git gutter plugin
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup({
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
            end, {expr = true})

            map('n', '[c', function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
            end, {expr = true})

            -- Actions
            --[[ map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
            map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
            map('n', '<leader>hS', gs.stage_buffer) ]]
            -- map('n', '<leader>hu', gs.undo_stage_hunk)
            -- map('n', '<leader>hR', gs.reset_buffer)
            map('n', '<leader>gp', gs.preview_hunk)
            map('n', '<leader>gb', function()
              gs.blame_line {full = true}
            end)
            map('n', '<leader>tb', gs.toggle_current_line_blame)
            map('n', '<leader>d', gs.diffthis)
            map('n', '<leader>D', function() gs.diffthis('~') end)
            -- map('n', '<leader>td', gs.toggle_deleted)

            -- Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end
        })
      end
    }

    -- Git integration
    use {
      {"tpope/vim-fugitive"}, {
        "shumphrey/fugitive-gitlab.vim",
        requires = "tpope/vim-fugitive",
        cmd = "GBrowse"
      }, {"tpope/vim-rhubarb", requires = "tpope/vim-fugitive"}
    }

    -- Full lua Statusline
    use {
      "rebelot/heirline.nvim",
      config = function()
        -- require"pyrho.plugins.conf.heirline".config
        require"pyrho.plugins.conf.heirline".config()
      end,
      -- We need to instantiate this plugin after lsp-config because we rely on Signs defined
      -- in that config
      after = "nvim-lspconfig"

      -- Use this to debug, it will give the exact error stack trace
      -- config = function()
      --   vim.cmd(
      --       'luafile ~/rc/nvim/lua/pyrho/plugins/conf/heirline.lua')
      -- end,

    }

    -- Signature auto complete helper
    use {
      'ray-x/lsp_signature.nvim',
      -- 2022-09-19: There's a bug where the window shows up on top of the current
      -- line, making edits quite painful..
      -- See https://github.com/ray-x/lsp_signature.nvim/issues/182
      disable = true,
      config = require'pyrho.plugins.conf.lsp_signature'.config
    }

    --[[ -- Record sessions
    use {"benknoble/vim-obsession", branch = "this_session"} ]]

    -- Record sessions (better than obsession)
    use({
      "olimorris/persisted.nvim",
      -- module = "persisted", -- For lazy loading
      config = function()
        require("persisted").setup({
          use_git_branch = true, -- create session files based on the branch of the git enabled repository
          follow_cwd = true, -- change session file name to match current working directory if it changes
          autoload = false, -- automatically load the session for the cwd on Neovim startup
          allowed_dirs = {'~/code/caribou/main-repo'}, -- table of dirs that the plugin will auto-save and auto-load from
          branch_separator = "@@"
        })
        require("telescope").load_extension("persisted") -- To load the telescope extension
      end
    })

    -- The all in one Fuzzy Finder
    use {
      "nvim-lua/telescope.nvim",
      requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"},
      config = require"pyrho.plugins.conf.telescope".config
    }

    -- Telescope plugin for fzf integration
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Better / * # search mappings
    use "junegunn/vim-slash"

    -- Align stuff easily (must come before vim-markdown)
    use "godlygeek/tabular"

    -- Align text
    use 'junegunn/vim-easy-align'

    -- Change surrounding pairs
    use {
      "machakann/vim-sandwich",
      config = function()
        vim.cmd [[ runtime macros/sandwich/keymap/surround.vim ]]
      end
    }

    -- Better matching of pairs
    use "andymass/vim-matchup"

    use {
      'ggandor/leap.nvim',
      config = function()
        require('leap').opts.highlight_unlabeled = true
        require('leap').add_default_mappings()
      end
    }
    use {
      'ggandor/leap-spooky.nvim',
      config = function()
        require('leap-spooky').setup {
          affixes = {
            -- These will generate mappings for all native text objects, like:
            -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
            -- Special line objects will also be added, by repeating the affixes.
            -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
            -- window.
            -- You can also use 'rest' & 'move' as mnemonics.
            remote = {window = 'r', cross_window = 'R'},
            magnetic = {window = 'm', cross_window = 'M'}
          },
          -- If this option is set to true, the yanked text will automatically be pasted
          -- at the cursor position if the unnamed register is in use (and the object is
          -- "non-magnetic").
          yank_paste = true
        }
      end
    }
    -- Smart f motions
    --[[ use {
      "justinmk/vim-sneak",
      config = function()
        vim.g["sneak#label"] = 1
      end
    } ]]
    -- pairs autoclosing
    use {
      "cohama/lexima.vim",
      config = function() vim.g.lexima_enable_basic_rules = 1 end
    }

    -- Show hex color codes
    use "norcalli/nvim-colorizer.lua"

    --  Highlight where the cursor jumped
    use "danilamihailov/beacon.nvim"

    --[[ {{{
                           ┌────────────────────────┐
                           │░█▀▀░█░█░█▀█░▀█▀░█▀█░█░█│
                           │░▀▀█░░█░░█░█░░█░░█▀█░▄▀▄│
                           │░▀▀▀░░▀░░▀░▀░░▀░░▀░▀░▀░▀│
                           └────────────────────────┘
--]]

    -- Better markdown support
    use {
      "preservim/vim-markdown",
      after = "tabular",
      ft = "markdown",
      config = function() vim.g.vim_markdown_conceal = 1 end
    }

    use "stephpy/vim-yaml"
    use "lifepillar/pgsql.vim"
    use 'NoahTheDuke/vim-just'
    use {"elzr/vim-json", ft = "json"}
    use "elixir-editors/vim-elixir"

    -- }}}

    -- Float terminal
    use {
      "numToStr/FTerm.nvim",
      config = function()
        vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
        vim.keymap.set('t', '<A-i>',
                       '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
      end
    }

    -- Focus on a portion of code
    use "chrisbra/nrrwrgn"

    -- DB client
    use {
      "tpope/vim-dadbod", {
        "kristijanhusak/vim-dadbod-ui",
        config = require"pyrho.plugins.conf.dadbod".config,
        requires = "tpope/vim-dadbod"
      }
    }

    -- Popup menu feature (used by dadbod-ui iirc)
    use "kamykn/popup-menu.nvim"

    --[[ {{{
                  ┌──────────────────────────────────────────┐
                  │░▀█▀░█▀▄░█▀▀░█▀▀░░░█▀▀░▀█▀░▀█▀░▀█▀░█▀▀░█▀▄│
                  │░░█░░█▀▄░█▀▀░█▀▀░░░▀▀█░░█░░░█░░░█░░█▀▀░█▀▄│
                  │░░▀░░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀│
                  └──────────────────────────────────────────┘
  --]]
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = require"pyrho.plugins.conf.treesitter".config
    }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/nvim-treesitter-refactor"

    -- }}}

    --[[ {{{
                                 ┌────────────┐
                                 │░█░░░█▀▀░█▀█│
                                 │░█░░░▀▀█░█▀▀│
                                 │░▀▀▀░▀▀▀░▀░░│
                                 └────────────┘
  -- ]]

    -- Display a little widget at startup to show LSP server statuses
    use {'j-hui/fidget.nvim', config = function() require'fidget'.setup {} end}

    -- LSP stuff
    use {
      "neovim/nvim-lspconfig",
      config = require"pyrho.plugins.conf.nvim-lspconfig".config
    }

    use {
      "williamboman/nvim-lsp-installer",
      requires = "neovim/nvim-lspconfig",
      config = require"pyrho.plugins.conf.nvim-lspinstall".config,
      cond = function() return not require"pyrho.helpers".is_zen() end
    }

    use {
      {"hrsh7th/nvim-cmp", config = require"pyrho.plugins.conf.nvim-cmp".config},
      'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip'
    }

    use {'onsails/lspkind.nvim'}

    use {
      'hrsh7th/vim-vsnip',
      config = function()
        vim.g.vsnip_snippet_dir = '~/rc/nvim/snippets'
        vim.g.vsnip_filetypes = {typescriptreact = {'typescript'}}
        --[[ vim.g.vsnip_filetypes.typescriptreact = {'typescript'}
            vim.g.vsnip_filetypes.javascript = {'typescript'} ]]
        -- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
        -- See https://github.com/hrsh7th/vim-vsnip/pull/50
        local opts = {noremap = true, silent = false}
        vim.api.nvim_set_keymap("x", "<Leader><Tab>", "<Plug>(vsnip-cut-text)",
                                opts)
      end
    }

    use {
      'glepnir/lspsaga.nvim',
      config = require"pyrho.plugins.conf.lspsaga".config,
      branch = "main"
    }
    -- }}}

    -- Format code with external tools
    use {
      "https://github.com/mhartington/formatter.nvim",
      config = require"pyrho.plugins.conf.formatter".config
    }

    -- Fancy icons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-web-devicons'.setup {default = true} end
    }

    -- 2022-10-03: Disabled this as I'm mostly working with kitty instead of tmux
    -- Tmux integration, allows seamless transition between vim windows and tmux panes
    --[[ use {
      "aserowy/tmux.nvim",
      config = function()
        require("tmux").setup({
          -- overwrite default configuration
          -- here, e.g. to enable default bindings
          navigation = {
            -- enables default keybindings (C-hjkl) for normal mode
            enable_default_keybindings = true
          },
          resize = {
            -- enables default keybindings (A-hjkl) for normal mode
            enable_default_keybindings = false
          }
        })
      end
    } ]]

    -- File explorer, similar to vim-vinegar
    use {
      "lambdalisue/fern.vim",
      config = require"pyrho.plugins.conf.fern".config,
      requires = {
        "lambdalisue/glyph-palette.vim", "lambdalisue/fern-git-status.vim",
        "lambdalisue/fern-hijack.vim", "lambdalisue/fern-renderer-nerdfont.vim",
        "lambdalisue/nerdfont.vim"
      }
    }

    -- The legendary fuzzy finder
    use {
      "junegunn/fzf.vim",
      config = require"pyrho.plugins.conf.fzf".config,
      requires = {{"junegunn/fzf", run = "./install --bin"}}
    }

    -- HTTP client
    -- use {
    --   "NTBBloodbath/rest.nvim",
    --   requires = {"nvim-lua/plenary.nvim"},
    --   -- Using this commit until https://github.com/NTBBloodbath/rest.nvim/issues/114 is fixed
    --   commit = "2826f6960fbd9adb1da9ff0d008aa2819d2d06b3",
    --   config = function()
    --     require("rest-nvim").setup({
    --       -- Open request results in a horizontal split
    --       result_split_horizontal = false,
    --       -- Skip SSL verification, useful for unknown certificates
    --       skip_ssl_verification = true,
    --       -- Highlight request on run
    --       highlight = {enabled = true, timeout = 150},
    --       result = {
    --         -- toggle showing URL, HTTP info, headers at top the of result window
    --         show_url = true,
    --         show_http_info = true,
    --         show_headers = true
    --       },
    --       -- Jump to request line on run
    --       jump_to_request = false,
    --       env_file = '.env',
    --       custom_dynamic_variables = {},
    --       yank_dry_run = true
    --     })
    --   end
    -- }

    use {
      -- [This PR](https://github.com/rest-nvim/rest.nvim/pull/122) of rest.nvim introduces some nice features
      -- Until its merged, let's use that.
      'D-James-GH/rest.nvim',
      branch = 'feature/selectable-json-env',
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,

          result_split_in_place = true,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = true,
          -- Highlight request on run
          highlight = {enabled = true, timeout = 150},
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
            formatters = {
              json = "jq",
              html = function(body)
                return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
              end
            }
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true
        })
      end

    }

    -- Show a popup window with the contents of registers for pasting
    use {
      "tversteeg/registers.nvim",
      config = function() vim.g.registers_window_border = "rounded" end
    }

    -- Zettelkasten
    use {
      'mickael-menu/zk-nvim',
      cond = function() return require"pyrho.helpers".is_zen() end,
      config = function()
        require("zk").setup({
          -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
          -- it's recommended to use "telescope" or "fzf"
          picker = "telescope",

          lsp = {
            -- `config` is passed to `vim.lsp.start_client(config)`
            config = {
              cmd = {"zk", "lsp"},
              name = "zk",
              on_attach = function(client, bufnr)
                vim.diagnostic.config({signs = false, underline = false})
              end
              -- on_attach = ...
              -- etc, see `:h vim.lsp.start_client()`
            },

            -- automatically attach buffers in a zk notebook that match the given filetypes
            auto_attach = {enabled = true, filetypes = {"markdown"}}
          }
        })

        local opts = {noremap = true, silent = false}

        -- Create a new note after asking for its title.
        vim.api.nvim_set_keymap("n", "gzn",
                                "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>",
                                opts)

        -- Open notes.
        vim.api.nvim_set_keymap("n", "gzz",
                                "<Cmd>ZkNotes { sort = { 'modified' }, exclude = { 'diary' } }<CR>",
                                opts)
        -- Open notes associated with the selected tags.
        vim.api.nvim_set_keymap("n", "gzt", "<Cmd>ZkTags<CR>", opts)

        -- Search for the notes matching the current visual selection.
        vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
      end
    }

    -- Glow markdown reader integration
    use {"ellisonleao/glow.nvim", branch = 'main'}

    -- A tab line
    use {
      'alvarosevilla95/luatab.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require'luatab'.setup {
          windowCount = function(idx) return "[" .. idx .. "] " end,
          modified = function() return "" end,
          separator = function(idx)
            local s = require('pyrho.helpers').separators.right
            return (idx < vim.fn.tabpagenr('$') and '%#TabLine#' .. s or '')
          end
        }
      end
    }

    use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig",
      config = function() vim.g.navic_silence = true end
    }

    use {
      'tyru/open-browser.vim',
      config = function()
        local map_opts = {noremap = true, silent = false}
        vim.api.nvim_set_keymap("n", "go", "<Plug>(openbrowser-smart-search)",
                                map_opts)
        vim.api.nvim_set_keymap("v", "go", "<Plug>(openbrowser-smart-search)",
                                map_opts)
        vim.g.netrw_nogx = 1
      end
    }

    -- Lua
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {use_diagnostic_signs = true}
      end
    }

    use {'pleshevskiy/d2-vim', branch = 'issue-3'}
  end,
  config = {
    luarocks = {python_cmd = "python3"},
    snapshot_path = '/Users/pyrho/resilio/main/backups'
  }
})

--[[
                             ┌────────────────────┐
                             │░█▀█░█▀█░▀█▀░█▀▀░█▀▀│
                             │░█░█░█░█░░█░░█▀▀░▀▀█│
                             │░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀│
                             └────────────────────┘
# 2022-05-28
Moved from Yggdroot/vim-mark to azabiong/vim-highlighter, it seem more feature packed

# 2022-10-17
Moved from vim-obsession to persisted.nvim

# 2022-10-27
Moved from voldikss/vim-floaterm to FTerm.nvim

# 2022-11-03 
Modified telescope defaults to use "smart" path truncation, it's said to have a performance impact
--]]
