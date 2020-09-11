set nocompatible
filetype off

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Tree explorer like VSCode - Ctrl+N
Plug 'scrooloose/nerdtree'
" Better status and tab lines
Plug 'vim-airline/vim-airline'
" Theme
Plug 'tomasr/molokai'
" Intellisense engine from VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Shows git status of lines of code
Plug 'airblade/vim-gitgutter'
" Auto-clode parens, quotes, brackets, etc
Plug 'Raimondi/delimitMate'
" Lazy-loads a LOT of language plugins
Plug 'sheerun/vim-polyglot'
" File search which is fast - Ctrl+P
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Decent icons for files. Get the nerdfont here: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
Plug 'ryanoasis/vim-devicons'

call plug#end()

set mouse=a
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
set tabstop=2

set ruler
set list

set undolevels=1000
set backspace=indent,eol,start

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
if (has("termguicolors"))
  set termguicolors
endif

set t_vb=

set background=dark
colorscheme molokai

" Hardmode settings
" Just disable the arrow keys
" let g:HardMode_level = 'wannabe'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" FZF settings (ctrl+p shortcut)
nnoremap <silent> <C-p> :Files<CR>

" NERDTree Settings (ctrl+n shortcut)
let g:NERDTreeIgnore=['\.git$', 'node_modules$']
nnoremap <silent> <F2> :NERDTreeFind<CR>
map <C-n> :NERDTreeToggle<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" If no file is opened at startup open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
