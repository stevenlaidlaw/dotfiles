" vim rc file, used by Neovim
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Material theme for vim
Plug 'kaicataldo/material.vim'

" Hardmode (no movement keys)
" Plug 'https://github.com/wikitopian/hardmode.git'

" Intellisense
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'kien/ctrlp.vim'

" Init plugin system
call plug#end()

set number
set linebreak
set textwidth=100
set showmatch
set virtualedit=all
set visualbell
 
set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
 
set ruler
 
set undolevels=1000
set backspace=indent,eol,start

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
if (has("termguicolors"))
  set termguicolors
endif

set t_vb=

set background=dark
colorscheme material

" Hardmode settings
" Just disable the arrow keys
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
