" These our just some sensible defaults that I don't know why aren't default
syntax on
" turns of folding by default, so annoying when you open a file and everything
" is folded
set nofoldenable
set background=dark
" This means not comptable with Vi
set nocompatible
filetype plugin on
" change 4 to whatever tab length you prefer. set smarttab if you want to use
" spaces instead of tabs
set tabstop=4
set shiftwidth=4
set smartindent
" When indentation is made, insert space 'tabstop' times instead of tab
" character.
set expandtab 
" This makes it htat you can use your mouse for scrolling, resizing splits,
" switching between splits etc.
set mouse=a
" Show both relative line number and absolute line number.
set rnu
set nu
set nowrap
" Turns of highlighting after a seach is done.
" set nohlsearch
set noerrorbells
" True color
set termguicolors
" If you have one file open, then you switch to another file, instead of
" giving you a warning then and there that the file is unsaved, the file will
" instead become a buffer and you can run Telescope buffers (or use the
" <SPC>bb keybind) to see all the
" open buffers
set hidden
set incsearch
" Only does case sensitive search with a capital is there in a search
set smartcase
" Case insensitive serach
set ignorecase
" Vim I don't want you creating files on my harddrive without my permission
" no matter your intent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set encoding=UTF-8
set langmenu=en_US.UTF-8
" Set the leader key to space, makes some shortcuts really easily, set this
" whatever key you want to the "\" key by default
let mapleader = " "
" Turns off line numbers when you call the :term command to use a terminal
" inside of neovim
autocmd TermOpen * setlocal nonumber norelativenumber

