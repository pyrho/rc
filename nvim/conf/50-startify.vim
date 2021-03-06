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
            \ { 'w': '~/SynologyDrive/wikis/vimwiki/index.md' },
            \ { 'c': '~/.config/nvim/conf' },
            \ { 't': '~/SynologyDrive/todotxt/todo.txt' },
            \ { 'r': '~/repos' },
            \ { 'z': '~/rc/zsh' },
            \ ]

" Annoying when working on monorepo projects
let g:startify_change_to_vcs_root = 0
" Must have if the above is disabled
let g:startify_change_to_dir = 0
" }}}

