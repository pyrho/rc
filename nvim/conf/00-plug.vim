call plug#begin('~/.vim/plugged')

Plug 'Shougo/defx.nvim', {
            \'do': ':UpdateRemotePlugins' }                    " File browser (vim-vinegar like)
Plug 'kristijanhusak/defx-icons'                               " Nice icons in defx
Plug 'kristijanhusak/defx-git'                                 " git icon integration for defx
Plug 'HerringtonDarkholme/yats.vim',
            \ { 'for': 'typescript' }                          " TS syntax file (better than typescript-vim)

Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'tpope/vim-commentary'                                    " Commenting
Plug 'jason0x43/vim-js-indent',
            \ { 'for': 'javascript' }                          " Syntax for js
Plug 'Yggdroot/vim-mark'                                       " Mark words with color
Plug 'airblade/vim-gitgutter'                                  " Left gutter with modification indication (git)
Plug 'tpope/vim-fugitive'                                      " Git management
Plug 'junegunn/fzf', {
            \'dir': '~/.fzf',
            \'do': './install --all'}                          " Fzf fuzzy finder (ala CtrlP)
Plug 'junegunn/fzf.vim', {'depends': 'fzf'}                    " Fzf fuzzy finder (ala CtrlP)
Plug 'mhinz/vim-startify'                                      " Welcome page
Plug 'godlygeek/tabular'                                       " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown',
            \ { 'for': 'markdown' }
Plug 'chriskempson/base16-vim'                                 " Colorscheme
Plug 'pyrho/base16-vim-lightline', {
            \ 'branch': 'bold-mode'}
Plug 'junegunn/seoul256.vim'                                   " A colorscheme
Plug 'ryanoasis/vim-devicons'                                  " Have nice icons attached to files
Plug 'pangloss/vim-javascript',
            \ { 'for': 'javascript' }

Plug 'junegunn/vim-slash'                                      " Better / * # search mappings
Plug 'elzr/vim-json',
            \ { 'for': 'json' }
Plug 'editorconfig/editorconfig-vim'
" Plug 'tpope/vim-obsession'                                     " automatic session management
Plug 'benknoble/vim-obsession', { 'branch': 'this_session' }     " Waiting on #47
Plug 'junegunn/vim-peekaboo'                                   " Peek at registers
Plug 'amdt/vim-niji'                                             " Rainbow

Plug 'tpope/vim-salve',                                        " Clojure static support
            \ { 'for': 'clojure' }
Plug 'tpope/vim-classpath',                                    " More clojure stuff i don't understand
            \ { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                                    " Clojure support
            \ { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                                " And even more clojure stuff
            \ { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight',                             " Clojure: extended highliting
             \ { 'for': 'clojure' }

Plug 'tpope/vim-surround'                                      " Do stuff around text objects
Plug 'junegunn/goyo.vim',                                      " Zen editor
            \ { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'                                  " Goyo extension to focus on a paragraph
            \ { 'for': 'markdown' }
Plug 'andymass/vim-tradewinds'                                 " Easily move window splits
Plug 'andymass/vim-matchup'                                    " Better matching of pairs
Plug 'eraserhd/parinfer-rust',                                 " Automatic paren handling in lisp-y languages
            \ {'do': 'cargo build --release',
            \  'for': 'clojure' }
Plug 'easymotion/vim-easymotion'                               " Motions, on crack
Plug 'rbong/vim-flog'                                          " Git graph log (integrates with fugitive)
Plug 'joecridge/vim-kinesis', { 'for': 'kinesis' }             " Kinesis syntax files
Plug 'itchyny/lightline.vim'                                   " Lightweight statusline
Plug 'pyrho/lightline-gitdiff', { 'branch': 'fix/git-rebase' } " Git diff integration in lightline
Plug 'NovaDev94/lightline-onedark'                             " Lightline colorscheme
Plug 'romainl/vim-devdocs'                                     " devdocs.io bindings
Plug 'Yggdroot/indentLine'                                     " Show indent
Plug 'jiangmiao/auto-pairs'                                    " Automatically inserts pairs
Plug 'chrisbra/colorizer'                                      " Show colors inline
Plug 'sirtaj/vim-openscad',
            \ {'for': 'openscad'}
Plug 'mbbill/undotree'
Plug 'guns/vim-sexp'                                           " Clojure
Plug 'jonase/eastwood',                                        " Clojure linting
            \ {'for': 'clojure'} 
Plug 'tpope/vim-sexp-mappings-for-regular-people',
            \ {'for': 'clojure'} 
Plug 'tpope/vim-repeat',
            \ {'for': 'clojure'} 
Plug 'hashivim/vim-terraform', 
            \ {'for': 'terraform'}

Plug 'liuchengxu/space-vim-dark'
Plug 'liuchengxu/vim-which-key'
Plug 'stephpy/vim-yaml'
Plug 'lifepillar/pgsql.vim'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-clap'
Plug 't9md/vim-choosewin'                                       " Move between windows & tabs fast

" The do hook is highly recommended.
" It will try to build all the optional dependency if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
call plug#end()
