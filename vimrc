if &compatible
  set nocompatible               " Be iMproved
endif
 
" VimPlug config {{{
call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'                      " A colorscheme
if has('nvim')
  Plug 'Shougo/defx.nvim', { 
              \'do': ':UpdateRemotePlugins' }     " File browser (vim-vinegar like)
endif
Plug 'mhartington/defx-devicons'                  " vim-devicons plugin for defx
Plug 'kristijanhusak/defx-git'                    " git icon integration for defx
Plug 'HerringtonDarkholme/yats.vim'               " TS syntax file (better than typescript-vim)
Plug 'simnalamburt/vim-mundo'                     " Visual Undo
Plug 'Shougo/deoplete.nvim'                       " Asynchronous completion manager
Plug 'mhartington/nvim-typescript', {
            \'do': './install.sh > /tmp/log 2>&1'
            \}
Plug 'justinmk/vim-sneak'                         " Smart motions
Plug 'vim-airline/vim-airline'                    " Powerline fork
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neosnippet.vim'                      " Snippets
Plug 'tpope/vim-commentary'                       " Commenting
Plug 'jason0x43/vim-js-indent'                    " Syntax for js
Plug 'Yggdroot/vim-mark'                          " Mark words with color
Plug 'ervandew/supertab'                          " Tab completion
Plug 'airblade/vim-gitgutter'                     " Left gutter with modification indication (git)
Plug 'tpope/vim-fugitive'                         " Git management
Plug 'junegunn/fzf', {
            \'dir': '~/.fzf',
            \'do': './install --all'}             " Fzf fuzzy finder (ala CtrlP)
Plug 'junegunn/fzf.vim', {'depends': 'fzf'}       " Fzf fuzzy finder (ala CtrlP)
Plug 'mhinz/vim-startify'                         " Welcome page
Plug 'chrisbra/NrrwRgn'                           " Narrow to a region of a buffer
Plug 'godlygeek/tabular'                          " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown'
Plug 'Yilin-Yang/vim-markbar'                     " Bookmarks that make sense
Plug 'chriskempson/base16-vim'                    " Colorscheme
Plug 'ryanoasis/vim-devicons'                     " Have nice icons attached to files
Plug 'pangloss/vim-javascript'
Plug 'davidhalter/jedi-vim'
Plug 'tomlion/vim-solidity'
Plug 'junegunn/vim-slash'
Plug 'elzr/vim-json'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-obsession'                        " automatic session management
Plug 'dhruvasagar/vim-prosession'                 " complement to vim-obsession to handle sessions dir-wise.
Plug 'junegunn/vim-peekaboo'                      " Peek at registers
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fireplace'                        " Clojure support
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-surround'                         " Do stuff around text objects
Plug 'junegunn/goyo.vim'                          " Zen editor
Plug 'junegunn/limelight.vim'                     " Goyo extension to focus on a paragraph
Plug 'andymass/vim-tradewinds'                    " Easily move window splits
Plug 'andymass/vim-matchup'                       " Better matching of pairs
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
Plug 'janko-m/vim-test'                           " Test runner
Plug 'w0rp/ale'                                   " Lint manager (like syntastic)
Plug 'metakirby5/codi.vim'                        " Code playground
Plug 'fatih/vim-go'                               " Go support

call plug#end()
" }}}

if has("unix")
  set shell=bash
endif

" Deopplete Config {{{
let g:deoplete#enable_at_startup = 1
" }}}
" FZF config {{{
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

function! Fzf_dev()
  let l:fzf_files_options = '--preview "rougify {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <Leader>o :call Fzf_dev()<CR>
map <C-L> :BTS<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}

" True color fix {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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
endif
" }}}
" nvim-typescript config {{{
let g:nvim_typescript#javascript_support = 1
let g:nvim_typescript#loc_list_item_truncate_after = -1
let g:nvim_typescript#max_completion_detail = 100
let g:nvim_typescript#diagnostics_enable = 0
" }}}
" Supertab config {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}
" Airline config {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
" }}}
" Neosnippets config {{{
" Plugin key-mappings.
imap <C-y>     <Plug>(neosnippet_expand_or_jump)
smap <C-y>     <Plug>(neosnippet_expand_or_jump)
xmap <C-y>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory='~/.vimsnippets'
let g:neosnippet#disable_runtime_snippets={'_': 1}

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
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

" GitGutter config {{{
let g:gitgutter_map_keys = 0
" }}}

" Misc {{{
set makeef=error.err
set backspace=indent,eol,start
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20
" }}}

" Abbreviations {{{
:iab cdate <c-r>=strftime("%Y-%m-%d")<CR>
:iab chour <c-r>=strftime("%H:%M")<CR>
" }}}

