set nocompatible
filetype off

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Better status and tab lines
Plug 'vim-airline/vim-airline'
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Intellisense engine from VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Shows git status of lines of code
Plug 'airblade/vim-gitgutter'
" Lazy-loads a LOT of language plugins
"Plug 'sheerun/vim-polyglot'
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
" Inline git commit messages
Plug 'APZelos/blamer.nvim'
let g:limelight_conceal_guifg = '#444444'

call plug#end()

set mouse=a
set number
set relativenumber
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
colorscheme gruvbox

" FZF settings (ctrl+p shortcut)
nnoremap <silent> <C-p> :GitFiles<CR>
nnoremap <silent> <C-n> :Files<CR>
nnoremap <silent> <C-k> :Buffers<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

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

" Auto save session on exit
function! SaveSession()
  let cwd_path = substitute(substitute(getcwd(), '\/', '_', 'g'), '_', '', '')
  execute 'mksession! ~/.sessions/' . cwd_path
endfunction

autocmd VimLeave * call SaveSession()

" Nicer splits
set splitbelow
set splitright
