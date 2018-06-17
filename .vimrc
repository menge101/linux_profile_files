set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'inkarkat/vim-ingo-library.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Use spaces instead of tabs
set expandtab

"hard tabstop size
set tabstop=2

"indent size
set shiftwidth=2

"whatever a soft tab is....
set softtabstop=2

"Make the screen not some horrible white all the time
colorscheme evening
