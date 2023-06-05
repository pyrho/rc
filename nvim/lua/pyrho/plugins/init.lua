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
      -- 2023-05-26 : Trying again
      -- 2023-05-26 : Waaay too slow!!
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
          allowed_dirs = {"~/code/caribou/main-repo"}, -- table of dirs that the plugin will auto-save and auto-load from
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
      "machakann/vim-sandwich", config = function()
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
          yank_paste = false
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
    -- 2023-04-24 Not really using it
    -- use "chrisbra/nrrwrgn"

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
    -- 2023-05-05 Using my branch until this gets merged.
    -- use {'j-hui/fidget.nvim', config = function() require'fidget'.setup {} end}
    use {
      'pyrho/fidget.nvim',
      branch = 'feat/max-messages',
      config = function() require'fidget'.setup {} end
    }

    -- LSP stuff
    use {
      {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
      }, {
        "williamboman/mason-lspconfig.nvim",
        cond = function() return not require"pyrho.helpers".is_zen() end,
        config = function()
          local map = vim.api.nvim_buf_set_keymap

          local function configureForLspSaga()
            -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
            map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>",
                {silent = true, noremap = true})
            map(0, "n", "K", "<cmd>Lspsaga hover_doc<cr>",
                {silent = true, noremap = true})

            map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>",
                {silent = true, noremap = true})
            map(0, "n", "gO", "<cmd>Lspsaga show_cursor_diagnostics<cr>",
                {silent = true, noremap = true})

            -- map(0, "n", "gd", "<cmd>Lspsaga goto_definition<cr>",
            --     {silent = true, noremap = true})
            --
            map(0, "n", "gp", "<cmd>Lspsaga peek_definition<cr>",
                {silent = true, noremap = true})
            --
            -- map(0, "n", "gr", "<cmd>Lspsaga lsp_finder<cr>",
            --     {silent = true, noremap = true})
            --
            -- map(0, "n", "gy", "<cmd>Telescope lsp_type_definitions<cr>",
            --     {silent = true, noremap = true})

            -- map(0, "n", "g0", "<cmd>Lspsaga outline<cr>",
            --     {silent = true, noremap = true})

            -- map(0, "n", "gS",
            --     "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            --     {silent = true, noremap = true})

            map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>",
                {silent = true, noremap = true})

            map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>",
                {silent = true, noremap = true})
          end

          local function configureForGlance()
            map(0, "n", "gd", "<cmd>Glance definitions<cr>",
                {silent = true, noremap = true})

            map(0, "n", "gr", "<cmd>Glance references<cr>",
                {silent = true, noremap = true})

            map(0, "n", "gy", "<cmd>Glance type_definitions<cr>",
                {silent = true, noremap = true})
          end

          local function configureForFzfLua()
            map(0, "n", "gS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
                {silent = true, noremap = true})

            map(0, "n", "g0", "<cmd>FzfLua lsp_document_symbols<cr>",
                {silent = true, noremap = true})
          end

          local function configureMappings()
            configureForLspSaga()
            configureForGlance()
            configureForFzfLua()
          end

          local function configureForTrouble()
            vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xw",
                           "<cmd>TroubleToggle workspace_diagnostics<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xd",
                           "<cmd>TroubleToggle document_diagnostics<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "gy",
                           "<cmd>TroubleToggle lsp_type_definitions<cr>",
                           {silent = true, noremap = true})
            vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>",
                           {silent = true, noremap = true})

          end
          require("mason-lspconfig").setup({
            ensure_installed = {
              "lua_ls", "vtsls", "elixirls", "elmls", "prismals", "zk", "ltex",
              "yamlls"
            }
          })
          require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {
                on_attach = function(client, bufnr)
                  require('nvim-navic').attach(client, bufnr)
                  configureMappings()
                end
              }
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            ["ltex"] = function()
              require('lspconfig').ltex.setup {
                on_attach = function(client, bufnr)
                  require('nvim-navic').attach(client, bufnr)
                  configureMappings()
                end,
                filetypes = {"markdown"},
                cmd = {"/opt/homebrew/bin/ltex-ls"},
                settings = {
                  ltex = {
                    dictionary = {['en_US'] = {"HPAQ"}},
                    diagnosticSeverity = 'information',
                    language = 'en-US',
                    additionalRules = {
                      motherTongue = 'fr',
                      languageModel = '~/.ngrams'
                    }
                  }
                }
              }
            end,

            ["yamlls"] = function()
              require('lspconfig').yamlls.setup {
                on_attach = function(client, bufnr)
                  require('nvim-navic').attach(client, bufnr)
                  configureMappings()
                end,
                settings = {
                  yaml = {
                    schemas = {
                      ["https://json.schemastore.org/taskfile.json"] = "Taskfile*.yml",
                      ["https://json.schemastore.org/circleciconfig.json"] = ".circleci/config.yml"
                    }
                  }
                }
              }
            end
          }

        end
      }, {
        "neovim/nvim-lspconfig",
        config = function()
          require"pyrho.plugins.conf.nvim-lspconfig".config()
        end
      }
    }

    -- Deprecated
    --[[ use {
      "williamboman/nvim-lsp-installer",
      requires = "neovim/nvim-lspconfig",
      config = require"pyrho.plugins.conf.nvim-lspinstall".config,
      cond = function() return not require"pyrho.helpers".is_zen() end
    } ]]

    use {
      {"hrsh7th/nvim-cmp", config = require"pyrho.plugins.conf.nvim-cmp".config},
      'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp-signature-help'
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

    -- 2023-02-10 too slow right now..
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

    use {
      'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = {'nvim-tree/nvim-web-devicons'},
      config = function()
        require'fzf-lua'.setup({winopts = {preview = {layout = 'vertical'}}})
      end
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
      'rest-nvim/rest.nvim',
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
      config = function()
        local registers = require 'registers'
        registers.setup {window = {border = 'rounded'}}
      end
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

    use {'terrastruct/d2-vim'}

    use {'ledger/vim-ledger'}

    use {
      'stevearc/aerial.nvim',
      config = function()
        require('aerial').setup({
          show_guides = true,
          nav = {
            border = "rounded",
            max_height = 0.9,
            min_height = {10, 0.1},
            max_width = 0.5,
            min_width = {0.2, 20},
            win_opts = {cursorline = true, winblend = 10},
            -- Jump to symbol in source window when the cursor moves
            autojump = false,
            -- Show a preview of the code in the right column, when there are no child symbols
            preview = true,
            -- Keymaps in the nav window
            keymaps = {
              ["o"] = "actions.jump",
              ["<2-LeftMouse>"] = "actions.jump",
              ["<C-v>"] = "actions.jump_vsplit",
              ["<C-s>"] = "actions.jump_split",
              ["h"] = "actions.left",
              ["l"] = "actions.right",
              ["q"] = "actions.close"
            }
          },
          on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set('n', '[n', '<cmd>AerialPrev<CR>', {buffer = bufnr})
            vim.keymap.set('n', ']n', '<cmd>AerialNext<CR>', {buffer = bufnr})
            vim.keymap.set('n', '<leader>n', '<cmd>AerialNavToggle<CR>',
                           {buffer = bufnr})
          end
        })
      end
    }

    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
      ft = {"markdown"}
    })

    use {
      'ibhagwan/smartyank.nvim',
      config = function()
        require('smartyank').setup {highlight = {enabled = false}}
      end
    }

    use {
      'stevearc/oil.nvim',
      config = function()
        require("oil").setup({
          -- Id is automatically added at the beginning, and name at the end
          -- See :help oil-columns
          columns = {"icon", "permissions", "size", "mtime"},
          -- Buffer-local options to use for oil buffers
          buf_options = {buflisted = false, bufhidden = "hide"},
          -- Window-local options to use for oil buffers
          win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "n"
          },
          -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`
          default_file_explorer = true,
          -- Restore window options to previous values when leaving an oil buffer
          restore_win_options = true,
          -- Skip the confirmation popup for simple operations
          skip_confirm_for_simple_edits = false,
          -- Deleted files will be removed with the trash_command (below).
          delete_to_trash = false,
          -- Change this to customize the command used when deleting to trash
          trash_command = "trash-put",
          -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
          prompt_save_on_select_new_entry = true,
          -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
          -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
          -- Additionally, if it is a string that matches "actions.<name>",
          -- it will use the mapping at require("oil.actions").<name>
          -- Set to `false` to remove a keymap
          -- See :help oil-actions for a list of all available actions
          keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["g."] = "actions.toggle_hidden"
          },
          -- Set to false to disable all of the above keymaps
          use_default_keymaps = true,
          view_options = {
            -- Show files and directories that start with "."
            show_hidden = false,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
              return vim.startswith(name, ".")
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr) return false end
          },
          -- Configuration for the floating window in oil.open_float
          float = {
            -- Padding around the floating window
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {winblend = 10}
          },
          -- Configuration for the actions floating preview window
          preview = {
            -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_width and max_width can be a single value or a list of mixed integer/float types.
            -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
            max_width = 0.9,
            -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
            min_width = {40, 0.4},
            -- optionally define an integer/float for the exact width of the preview window
            width = nil,
            -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_height and max_height can be a single value or a list of mixed integer/float types.
            -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
            max_height = 0.9,
            -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
            min_height = {5, 0.1},
            -- optionally define an integer/float for the exact height of the preview window
            height = nil,
            border = "rounded",
            win_options = {winblend = 0}
          },
          -- Configuration for the floating progress window
          progress = {
            max_width = 0.9,
            min_width = {40, 0.4},
            width = nil,
            max_height = {10, 0.9},
            min_height = {5, 0.1},
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = {winblend = 0}
          }
        })
        -- vim.keymap.set("n", "-", require("oil").open,
        --                {desc = "Open parent directory"})
      end
    }

    use {
      'DNLHC/glance.nvim',
      config = function()
        local glance = require('glance')
        local actions = glance.actions

        glance.setup({
          hooks = {
            before_open = function(results, open, jump, method)
              if #results == 1 then
                jump(results[1]) -- argument is optional
              else
                open(results) -- argument is optional
              end
            end
          }
        })
      end
    }

  end,
  config = {
    luarocks = {python_cmd = "python3"},
    snapshot_path = os.getenv('HOME') .. '/.local/share/nvim/packer-backups'
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

# 2023-02-10 
Lspsaga is looking great but the performance is really bad (> 30s sometimes), trying lsp trouble.
--]]
