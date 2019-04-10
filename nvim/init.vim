if has("gui_vimr")
    runtime! init_vimr.vim
elseif has('nvim')
    set runtimepath+=$HOME/rc/nvim
    runtime! conf/[[:digit:]][[:digit:]]-*.vim
endif