" Filetype Settings {{{
if has("autocmd")
  autocmd BufEnter *.c,*.h set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-c,i,k nowrap cindent smartindent
  autocmd BufEnter *.C,*.cpp,*.hh,*.cc,*.hxx set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-cpp,i,k cindent smartindent
  autocmd BufEnter, *.handlebars,*.hbs set ft=html syntax=handlebars

  " Underline current line with -
  autocmd BufEnter, *.md nnoremap <Leader>- YpVr-

  " Underline current line with =
  autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
  autocmd BufEnter, *.md set tw=80
  autocmd BufEnter, *.ts map <F5> :TSGetDiagnostics<CR>
endif
" }}}

" Tabs & spaces {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
" }}}

" Options {{{
set selection=old
set nowrap
set foldmethod=syntax
set foldenable
set foldlevelstart=10               " Only fold nested stuff
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
set ignorecase
set smartcase
" That make so that even while 'smartcase' is enabled, * and # still respect case
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
set laststatus=2
set encoding=utf-8
set nocursorline                    " Apparently this causes slowness.
set nocursorcolumn                  " This too.
set scrolljump=8
set hlsearch
set showmatch                       " Jump to matching [{()}] when inserting
set undofile                        " Tell it to use an undo file
set fileformat=unix
set noequalalways                   " Tell vim to not resize splits after open/closing splits
set inccommand=split
" Set a directory to store the undo history
if has("win32")
    set undodir=H:/vimundo
endif
if has("unix")
    set undodir=~/.vimundo/
endif
" }}}
" Custom bindings {{{
let mapleader = "\<Space>"
" nvim-typescipt mappings {{{
autocmd FileType typescript,javascript
            \ map <Leader>d :TSDef<CR> |
            \ map <Leader>t :TSType<CR> |
            \ noremap <Leader>r :TSRefs<CR> |
            \ map <C-P> :TSSearchFZF 
" }}}
" Mark mappings {{{
nmap <Leader>N <Plug>MarkAllClear
" }}}
 " Move current line one line down
nnoremap - :m .+1<CR>
" Move current line one line up
nnoremap _ :m .-2<CR>
map <Leader>a :Ag
nnoremap gV `[v`]
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
map te :tabedit %<CR>
map tc :tabclose<CR>
map <silent><F1> :Defx -columns=git:devicons:mark:filename:type -split=vertical -winwidth=50 -direction=topleft<CR>
nmap <silent><Leader>f :Defx -columns=git:devicons:mark:filename:type `expand('%:p:h')` -search=`expand('%:p')`<CR>
map <M-LEFT> gT
map <M-RIGHT> gt
map <silent> <F7> :!xterm<CR>
nnoremap <Leader>no :nohlsearch<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
map <Leader>y "+yy
map <Leader>p "+p
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>S :Startify<CR>
imap jj <Esc>
imap kk <Esc>
inoremap {,<CR> {<CR>},<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap =>{ => {<CR>});<ESC>O
" }}}
" Colorscheme {{{

if has('nvim')
    if has("gui_vimr")
        colorscheme seoul256-light
        let g:airline_theme='sol'
    else
        set background=dark
        colorscheme base16-onedark
    endif
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%150v.\+/
set colorcolumn=80
" }}}
" Trailing whitespace {{{
highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=red
autocmd FileType startify highlight clear OverLength
"match ExtraWhitespace /\s\+$/
autocmd BufWinEnter *.ts match ExtraWhitespace /\s\+$/
autocmd InsertEnter *.ts match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave *.ts match ExtraWhitespace /\s\+$/
autocmd BufWinLeave *.ts call clearmatches()
" }}}

" NeoVim Config {{{
let g:python_host_prog = '/usr/bin/python'
" }}}

" Defx config {{{
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction


" }}}

" vim-slash config {{{
noremap <plug>(slash-after) zz
" }}}

" Fugitive {{{
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Silent Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
" }}}
" EditorConfig {{{
let g:EditorConfig_exclude_patterns = [ 'fugitive://.*', 'scp://.*' ]
" }}}
" Listchars {{{
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
"set list
set listchars=space:·
set list
" }}}
" Prosession config {{{
let g:prosession_on_startup = 0
" }}}
" Startify config {{{
let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
            \ { 'w': '~/CloudStation/wikis/vimwiki/index.md' },
            \ { 't': '~/.config/nvim/init.vim' },
            \ { 'r': '~/repos' },
            \ ]
