set nocompatible
filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'sjl/badwolf'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()
filetype plugin indent on

" Ctrl P
let g:ctrlp_atch_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_js_checkers = ['jshint']

" Fugitive
set statusline+=%{fugitive#statusline()}

" Vim Airline
set laststatus=2

" Colors
syntax enable
colorscheme badwolf
let g:badwolf_darkgutter=1

" Misc
set ttyfast
set backspace=indent,eol,start

" Spaces & Tabs
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set autoindent

" UI Layout
set number
set showcmd
set cursorline
set wildmenu
set showmatch
match Error /\%81v.\+/

" Searching
set ignorecase
set incsearch
set hlsearch

" Folding
set foldmethod=indent
set foldnestmax=10
set foldenable
nnoremap <space> za
set foldlevelstart=10

" Shortcut Remmaping
inoremap kj <Esc>       
vnoremap kj <Esc>

" Movement
" nnoremap <buffer> <silent> j gj
" nnoremap <buffer> <silent> k gk
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" Leader Shortcuts
let mapleader=","
let g:mapleader=","
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> <silent> :nohlsearch<CR>
nnoremap <leader>t :TagbarToggle<CR>

" Custom Functions
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
