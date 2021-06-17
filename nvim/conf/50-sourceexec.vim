" From https://sbulav.github.io/vim/neovim-telescope-github/
" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :lua require("plenary.reload").reload_module'%'
    :luafile %
  endif

  return
endfunction
" save and resource current file
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>
