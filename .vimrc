filetype plugin indent on

set ttyfast
set number
set timeoutlen=1000 ttimeoutlen=0
set incsearch ignorecase smartcase hlsearch

noremap <F1> <nop>
noremap Q <nop>
noremap K <nop>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'down': '~20%' }

" keybinds
map <C-n> :NERDTreeToggle<CR>

let mapleader = "\<Space>"
nmap <Leader>o :Files<CR>
nmap <Leader>a :Rg<CR>
nmap <Leader>f :GoDecls<CR>

let g:airline_solarized_bg='dark'

" default tab -> four space
set tabstop=4 shiftwidth=4 expandtab

filetype plugin indent on
au FileType go set noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" vim-plug plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme nord
