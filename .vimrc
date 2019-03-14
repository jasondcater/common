set number
set colorcolumn=80
set colorcolumn=120
set tabstop=2
set expandtab
set noruler
set laststatus=2
set showcmd
set directory^=$HOME/.vim/tmp
set nocompatible

" Switch off all auto-indenting
set nocindent
set nosmartindent
set noautoindent
set indentexpr=
filetype indent off
filetype plugin indent off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'crusoexia/vim-monokai'
Plugin 'ctrlpvim/ctrlp.vim'

" All of the plugins must be added before this line.
call vundle#end()
filetype plugin indent on

syntax enable
colorscheme monokai

set statusline=%f    " Path to the file.
set statusline+=\ -\ " Separator
set statusline+=%c   " Column number
set statusline+=\    " Separator
set statusline+=%l   " Current Line
set statusline+=\    " Separator
set statusline+=%L   " Total Lines.

" Adds some non printing chars.
set lcs+=space:·,tab:→\ ,eol:↲
hi SpecialKey term=bold ctermfg=237 guifg=#575b61

set list
set nowrap
set cursorcolumn
set cursorline

" Remap the Esc (command mode) key to match the tmux command mode key.
inoremap <C-b> <ESC>

" Remap the pane nav keys.
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
inoremap <C-v> <C-w>

" Set the ack replacement, Silver Searcher, to override native grep.
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
" Bind 'K' to grep word under cursor.
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Bind '\' to grep shortcut.
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
noremap \ :Ag<SPACE>

" Enabling the airling buffers in the tab area.
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#fnametruncate = 8
