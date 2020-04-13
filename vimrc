set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=indent,eol,start



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins go here
Plugin 'vim-ruby/vim-ruby'
Plugin 'bfontaine/Brewfile.vim'
Plugin 'fatih/vim-go'
" Plugin 'numirias/semshi'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on " Enable syntax highlightin
filetype on " Enable filetype detection
filetype plugin indent on    " required
filetype plugin on " Enable filetype-specific plugins
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab



