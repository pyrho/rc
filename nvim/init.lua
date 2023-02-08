local H = require('pyrho.helpers')
local opt = vim.opt

local function fancy_fold()
  vim.cmd [[
" Fancier folding from Matias' conf {{{
set fillchars=fold:─
function! NeatFoldText()
    let line = getline(v:foldstart)
    " Tries to detect if this is an elixir documentation block so we fold it nicely
    let grps  = matchlist(line, '\(@\a*\) """')
    if len(grps) > 0
        let doc_type = grps[1]
        let linenum = v:foldstart + 1
        if linenum < v:foldend
            let line = substitute(getline(linenum), '^[ \t]*\(.*\)$', doc_type . ': \1', 'g')
        end
    end

    let foldchar         = matchstr(&fillchars, 'fold:\zs.')
    let lines_count      = v:foldend - v:foldstart + 1
    let lines_count_text = printf("── %1s  ──", lines_count) . repeat(foldchar, 10)
    let foldtextstart    = repeat(' ', indent(nextnonblank(v:foldstart))) . line . " ──"
    let foldtextend      = lines_count_text . repeat(foldchar, 8)
    let foldtextlength   = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

    return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()
" }}}

  ]]
end

local function set_options()
  opt.sessionoptions = "buffers,curdir,folds,winpos,winsize,tabpages"

  -- 2022-11-03: Let's see how we fare without this.. 
  -- opt.clipboard="unnamedplus"
  opt.shell = "zsh"

  -- Show 4 lines after/before the cursor
  opt.scrolloff = 4

  -- No need to repeat the mode in the command line
  opt.showmode = false

  -- Transparent pum
  opt.pumblend = 20

  -- Completion
  opt.completeopt = {"menuone", "noselect"}
  opt.shortmess = "filnxtToOFc"

  opt.ignorecase = true
  opt.smartcase = true
  opt.laststatus = 2
  opt.encoding = "utf8"
  opt.cursorlineopt = 'number'
  opt.cursorline = true
  opt.cursorcolumn = false
  opt.hlsearch = true
  opt.showmatch = true
  opt.undofile = true
  opt.fileformat = "unix"
  opt.equalalways = false
  opt.inccommand = "nosplit"
  opt.mouse = "ar"
  opt.incsearch = true
  opt.wrap = false
  opt.termguicolors = true
  opt.relativenumber = true
  opt.number = true
  opt.selection = "old"
  opt.foldenable = true

  -- Only fold nested stuff
  opt.foldlevelstart = 20

  -- Don't fold too deeply nested stuff
  opt.foldnestmax = 10

  -- Visual autocomplete for command menu
  opt.wildmenu = true

  -- Redraw only when we need to.
  opt.lazyredraw = true

  -- Process file specific options
  opt.modelines = 1

  opt.tabstop = 4
  opt.expandtab = true
  opt.softtabstop = 4
  opt.shiftwidth = 4

  opt.colorcolumn = "80"
  opt.backspace = {"indent", "eol", "start"}

  opt.list = true
  opt.listchars = {
    tab = "→ ",
    extends = ">",
    precedes = "<",
    eol = "¬",
    trail = "·"
  }

  -- See https://github.com/neovim/neovim/issues/13018
  -- This is likely a bug in vim/nvim
  opt.siso = 1

  opt.diffopt = opt.diffopt + {"iwhiteall", "algorithm:patience"}

  opt.signcolumn = "yes"
  opt.shiftround = true

  vim.g.mapleader = " "

  if H.is_zen() then
    opt.list = false
    opt.conceallevel = 2
    opt.colorcolumn = ""
    opt.textwidth = 75
    opt.shiftwidth = 4
    opt.laststatus = 0
    opt.concealcursor = "n"

    vim.cmd [[
    let bullet_point_1 = '◉'
    let bullet_point_2 = '○'
    let bullet_point_3 = '✸'
    let bullet_point_4 = '✿'
    let bullet_point_5 = '◇'
    let checkbox_unchecked = "❏"
    let checkbox_checked = "✓"

      augroup MyBullets
        au!
    au BufEnter, *.md :syntax match markdownBullet1 "^-\s" contains=markdownBullet1_1
    au BufEnter, *.md :execute 'syntax match markdownBullet1_1 "-" contained conceal cchar='.bullet_point_1

    au BufEnter, *.md :syntax match markdownBullet2 "^\s\{4\}-\s" contains=markdownBullet2_2
    au BufEnter, *.md :execute 'syntax match markdownBullet2_2 "-" contained conceal cchar='.bullet_point_2

    au BufEnter, *.md :syntax match markdownBullet3 "^\s\{8\}-\s" contains=markdownBullet3_3
    au BufEnter, *.md :execute 'syntax match markdownBullet3_3 "-" contained conceal cchar='.bullet_point_3

    au BufEnter, *.md :syntax match markdownBullet4 "^\s\{12\}-\s" contains=markdownBullet4_4
    au BufEnter, *.md :execute 'syntax match markdownBullet4_4 "-" contained conceal cchar='.bullet_point_4

    au BufEnter, *.md :syntax match markdownBullet5 "^\s\{16\}-\s" contains=markdownBullet5_5
    au BufEnter, *.md :execute 'syntax match markdownBullet5_5 "-" contained conceal cchar='.bullet_point_5

    au BufEnter, *.md :syntax match markdownCheckbox "\(\[[ x]\]\) " contains=markdownCheckboxChecked,markdownCheckboxUnchecked
    au BufEnter, *.md :execute 'syntax match markdownCheckboxUnchecked "\(\[ \]\)" contained conceal cchar='.checkbox_unchecked
    au BufEnter, *.md :execute 'syntax match markdownCheckboxChecked "\(\[x\]\)" contained conceal cchar='.checkbox_checked
      augroup END
      ]]
  end
end

local function init_abbrev()
  vim.cmd [[
    :iab cdate <c-r>=strftime("%Y-%m-%d")<CR>
    :iab chour <c-r>=strftime("%H:%M")<CR>
    nmap <localleader>{  A {<CR>}<Esc>O
    nmap <localleader>;  A;<Esc>
  ]]
end

local function highlight_yank_init()
  vim.cmd [[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=300}
    augroup END
  ]]
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

local function main()
  init_abbrev()
  highlight_yank_init()
  fancy_fold()

  require "pyrho.plugins"

  require"pyrho.mappings".init()
end

vim.cmd [[ 
noremap <C-B> :call RunBroot()<CR>i

fun! RunBroot()
  let l:command = 'broot --conf ~/.config/broot/nvim.toml'
  enew
  call termopen(l:command, {'on_exit': 'BrootOnExit'})
endfun

fun! BrootOnExit(job_id, code, event) dict
  let l:filename = getline(1)
  enew | bd! #

  if (l:filename != '')
    execute 'edit ' . l:filename
  else
    bp
  endif
endfun

]]

set_options()
vim.schedule(main)

-- vim: sw=2
