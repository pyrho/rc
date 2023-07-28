return {
  "rebelot/heirline.nvim",
  lazy = false,
  config = function()
    local notify = require('notify')
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    local flexLowPriority = 1
    local flexHighPriority = 100
    local colors = require("tokyonight.colors").setup {style = "storm"} -- pass in any of the config options as explained above
    local tokyonight_utils = require("tokyonight.util")
    local Space = {provider = " "}
    local Sep = {Space, {provider = "❱", hl = {fg = colors.blue7}}, Space}
    local Align = {provider = "%="}
    local TerminalName = {
      -- we could add a condition to check that buftype == 'terminal'
      -- or we could do that later (see #conditional-statuslines below)
      provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
      end,
      hl = {fg = colors.blue, bold = true}
    }

    -- Components {{{
    local ViMode = {
      static = {
        mode_names = {
          -- change the strings if you like it vvvvverbose!
          n = "NO",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "VI",
          vs = "Vs",
          V = "VI_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "IN",
          ic = "Ic",
          ix = "Ix",
          R = "RE",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "CO",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "TERM"
        }
      },
      provider = function(self)
        -- return " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
        -- return " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
        return require'pyrho.helpers'.separators.circle .. " %2(" ..
                   self.mode_names[vim.fn.mode(1)] .. "%)"
      end,
      hl = function(self)
        local color = self:mode_color() -- here!
        return {fg = colors.black, bold = true, bg = color}
      end
    }

    ViMode = utils.surround({"", ""},
                            function(self) return self:mode_color() end,
                            {ViMode, hl = {fg = 'black'}})
    -- we are surrounding the component and adjusting the foreground in one go!
    -- we are surrounding the component and adjusting the foreground in one go!
    -- File stuff {{{
    local FileNameBlock = {
      -- let's first set up some attributes needed by this component and it's children
      init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,

      on_click = {
        name = 'show_filename',
        callback = function()
          vim.defer_fn(function()
            notify(vim.api.nvim_buf_get_name(0), "info",
                   {title = 'Full file path', render = 'compact'})
          end, 100)
        end
      }
    }

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension,
                                                        {default = true})
      end,
      provider = function(self) return self.icon and (self.icon .. " ") end,
      hl = function(self) return {fg = self.icon_color} end
    }

    local FileName = {
      provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = {fg = utils.get_highlight("Directory").fg}
    }

    local FlexFileName = {
      init = function(self)
        self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
        if self.lfilename == "" then self.lfilename = "[No Name]" end
      end,
      hl = {fg = utils.get_highlight("Directory").fg},

      flexible = flexHighPriority,
      {provider = function(self) return self.lfilename end},
      {
        provider = function(self)
          return vim.fn.pathshorten(self.lfilename, 3)
        end
      }
    }

    local FileFlags = {
      {
        provider = function() if vim.bo.modified then return "[+]" end end,
        hl = {fg = colors.green}

      }, {
        provider = function()
          if (not vim.bo.modifiable) or vim.bo.readonly then
            return ""
          end
        end,
        hl = {fg = colors.orange}
      }
    }

    -- Now, let's say that we want the filename color to change if the buffer is
    -- modified. Of course, we could do that directly using the FileName.hl field,
    -- but we'll see how easy it is to alter existing components using a "modifier"
    -- component

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          -- use `force` because we need to override the child's hl foreground
          return {fg = colors.cyan, bold = false, force = true}
        end
      end
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(FileNameBlock, FileIcon,
                                 utils.insert(FileNameModifer, FlexFileName), -- a new table where FileName is a child of FileNameModifier
                                 unpack(FileFlags), -- A small optimisation, since their parent does nothing
                                 {provider = '%<'} -- this means that the statusline is cut here when there's not enough space
    )

    local FileType = {
      -- flexible = flexHighPriority,
      {
        provider = function() return string.upper(vim.bo.filetype) end,
        hl = {fg = utils.get_highlight("Type").fg, bold = true}
      }, {provider = ""}
    }

    local FileEncoding = {
      provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        return enc ~= 'utf-8' and enc:upper()
      end
    }

    local FileFormat = {
      provider = function()
        local fmt = vim.bo.fileformat
        return fmt ~= 'unix' and fmt:upper()
      end
    }

    local FileSize = {
      provider = function()
        -- stackoverflow, compute human readable file size
        local suffix = {'b', 'k', 'M', 'G', 'T', 'P', 'E'}
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize <= 0 then return "0" .. suffix[1] end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i])
      end
    }

    local FileLastModified = {
      -- did you know? Vim is full of functions!
      provider = function()
        local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
        return (ftime > 0) and os.date("%c", ftime)
      end
    }

    local Ruler = {
      -- %l = current line number
      -- %L = number of lines in the buffer
      -- %c = column number
      -- %P = percentage through file of displayed window
      provider = "%7(%l/%L%):%c %P"
    }
    -- I take no credits for this! :lion:
    local ScrollBar = {
      static = {
        sbar = {'▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'}
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
      end,
      hl = {fg = colors.blue0, bg = colors.blue7}
    }

    local WorkDir = {
      provider = function(self)
        self.icon = " "
        local cwd = vim.fn.getcwd(0)
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
      end,
      hl = {fg = colors.blue, bold = false},

      flexible = flexLowPriority,
      {
        -- evaluates to the full-lenth path
        provider = function(self)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. self.cwd .. trail
        end
      },
      {
        -- evaluates to the shortened path
        provider = function(self)
          local cwd = vim.fn.pathshorten(self.cwd)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. cwd .. trail
        end
      },
      {
        -- evaluates to "", hiding the component
        provider = ""
      }
    }

    local WorkDirOil = {
      provider = function(self)
        self.icon = "  "
        local cwd = require('oil').get_current_dir()
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
      end,
      hl = {fg = colors.blue, bold = false},

      flexible = flexLowPriority,
      {
        -- evaluates to the full-lenth path
        provider = function(self)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. self.cwd .. trail
        end
      },
      {
        -- evaluates to the shortened path
        provider = function(self)
          local cwd = vim.fn.pathshorten(self.cwd)
          local trail = self.cwd:sub(-1) == "/" and "" or "/"
          return self.icon .. cwd .. trail
        end
      },
      {
        -- evaluates to "", hiding the component
        provider = ""
      }
    }
    -- }}}

    -- Lsp Stuff {{{
    local LspSignature = {
      init = function()
        vim.api.nvim_set_hl(0, "WinBarSignature",
                            {fg = "#dedede", bg = "#363636"})
        vim.api.nvim_set_hl(0, "WinBarSigDoc", {fg = "#dedede", bg = "#363636"})
        vim.api.nvim_set_hl(0, "WinBarSigActParm",
                            {fg = "#dedede", bg = "#9f3838"})
      end,
      provider = function()
        local columns = vim.api.nvim_get_option("columns")
        local sig = require("lsp_signature").status_line(columns)

        if sig == nil or sig.label == nil or sig.range == nil then
          return ""
        end
        local label1 = sig.label
        local label2 = ""
        if sig.range then
          label1 = sig.label:sub(1, sig.range["start"] - 1)
          label2 = sig.label:sub(sig.range["end"] + 1, #sig.label)
        end
        local doc = sig.doc or ""
        if #doc + #sig.label >= columns then
          local trim = math.max(5, columns - #sig.label - #sig.hint - 10)
          doc = doc:sub(1, trim) .. "..."
          -- lprint(doc)
        end

        return
            "%#WinBarSignature#" .. label1 .. "%*" .. "%#WinBarSigActParm#" ..
                sig.hint .. "%*" .. "%#WinBarSignature#" .. label2 .. "%*" ..
                "%#WinBarSigDoc#" .. " " .. doc or "" .. "%*"
      end
    }

    local LSPActive = {
      -- flexible = flexHighPriority,
      condition = conditions.lsp_attached,

      hl = {fg = colors.green, bold = true},
      {provider = "LSP  "},
      {provider = ""}
    }

    -- Awesome plugin
    local FlexGps = {
      condition = function() return require("nvim-navic").is_available() end,
      hl = {fg = colors.gray},
      flexible = flexHighPriority,
      {
        provider = function()
          return require("nvim-navic").get_location({depth_limit = 3})
        end
      },
      {
        provider = function()
          return require("nvim-navic").get_location({depth_limit = 1})
        end
      },
      {provider = ""}

    }

    local Diagnostics = {

      condition = conditions.has_diagnostics,

      static = {
        error_icon = (vim.fn.sign_getdefined("DiagnosticSignError")[1] or
            {text = '😡'}).text,
        warn_icon = (vim.fn.sign_getdefined("DiagnosticSignWarn")[1] or
            {text = "😥"}).text,
        info_icon = (vim.fn.sign_getdefined("DiagnosticSignInfo")[1] or
            {text = '😤'}).text,
        hint_icon = (vim.fn.sign_getdefined("DiagnosticSignHint")[1] or
            {text = '😐'}).text
      },

      init = function(self)
        self.errors = #vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.ERROR
        })
        self.warnings = #vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.WARN
        })
        self.hints = #vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.HINT
        })
        self.info = #vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.INFO
        })
      end,

      Space,
      {
        provider = function(self)
          -- 0 is just another output, we can decide to print it or not!
          return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = {fg = colors.error}
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = {fg = colors.warning}
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = {fg = colors.info}
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = {fg = colors.hint}
      },
      Sep
    }
    -- }}} ! Lsp stuff

    -- Git stuff {{{
    local Git = {
      condition = conditions.is_git_repo,

      on_click = {
        name = 'show_git_branch_name',
        callback = function()
          vim.defer_fn(function()
            notify(vim.b.gitsigns_status_dict.head, "info",
                   {title = 'Branch name', render = 'compact'})
          end, 100)
        end
      },

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or
                               self.status_dict.removed ~= 0 or
                               self.status_dict.changed ~= 0
      end,

      hl = {fg = colors.teal},

      {
        flexible = flexLowPriority,
        {
          provider = function(self)
            local repo_name = vim.fn.fnamemodify(self.status_dict.root, ":t")
            return " " .. repo_name .. "  " ..
                       (#self.status_dict.head > 40 and
                           (string.sub(self.status_dict.head, 1, 40) .. "..") or
                           self.status_dict.head)
          end
        },
        {
          provider = function(self)
            return " " .. string.sub(self.status_dict.head, 1, 5) .. "..."
          end

        }

      },
      --[[ { -- git branch name
      provider = function(self)
        local repo_name = vim.fn.fnamemodify(self.status_dict.root, ":t")
        return " " .. repo_name .. "  " .. self.status_dict.head
      end
    }, ]]

      -- You could handle delimiters, icons and counts similar to Diagnostics
      {
        flexible = flexLowPriority,
        {
          condition = function(self) return self.has_changes end,
          provider = "  "
        }
      },

      {
        flexible = flexLowPriority,
        {
          provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
          end,
          hl = {fg = colors.git.add}
        }
      },

      {
        flexible = flexLowPriority,
        {
          provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
          end,
          hl = {fg = colors.git.delete}
        }
      },
      {
        flexible = flexLowPriority,
        {
          provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
          end,
          hl = {fg = colors.git.change}
        }
      }
    }
    -- }}} !Git stuff

    -- Winbar {{{

    local WinBars = {

      fallthrough = false,
      { -- Hide the winbar for special buffers
        condition = function()
          return conditions.buffer_matches({
            buftype = {"nofile", "prompt", "help", "quickfix", "terminal"},
            filetype = {"^git.*", "fugitive"}
          })
        end,
        provider = ""
      },

      --[[
    { -- A special winbar for terminals
      condition = function()
        return conditions.buffer_matches({buftype = {"terminal"}})
      end,
      utils.surround({"", ""}, colors.red1,
                     {FileType, Space, TerminalName})
    },
    ]]

      { -- An inactive winbar for regular files
        condition = function() return not conditions.is_active() end,
        provider = ""
      },
      { -- Disable winbar for zen mode
        condition = function() return require'pyrho.helpers'.is_zen() end,
        provider = ""
      },
      -- A winbar for regular files
      {
        {
          condition = conditions.has_diagnostics,
          utils.surround({
            require'pyrho.helpers'.separators.left_rounded,
            require'pyrho.helpers'.separators.right_rounded
          }, colors.fg_gutter, {hl = {fg = colors.blue}, Diagnostics})
        }, Align, {
          condition = function()
            return require("nvim-navic").is_available()
          end,
          utils.surround({
            require'pyrho.helpers'.separators.left_rounded,
            require'pyrho.helpers'.separators.right_rounded
          }, colors.fg_gutter, {hl = {fg = colors.fg_sidebar}, FlexGps})
        }
      }
    }

    -- }}} !Winbar

    -- Misc {{{
    local Obsession = {
      -- flexible = flexHighPriority,
      {
        provider = function()
          -- local obsession_status = vim.fn.ObsessionStatus("OBS  ", "OBS  ")
          if vim.g.persisting then
            return "OBS   "
          else
            return "OBS   "
          end
          -- return "OBS " .. vim.fn.ObsessionStatus(" ", " ") .. ""
        end,
        hl = {fg = colors.magenta, bold = true},
        on_click = {
          callback = function() vim.api.nvim_command('SessionStart') end,
          name = "obsession_toggle"
        }
      }, {provider = ""}
    }

    -- }}} !Misc
    --
    -- }}} !Components

    local DefaultStatusline_left_old = {ViMode, Space, Diagnostics, Space, Git}

    local DefaultStatusline_left = {
      {
        provider = "",
        hl = function(self)
          local color = self:mode_color() -- here!
          return {bg = colors.black, bold = true, fg = color}

        end
      }, {
        provider = "NO",
        hl = function(self)
          local color = self:mode_color() -- here!
          return {fg = colors.black, bold = true, bg = color}

        end
      }, Git, {
        provider = "",
        hl = function(self)
          local color = self:mode_color() -- here!
          return {bg = colors.black, bold = true, fg = color}

        end
      }

    }

    local DefaultStatusline = {
      -- xxx
      DefaultStatusline_left_old, Align, -- xxx}
      Obsession, Space, LSPActive, Space, FileType, Space, Ruler, Space,
      ScrollBar

    }

    local InactiveStatusline = {
      -- local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }
      condition = function() return not conditions.is_active() end,
      hl = {
        underline = true,
        fg = colors.bg,
        bg = colors.none,
        -- force = true,
        -- bold = false
        sp = colors.border
      }
    }

    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches({
          buftype = {"nofile", "prompt", "help", "quickfix"},
          filetype = {"^git.*", "fugitive"}
        })
      end,

      FileType,
      Space,
      Align
    }

    local OilStatusLine = {
      condition = function()
        return conditions.buffer_matches({filetype = {"oil"}})
      end,
      ViMode,
      Space,
      WorkDirOil,
      Align,
      FileType,
      Space
    }

    local TerminalStatusline = {

      condition = function()
        return conditions.buffer_matches({buftype = {"terminal"}})
      end,

      hl = {bg = colors.dark_red},

      -- Quickly add a condition to the ViMode to only show it when buffer is active!
      {condition = conditions.is_active, ViMode, Space},
      FileType,
      Space,
      TerminalName,
      Align
    }

    local StatusLines = {

      hl = function()
        if conditions.is_active() then
          return {
            fg = utils.get_highlight("StatusLine").fg,
            bg = utils.get_highlight("StatusLine").bg
          }
        else
          return {
            fg = utils.get_highlight("StatusLineNC").fg,
            bg = utils.get_highlight("StatusLineNC").bg
          }
        end
      end,

      static = {
        mode_colors = {
          n = colors.blue,
          i = colors.green,
          v = colors.cyan,
          V = colors.cyan,
          ["\22"] = colors.cyan,
          c = colors.orange,
          s = colors.purple,
          S = colors.purple,
          ["\19"] = colors.purple,
          R = colors.orange,
          r = colors.orange,
          ["!"] = colors.red,
          t = colors.green
        },
        mode_color = function(self)
          local mode = conditions.is_active() and vim.fn.mode() or "n"
          return self.mode_colors[mode]
        end
      },

      fallthrough = false,

      SpecialStatusline,
      TerminalStatusline,
      OilStatusLine,
      InactiveStatusline,
      DefaultStatusline
    }

    -- This is done so that when the config is reloaded on the fly, the colors are re-applied
    vim.cmd [[
  augroup heirline
  autocmd!
  autocmd ColorScheme * lua require'heirline'.reset_highlights();
  augroup END
  ]]

    -- 2023-06-09: Repalcing this with barbecue.nvim
    -- require'heirline'.setup({statusline = StatusLines, winbar = WinBars})

    require'heirline'.setup({
      statusline = StatusLines,
      opts = {
        colors = {
          bright_bg = utils.get_highlight("Folded").bg,
          bright_fg = utils.get_highlight("Folded").fg,
          red = utils.get_highlight("DiagnosticError").fg,
          dark_red = utils.get_highlight("DiffDelete").bg,
          green = utils.get_highlight("String").fg,
          blue = utils.get_highlight("Function").fg,
          gray = utils.get_highlight("NonText").fg,
          orange = utils.get_highlight("Constant").fg,
          purple = utils.get_highlight("Statement").fg,
          cyan = utils.get_highlight("Special").fg,
          diag_warn = utils.get_highlight("DiagnosticWarn").fg,
          diag_error = utils.get_highlight("DiagnosticError").fg,
          diag_hint = utils.get_highlight("DiagnosticHint").fg,
          diag_info = utils.get_highlight("DiagnosticInfo").fg,
          git_del = utils.get_highlight("diffDeleted").fg,
          git_add = utils.get_highlight("diffAdded").fg,
          git_change = utils.get_highlight("diffChanged").fg
        }
      }
    })
  end,
  -- We need to instantiate this plugin after lsp-config because we rely on Signs defined
  -- in that config
  dependencies = {
    "neovim/nvim-lspconfig", "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic", 'rcarriga/nvim-notify'
  }

  -- Use this to debug, it will give the exact error stack trace
  -- config = function()
  --   vim.cmd(
  --       'luafile ~/rc/nvim/lua/pyrho/plugins/conf/heirline.lua')
  -- end,

}
