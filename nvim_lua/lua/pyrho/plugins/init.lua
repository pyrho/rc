vim.cmd [[ packadd packer.nvim ]]

require"pyrho.plugins.reload".setup_autocmd()

return require("packer").startup({
  function()
    use {"wbthomason/packer.nvim", opt = true}

    use "tjdevries/astronauta.nvim"


    use {
      'glepnir/dashboard-nvim',
      config = require'pyrho.plugins.conf.dashboard'.config
    }

    use {
      -- "pyrho/nerveux.nvim",
      "~/repos/perso/nerveux.nvim",
      config = function()
        require'nerveux'.setup {
          create_default_mappings = true,
          start_daemon = true,
          use_cache = true,
          virtual_titles = true,
          kill_daemon_at_exit = true
        }
      end
    }

    -- See https://github.com/neovim/neovim/issues/12587
    use {
      "antoinemadec/FixCursorHold.nvim",
      run = function() vim.g.curshold_updatime = 1000 end
    }

    use {
      "junegunn/goyo.vim",
      config = function() vim.g.goyo_height = "70%" end,
      cmd = "Goyo"
    }

    use {
      "folke/tokyonight.nvim",
      config = require"pyrho.plugins.conf.tokyonight".config
    }

    use 'b3nj5m1n/kommentary'

    use {"jason0x43/vim-js-indent", ft = "javascript"}

    -- Manually highlight words
    use {
      "Yggdroot/vim-mark",
      config = function()
        vim.api.nvim_set_keymap("n", "<Leader>N", ":MarkClear<CR>",
                                {noremap = true, silent = true})
      end
    }

    use {
      "airblade/vim-gitgutter",
      config = require"pyrho.plugins.conf.gitgutter".config
    }

    use {
      {"tpope/vim-fugitive"}, {
        "shumphrey/fugitive-gitlab.vim",
        requires = "tpope/vim-fugitive",
        cmd = "GBrowse"
      }, {"tpope/vim-rhubarb", requires = "tpope/vim-fugitive", cmd = "GBrowse"}
    }

    use "norcalli/snippets.nvim"

    use {
      "hoob3rt/lualine.nvim",
      setup = function()
          vim.g.tokyonight_lualine_bold = true
      end,
      cond = function() return not require"pyrho.helpers".is_zen() end,
      config = require"pyrho.plugins.conf.lualine".config
      -- config = require"pyrho.plugins.conf.evil_lualine".config
    }

    use {"benknoble/vim-obsession", branch = "this_session"}

    use {
      "nvim-lua/telescope.nvim",
      requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"},
      config = require"pyrho.plugins.conf.telescope".config
    }

    -- Better / * # search mappings
    use "junegunn/vim-slash"

    use {"plasticboy/vim-markdown", after = "tabular", ft = "markdown"}

    -- Align stuff easily (must come before vim-markdown)
    use "godlygeek/tabular"

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

    -- Show hex color codes'
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

    use "stephpy/vim-yaml"
    use "lifepillar/pgsql.vim"
    use 'NoahTheDuke/vim-just'
    use {"elzr/vim-json", ft = "json"}
    use "elixir-editors/vim-elixir"

    -- }}}

    use {
      "voldikss/vim-floaterm",
      config = require"pyrho.plugins.conf.floaterm".config
    }

    use "chrisbra/nrrwrgn"
    use {
      "nvim-lua/completion-nvim",
      config = require"pyrho.plugins.conf.completion".config
    }

    use "aquach/vim-http-client"
    use "tpope/vim-dadbod"
    use "kamykn/popup-menu.nvim"

    --[[ {{{
                  ┌──────────────────────────────────────────┐
                  │░▀█▀░█▀▄░█▀▀░█▀▀░░░█▀▀░▀█▀░▀█▀░▀█▀░█▀▀░█▀▄│
                  │░░█░░█▀▄░█▀▀░█▀▀░░░▀▀█░░█░░░█░░░█░░█▀▀░█▀▄│
                  │░░▀░░▀░▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀│
                  └──────────────────────────────────────────┘
  --]]
    use {
      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = require"pyrho.plugins.conf.treesitter".config
      }, {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = require"pyrho.plugins.conf.treesitter".text_object_config
      }, {
        "nvim-treesitter/nvim-treesitter-refactor",
        config = require"pyrho.plugins.conf.treesitter".refactor_config
      }
    }
    -- }}}

    --[[ {{{
                                 ┌────────────┐
                                 │░█░░░█▀▀░█▀█│
                                 │░█░░░▀▀█░█▀▀│
                                 │░▀▀▀░▀▀▀░▀░░│
                                 └────────────┘
  -- ]]

    use {
      {
        "neovim/nvim-lspconfig",
        config = require"pyrho.plugins.conf.nvim-lspconfig".config
      }, {
        "kabouzeid/nvim-lspinstall",
        requires = "neovim/nvim-lspconfig",
        config = require"pyrho.plugins.conf.nvim-lspinstall".config
      }
    }

    use {
      -- 'glepnir/lspsaga.nvim',
      -- @NOTE
      --  Waiting on https://github.com/glepnir/lspsaga.nvim/pull/207 to be
      --  merged.
      --    - dr, 2021-06-24
      'jasonrhansen/lspsaga.nvim',
      branch = "finder-preview-fixes",
      config = require"pyrho.plugins.conf.lspsaga".config
    }
    -- }}}

    use {
      "https://github.com/mhartington/formatter.nvim",
      config = require"pyrho.plugins.conf.formatter".config
    }

    use {
      'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-web-devicons'.setup {default = true} end
    }

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

    use {
      "lambdalisue/fern.vim",
      config = require"pyrho.plugins.conf.fern".config,
      requires = {
        "lambdalisue/glyph-palette.vim", "lambdalisue/fern-git-status.vim",
        "lambdalisue/fern-hijack.vim", "lambdalisue/fern-renderer-nerdfont.vim",
        "lambdalisue/nerdfont.vim"
      }
    }


  end,
  config = {luarocks = {python_cmd = "python3"}}
})