let g:asciidashlane2 = [
\'                           `-.                              ',
\'                     `-/shmMMMNmyo/.                        ',
\'               .:+sdNMMMMmyo//shmMMMMmyo/-`                 ',
\'        `./+ydNMMMNds+:.         `-/ohmNMMMNhs+-.           ',
\'     :ymMMMMNds+:`                      .:oydNMMMNdy.       ',
\'     sMMh/-`                -                 `-+mMM:       ',
\'     sMM/                   /hhhs/-`             mMM-       ',
\'     oMM+                      ./yMMNh+          NMM        ',
\'     -MMy                    `sdhdMd:-.          NMM        ',
\'     -MMy                       -NM/            `NMM        ',
\'     `NMm                     .yMMMh`           .oo:        ',
\'      mMM`                 `/yMMMMMMm:-                      ',
\'      oMM+           `.-/shNMMMMMMMMmdhhMMsssmmmmsssso`     ',
\'      .MMd       `oNMMMMMMMMMdy+/-`            .MMd         ',
\'       hMM:        -MMMMmy+-                   yMM/         ',
\'       .MMm`     `:dMdo-                      :MMd          ',
\'        oMMy   -sNd+.                        `mMN-          ',
\'         yMMsodmo.                          `mMM/           ',
\'         `mMNs:                            -mMN+            ',
\'       :smy:  :-                          +MMN:             ',
\'       o/`  `dMMy`                      :dMMy`              ',
\'              oNMNo.                  :dMMd:                ',
\'               `sNMMh/`            .+dMMd:                  ',
\'                  +dMMNy/`      .odMMNy:                    ',
\'                    .+hMMMms+oyNMMNy/`                      ',
\'                       `/sdNMMNy+-                          ',
\'                            ``                              ',
\]
"let g:startify_custom_header = 'map(startify#fortune#boxed() + g:asciidashlane2, "\"   \".v:val")'
"
"let g:startify_custom_header =
        "\ map(split(system('fortune | cowsay -f stegosaurus'), '\n'), '"   ". v:val')

" }}}
" vim-unimpaired inspired mappings {{{
function! s:map(mode, lhs, rhs, ...) abort
  let flags = (a:0 ? a:1 : '') . (a:rhs =~# '^<Plug>' ? '' : '<script>')
  let head = a:lhs
  let tail = ''
  let keys = get(g:, a:mode.'remap', {})
  if type(keys) != type({})
    return
  endif
  while !empty(head)
    if has_key(keys, head)
      let head = keys[head]
      if empty(head)
        return
      endif
      break
    endif
    let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
    let head = substitute(head, '<[^<>]*>$\|.$', '', '')
  endwhile
  exe a:mode.'map' flags head.tail a:rhs
endfunction
map [q :cp<CR>
map ]q :cn<CR>

map [l :lprev<CR>
map ]l :lnext<CR>
function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>call <SID>BlankDown(v:count1)<CR>

call s:map('n', '[<Space>', '<Plug>unimpairedBlankUp')
call s:map('n', ']<Space>', '<Plug>unimpairedBlankDown')
" }}}
" Misc {{{

" Fix for python2 neovim support
let g:python_host_prog = '/usr/local/bin/python2'
" Not sure why, but this gets fucked.
nnoremap <Leader>o :call Fzf_dev()<CR>
map <Leader>b :Buffers<CR>
" }}}
" Ale config {{{
let g:ale_linters = {
\   'typescript': ['tslint'],
\}
let g:ale_set_quickfix = 1
" }
" }}}

" Limelight config {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" vim-markbar settings {{{
map <F2> <Plug>ToggleMarkbar 
" }}}

" Perso wiki and diary stuff {{{
nnoremap <Leader>w<Leader>w :e ~/CloudStation/wikis/vimwiki/diary/`date +\%Y-\%m-\%d`.md<CR>
" }}}
" Tern config {{{
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" }}}

" Startify config {{{
let g:startify_change_to_vcs_root = 1
" }}}


function! TonPere(navitem)
  let heading = {}
  let heading.word = a:navitem.text."(".a:navitem.kind.")"
  "let heading.type = a:navitem.kind
  if has_key(a:navitem, 'spans') && len(a:navitem.spans)
    let heading.lnum = a:navitem.spans[0].start.line
  endif

  "      {tagname}      <Tab>  {tagfile}<Tab>    {tagaddress}
  return heading.word . "\t" . ':' . a:navitem.spans[0].start.line
endfunction

function! TonPereAuCarre(parent_node, navitem_list)
  for navitem in a:navitem_list
    let heading = TonPere(navitem)
    call add(a:parent_node, heading)
    if has_key(navitem, 'childItems') && len(navitem.childItems)
      call TonPereAuCarre(a:parent_node, navitem.childItems)
    endif
  endfor
  return a:parent_node
endfunction

fu! TaMere(context)
  let root = []

  " 1. Fetch navigation info from TSServer.
  let [navbar_list, is_success] = tsuquyomi#navBar()

  if is_success
    let root = TonPereAuCarre(root, navbar_list)
  endif

  call uniq(sort(root))
  return root
endfunction


function! s:btags_sink(line)
  execute split(a:line, "\t")[1]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  TaMere(0),
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTS call s:btags()


" vim:foldmethod=marker:foldlevel=0
