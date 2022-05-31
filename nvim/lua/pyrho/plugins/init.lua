vim.cmd [[ packadd packer.nvim ]]

require"pyrho.plugins.reload".setup_autocmd()

return require("packer").startup({
  function()
    use {"wbthomason/packer.nvim", opt = true}

    -- Startpage
    use {
      'glepnir/dashboard-nvim',
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
    use 'b3nj5m1n/kommentary'
    use { 'numToStr/Comment.nvim', config = function ()
        require'Comment'.setup()
    end }

    -- Better JS indent
    use {"jason0x43/vim-js-indent", ft = "javascript"}

    -- Highlight words
    use {
      'azabiong/vim-highlighter',
      config = function()
        local map_opts = {noremap = true, silent = false}
        vim.api.nvim_set_keymap("n", "<CR>", "<Cmd>Hi}<CR>", map_opts)
        vim.api.nvim_set_keymap("n", "<BS>", "<Cmd>Hi{<CR>", map_opts)
      end
    }

    -- Git gutter plugin
    use {
      "lewis6991/gitsigns.nvim",
      config = function() require('gitsigns').setup() end
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
      config = require"pyrho.plugins.conf.heirline".config,
      -- We need to instantiate this plugin after lsp-config because we rely on Signs defined
      -- in that config
      after = "nvim-lspconfig"

      -- Use this to debug, it will give the exact error stack trace
      --[[ config = function()
        vim.cmd(
            'luafile /home/pyrho/rc/nvim/lua/pyrho/plugins/conf/heirline.lua')
      end, ]]

    }

    -- Signature auto complete helper
    use {
      'ray-x/lsp_signature.nvim',
      config = require'pyrho.plugins.conf.lsp_signature'.config
    }

    -- Record sessions
    use {"benknoble/vim-obsession", branch = "this_session"}

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

    -- Smart f motions
    use {
      "justinmk/vim-sneak",
      config = function()
        vim.g["sneak#label"] = 1

        -- Causes issue with sandwich and the DOT repeats.
        -- vim.cmd [[
        --         map f <Plug>Sneak_f
        --         map F <Plug>Sneak_F
        --         map t <Plug>Sneak_t
        --         map T <Plug>Sneak_T
        --       ]]
      end
    }
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
      "voldikss/vim-floaterm",
      config = require"pyrho.plugins.conf.floaterm".config
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

    use {
      "SmiteshP/nvim-gps",
      config = function()
        -- Lua

        -- Customized config
        require("nvim-gps").setup({

          disable_icons = false, -- Setting it to true will disable all icons

          icons = {
            ["class-name"] = ' ', -- Classes and class-like objects
            ["function-name"] = ' ', -- Functions
            ["method-name"] = ' ', -- Methods (functions inside class-like objects)
            ["container-name"] = '⛶ ', -- Containers (example: lua tables)
            ["tag-name"] = '炙' -- Tags (example: html tags)
          },

          -- Add custom configuration per language or
          -- Disable the plugin for a language
          -- Any language not disabled here is enabled by default
          languages = {
            -- Some languages have custom icons
            ["json"] = {
              icons = {
                ["array-name"] = ' ',
                ["object-name"] = ' ',
                ["null-name"] = '[] ',
                ["boolean-name"] = 'ﰰﰴ ',
                ["number-name"] = '# ',
                ["string-name"] = ' '
              }
            },
            ["latex"] = {
              icons = {["title-name"] = "# ", ["label-name"] = " "}
            },
            ["norg"] = {icons = {["title-name"] = " "}},
            ["toml"] = {
              icons = {
                ["table-name"] = ' ',
                ["array-name"] = ' ',
                ["boolean-name"] = 'ﰰﰴ ',
                ["date-name"] = ' ',
                ["date-time-name"] = ' ',
                ["float-name"] = ' ',
                ["inline-table-name"] = ' ',
                ["integer-name"] = '# ',
                ["string-name"] = ' ',
                ["time-name"] = ' '
              }
            },
            ["verilog"] = {icons = {["module-name"] = ' '}},
            ["yaml"] = {
              icons = {
                ["mapping-name"] = ' ',
                ["sequence-name"] = ' ',
                ["null-name"] = '[] ',
                ["boolean-name"] = 'ﰰﰴ ',
                ["integer-name"] = '# ',
                ["float-name"] = ' ',
                ["string-name"] = ' '
              }
            },
            ["yang"] = {
              icons = {
                ["module-name"] = " ",
                ["augment-path"] = " ",
                ["container-name"] = " ",
                ["grouping-name"] = " ",
                ["typedef-name"] = " ",
                ["identity-name"] = " ",
                ["list-name"] = "﬘ ",
                ["leaf-list-name"] = " ",
                ["leaf-name"] = " ",
                ["action-name"] = " "
              }
            }

            -- Disable for particular languages
            -- ["bash"] = false, -- disables nvim-gps for bash
            -- ["go"] = false,   -- disables nvim-gps for golang

            -- Override default setting for particular languages
            -- ["ruby"] = {
            --	separator = '|', -- Overrides default separator with '|'
            --	icons = {
            --		-- Default icons not specified in the lang config
            --		-- will fallback to the default value
            --		-- "container-name" will fallback to default because it's not set
            --		["function-name"] = '',    -- to ensure empty values, set an empty string
            --		["tag-name"] = ''
            --		["class-name"] = '::',
            --		["method-name"] = '#',
            --	}
            -- }
          },

          separator = ' > ',

          -- limit for amount of context shown
          -- 0 means no limit
          depth = 0,

          -- indicator used when context hits depth limit
          depth_limit_indicator = ".."
        })
      end
    }

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
      -- 'glepnir/lspsaga.nvim',
      -- @NOTE
      --  Waiting on https://github.com/glepnir/lspsaga.nvim/pull/207 to be
      --  merged.
      --    - dr, 2021-06-24
      -- @NOTE
      --  Glepnir is awol, tami5 is now maitaining this
      --    - dr, 2022-01-19

      'tami5/lspsaga.nvim',
      config = require"pyrho.plugins.conf.lspsaga".config
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

    -- Tmux integration, allows seamless transition between vim windows and tmux panes
    use {
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
    }

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
    use {
      "NTBBloodbath/rest.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      -- Using this commit until https://github.com/NTBBloodbath/rest.nvim/issues/114 is fixed
      commit = "2826f6960fbd9adb1da9ff0d008aa2819d2d06b3",
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = true,
          -- Highlight request on run
          highlight = {enabled = true, timeout = 150},
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true
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

    use {'toppair/reach.nvim', config = require 'pyrho.plugins.conf.reach'.config}

  end,
  config = {luarocks = {python_cmd = "python3"}}
})

--[[
                             ┌────────────────────┐
                             │░█▀█░█▀█░▀█▀░█▀▀░█▀▀│
                             │░█░█░█░█░░█░░█▀▀░▀▀█│
                             │░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀│
                             └────────────────────┘
# 2022-05-28
Moved from Yggdroot/vim-mark to azabiong/vim-highlighter, it seem more feature packed
--]]
