set nocompatible
filetype off

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Tree explorer like VSCode - Ctrl+N
Plug 'scrooloose/nerdtree'
" Better status and tab lines
Plug 'vim-airline/vim-airline'
" Molokai Theme
Plug 'tomasr/molokai'
Plug 'RobertYan/monokai-soda'
" Material theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Intellisense engine from VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Shows git status of lines of code
Plug 'airblade/vim-gitgutter'
" Auto-close parens, quotes, brackets, etc
Plug 'Raimondi/delimitMate'
" Lazy-loads a LOT of language plugins
Plug 'sheerun/vim-polyglot'
" File search which is fast - Ctrl+P
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Decent icons for files. Get the nerdfont here: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
Plug 'ryanoasis/vim-devicons'
" Ack integration (override by Ag in settings)
Plug 'mileszs/ack.vim'
" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Copilot
Plug 'github/copilot.vim'
" Goyo - Distraction-free vim
Plug 'junegunn/goyo.vim'

call plug#end()

set mouse=a
set number
set linebreak
set showmatch
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
set listchars=space:.

set undolevels=1000
set backspace=indent,eol,start

set hidden
set cmdheight=1
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

syntax enable

set t_vb=

set background=dark
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'ocean-community'
colorscheme gruvbox

" FZF settings (ctrl+p shortcut)
nnoremap <silent> <C-p> :GitFiles<CR>
nnoremap <silent> <C-n> :Files<CR>

" NERDTree Settings (ctrl+n shortcut)
let g:NERDTreeIgnore=['\.git$', 'node_modules$']
nnoremap <silent> <F2> :NERDTreeFind<CR>
map <C-b> :NERDTreeToggle<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" If no file is opened at startup open NerdTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use Ag instead of Ack
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'

" Prettier auto-format on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Some common misspellings
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

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

set splitbelow
set splitright
