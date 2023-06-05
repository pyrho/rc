return {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    if require"pyrho.helpers".is_zen() then
      vim.o.background = "light"
    else
      vim.o.background = "dark"
    end

    vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_italic_functions = 0
    vim.g.tokyonight_italic_keywords = 0
    vim.g.tokyonight_italic_variables = 0
    vim.g.tokyonight_sidebars = {
      "qf", "vista_kind",
      -- Can't have this and the nice neovim logo in Dashboard
      --[["terminal"]]
      "packer", "defx", "lspsagafinder", "fern"
    }
    vim.g.tokyonight_hide_inactive_statusline = true

    -- vim.cmd [[ autocommand ColorScheme tokyonight call MyHighlight() ]]

    --[[
  --
  function! MyHighlights() abort
    highlight Visual     cterm=NONE ctermbg=76  ctermfg=16  gui=NONE guibg=#5fd700 guifg=#000000
    highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000
    highlight Normal     cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
    highlight NonText    cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
endfunction
--]]
    -- local tokyoNightsOverrides = -- Vimscript function name (as a string)
    -- local myvimfun = "g:MyVimFunction"
    vim.api.nvim_create_autocmd({"ColorScheme"}, {
      pattern = {"tokyonight"},
      callback = function()
        vim.api
            .nvim_command [[ highlight TabLineSel gui=bold guifg=#7dcfff guibg=#1f2335 ]]
      end -- Or myvimfun
    })

    vim.cmd [[ colorscheme tokyonight ]]
  end
}
