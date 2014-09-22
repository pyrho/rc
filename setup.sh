#Vim stuff {{{
VIM_VUNDLE_DIR="${HOME}/.vim/bundle"
VIM_SWAP_AND_BACKUP_DIR="${HOME}/.vimswap"

if [ ! -d "$VIM_SWAP_AND_BACKUP_DIR" ]; then
    echo "Creating directory $VIM_SWAP_AND_BACKUP_DIR"
    mkdir -p "$VIM_SWAP_AND_BACKUP_DIR"
fi

if [ ! -d "$VIM_VUNDLE_DIR" ]; then
    echo "Creating directory $VIM_VUNDLE_DIR"
    mkdir "$VIM_VUNDLE_DIR"
fi


if [ ! -d "$VIM_VUNDLE_DIR/Vundle.vim" ]; then
    git clone https://github.com/gmarik/Vundle.vim.git $VIM_VUNDLE_DIR/Vundle.vim
fi

ln -sf ~/rc/vimrc ~/.vimrc
# }}}



#ZSH {{{
ZSH_OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
if [ ! -d "$ZSH_OH_MY_ZSH_DIR" ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

ln -sf ~/rc/zshrc ~/.zshrc

chsh -s /bin/zsh
# }}}
