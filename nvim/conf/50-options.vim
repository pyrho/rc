" Options {{{
set shell=zsh
set scrolloff=4                     " Show 4 lines after/before the cursor
set noshowmode                      " No need to repeat the mode in the command line
set pumblend=20                     " Transparent pum

set wildoptions=pum                 " Use pum for the wildmenu
set selection=old
set nowrap
"set foldmethod=syntax
set foldenable
set foldlevelstart=20               " Only fold nested stuff
set foldnestmax=10                  " Don't fold too deeply nested stuff
set wildmenu                        " Visual autocomplete for command menu
set completeopt=longest,menu,preview
set lazyredraw                      " Redraw only when we need to.
set modelines=1                     " Process file specific options
set guioptions=                     " Disabled all GUI chrome
set relativenumber
set number                          " Shows the line # on the current line (with 'relativenumber)
set incsearch
set mouse=ar
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set ignorecase
set smartcase
set laststatus=2
set encoding=utf-8
set cursorline                    " Apparently this causes slowness.
set cursorcolumn                  " This too. 2020-07-16 well im trying it again !
set hlsearch
set showmatch                       " Jump to matching [{()}] when inserting
set undofile                        " Tell it to use an undo file
set fileformat=unix
set noequalalways                   " Tell vim to not resize splits after open/closing splits
set inccommand=nosplit
" Set a directory to store the undo history
if has("win32")
    set undodir=H:/vimundo
endif
if has("unix")
    set undodir=~/.vimundo/
endif
" }}}

" Tabs & spaces {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
" }}}

" Backup {{{
set backup
if has("win32")
    set backupdir=H:/_vimswap
    set directory=H:/_vimswap
endif
if has("unix")
    set backupdir=~/.vimswap
    set directory=~/.vimswap
endif
" }}}

set colorcolumn=80
set makeef=error.err
set backspace=indent,eol,start
set list
let &listchars = "tab:\u2192 ,extends:>,precedes:<,eol:\u00ac,trail:\u00b7"
let &showbreak = '>'

" True color fix {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
" }}}
autocmd BufEnter, *.md set tw=80
set shiftround

set diffopt+=iwhiteall,algorithm:patience
