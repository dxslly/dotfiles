set nocompatible
filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'sjl/badwolf'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp'

call vundle#end()
filetype plugin indent on

" Ctrl P
let g:ctrlp_atch_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Colors
syntax enable
colorscheme badwolf
let g:badwolf_darkgutter=1

" Misc
set ttyfast
set nu

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
imap kj <Esc>       " Change nasty escape button, way too far away

" Movement
nnoremap j gj
nnoremap k gk
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" Leader Shortcuts
let mapleader=","
nnoremap <leader>w :NERDTree<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader><space> :hohlsearch<CR>

augroup configgroup
  autocmd!
  autocmd BufWritePre *.py,*.js,*.txt,*.java,*.md :call <SIC>StripTrailingWhitespaces()
augroup END

" Custom Functions
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" strips trailing whitespace at the end of files. this
" " is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
" save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

function! <SID>CleanFile()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %!git stripspace
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
