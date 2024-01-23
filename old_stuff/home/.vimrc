" filetype off " required by Vundle

set encoding=UTF-8
let &t_SI = "\e[6 q" " Insert mode convert cursor to a line `|`
let &t_EI = "\e[2 q" " Normal mode convert cursor to a block `█`

" #######
" PLUGINS
" #######

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged') " Specify a directory for plugins
Plug 'vim-airline/vim-airline' " Status line
Plug 'morhetz/gruvbox' " Gruvbox theme
Plug 'airblade/vim-gitgutter' " Git status per line
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } " File search
Plug 'junegunn/fzf.vim' " FZF integration
Plug 'mileszs/ack.vim' " Ack integration
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } " Prettier integration
Plug 'github/copilot.vim' " Copilot integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'APZelos/blamer.nvim' " Git blame
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " Ruby Solargraph LSP
Plug 'rhysd/vim-grammarous' " Grammar checker
Plug 'preservim/nerdtree' " File explorer
Plug 'ryanoasis/vim-devicons' " Icons
call plug#end()

" #############
" CONFIGURATION
" #############

set mouse=
set number " Show line numbers
set relativenumber " Show relative line numbers
set linebreak " Wrap long lines
set showmatch " Show matching brackets
set visualbell " Disable beeps
set hlsearch " Highlight search results
set smartcase " Ignore case if search term is all lowercase
set ignorecase " Ignore case when searching
set incsearch " Show search results as you type
set autoindent " Auto indent new lines
set shiftwidth=2 " Sets the number of spaces for autoindent
set smartindent " auto indent new lines
set smarttab " indent with tabs, align with spaces
set softtabstop=2 " Sets the number of spaces for tab
set tabstop=2 " Tab stops every 2 spaces (for display)
set ruler " Show cursor position
set list " Show whitespace
set listchars=space:. " Show spaces as dots
set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set hidden " Allow buffers to be hidden
set cmdheight=1 " Height of command bar
set updatetime=300 " Faster completion (default is 4000 ms)
set ttimeoutlen=5 " Prevent delay when switching modes
set shortmess+=c " Don't pass messages to ins-completion-menu
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time
set t_vb= " Disable visual bell
set splitbelow " Horizontal splits will automatically be below
set splitright " Vertical splits will automatically be to the right
set background=dark " Dark background
silent! colorscheme " Prevent error from blocking first run
colorscheme gruvbox " Set theme

if $COLORTERM == 'gnome-terminal'
  set t_Co=256 " Support 256 colors
endif
if (has("termguicolors"))
  set termguicolors " Support 24-bit colors
endif
if exists('+termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax enable " Enable syntax highlighting

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

" ############
" KEY MAPPINGS
" ############

nnoremap <silent> <C-p> :GitFiles<CR>
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <C-k> :Buffers<CR>
nnoremap <silent> <C-F> :Ag<CR>
nnoremap <silent> <C-T> :term<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" ###############
" PLUGIN SETTINGS
" ###############

let g:NERDTreeWinSize=60 " Set NERDTree width

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Use fonts
let g:airline_powerline_fonts = 1

" Prettier auto-format on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" COC Extensions
let g:coc_global_extensions = ['coc-json', 'coc-rust-analyzer', 'coc-html', 'coc-java', 'coc-go', 'coc-sql', 'coc-tsserver', 'coc-clangd', 'coc-python', 'coc-css']
" COC Map return to accept
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ##############
" USER FUNCTIONS
" ##############

" Auto save session on exit
function! SaveSession()
  let cwd_path = substitute(substitute(getcwd(), '\/', '_', 'g'), '_', '', '')
  execute 'mksession! ~/.sessions/' . cwd_path
endfunction

" Call SaveSession() on exit
autocmd VimLeave * call SaveSession()

" Remove background color on startup
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

