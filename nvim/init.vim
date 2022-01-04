"PLUGINS ---------- {{{


call plug#begin('~/.config/nvim/plugged')

Plug 'edwinb/idris2-vim'

call plug#end()


" }}}


" PROPERTIES ---------- {{{


" disable vi compatibilty
set nocompatible

" filetype detection
filetype on

" automatic indentation
filetype indent on
set ai

" use 4 spaces for indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" use smart search casing
set ignorecase
set smartcase

" set the width of the text
set textwidth=80

" turn on syntax highlighting
syntax on

" activate line numbers
set number

" line wrapping and scrolling
set nowrap
set scrolloff=4
set sidescrolloff=16

" highlight cursor line
set cursorline

" enable auto completion when pressing tab
set wildmenu
set wildmode=list:longest

" ignore file types
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.bin,*.lock,*.odt

" set the leaderkey
let mapleader=","


" }}}


" VIMSCRIPT ---------- {{{


" Enable code folding in vimscript files
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" }}}
