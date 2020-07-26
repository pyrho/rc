let g:clap_insert_mode_only = v:true
let g:clap_theme = 'dogrun'

let g:clap#provider#sessions# = {
      \ 'source': ['~/repos/marty/apps/services/email-parser/Session.vim', '~/repos/marty/apps/am-shared/Session.vim'],
      \ 'sink': 'source',
      \ }
