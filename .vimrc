"necessary for lots of cool vim things
set nocompatible

"mapleader this is what is used for the special <leader>
let mapleader=","

"setting the runtime path
set runtimepath=~\.vim,$VIMRUNTIME,~\.vim\after

" enable clipboard and other Win32 features
source $VIMRUNTIME/mswin.vim

" appearance options
colorscheme molokai

" This shows what you are typing as a command. I love this!
set showcmd
 
" Folding Stuffs ==> TODO:Need to set it to a more meaningful value
set foldmethod=marker
 
" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
filetype indent on
syntax enable "TODO: if this doesn't work try >>syntax on

"TODO:look into grepprg, see what's missing here
set grepprg=grep\ -nH\ $*
 
" Who doesn't like autoindent?
set autoindent
 
" Spaces are better than a tab character
set expandtab
set smarttab
 
" Who wants an 8 character tab? Not me!
set shiftwidth=2
set softtabstop=2
 
" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full
 
" Got backspace?
set backspace=2
 
" Line Numbers PWN!
set number
" Incremental searching is sexy
set incsearch
 
" Highlight things that we find with the search
set hlsearch

" more additions
if has("gui_running")
   " No menus and no toolbar
   set guioptions-=m
   set guioptions-=T
   let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
   let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

set modeline
set wildchar=9 " tab as completion character

set virtualedit=block
set clipboard+=unnamed  " Yanks go on clipboard instead.
set showmatch " Show matching braces.

if has("win32") || has("win64")
   set guifont=Envy\ Code\ R:h13.5
   let Tlist_Ctags_Cmd=~\.vim\tools\ctags\ctags.exe "TODO: make sure this works
   set directory=$TMP
   if !has("gui_running")
      colorscheme slate
   end
else
   set directory=/tmp
   set guifont=Envy\ Code\ R\ 16
endif


