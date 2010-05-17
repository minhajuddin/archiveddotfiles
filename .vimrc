"necessary for lots of cool vim things
set nocompatible

"mapleader this is what is used for the special <leader>
let mapleader=","

if has("win32") || has("win64")
  "Windows specific settings
  set guifont=Consolas:h13.5
  let Tlist_Ctags_Cmd='c:\Users\minhajuddin\.vim\tools\ctags\ctags.exe' "TODO: make sure this works
  set directory=$TMP
  set runtimepath=~\.vim,$VIMRUNTIME,~\.vim\after
  if !has("gui_running")
    "settings specific to windows console vim < cannot display rich colors
    colorscheme slate
  endif
else
  "Linux specific settings
  "setting the runtime path
  set runtimepath=~/.vim,$VIMRUNTIME,~/.vim/after
  set directory=/tmp
endif

" appearance options
set bg=dark
let g:zenburn_high_Contrast = 1
let g:molokai_original = 0
set t_Co=256
colorscheme molokai

"settings specific to gvim
if has("gui_running")
  set lines=99999 columns=9999
else
endif



" This shows what you are typing as a command. I love this!
set showcmd

" Folding Stuffs ==> TODO:Need to set it to a more meaningful value
set foldmethod=marker


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
  set lines=99999 columns=9999
  let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
  let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

set modeline
set wildchar=9 " tab as completion character

set virtualedit=block
set clipboard=unnamed  " Yanks go on clipboard instead.
set showmatch " Show matching braces.


set number ruler " show line numbers
set ignorecase
set smartcase
set cursorline
set selectmode=key
" default to UTF-8 encoding
set encoding=utf8
set fileencoding=utf8

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr> 
" map \tx for the console version as well
if !has("gui_running")
  nmap <Leader>tn :tabnext<cr>
  nmap <Leader>tp :tabprevious<cr>
  nmap <Leader><F4> :tabclose<cr>
end
" Make sure taglist doesn't change the window size
let g:Tlist_Inc_Winwidth = 0
nnoremap <silent> <F8> :TlistToggle<CR>

" set custom file types I've configured
au BufNewFile,BufRead *.ps1  setf ps1
au BufNewFile,BufRead *.boo  setf boo
au BufNewFile,BufRead *.config  setf xml
au BufNewFile,BufRead *.xaml  setf xml
au BufNewFile,BufRead *.xoml  setf xml
au BufNewFile,BufRead *.blogTemplate  setf xhtml
au BufNewFile,BufRead *.brail  setf xhtml
au BufNewFile,BufRead *.rst  setf xml
au BufNewFile,BufRead *.rsb  setf xml
au BufNewFile,BufRead *.io  setf io
au BufNewFile,BufRead *.notes setf notes
au BufNewFile,BufRead *.mg setf mg

" Needed for Syntax Highlighting and stuff
syntax on " syntax hilight on
syntax sync fromstart 
filetype plugin indent on

"xmlpretty
runtime xmlpretty.vim
command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)
map <C-K><C-F> :Xmlpretty<CR>

" disable warnings from NERDCommenter:
let g:NERDShutUp = 1

map <leader>rc :execute '!ruby %'<cr> "execute ruby code in the current buffer
"rewrite this command when you know how to get the current line info => map <leader>rl :execute '!ruby -e \'\''<cr>
map <leader>f gg=G<cr>
map <leader>nt :execute 'NERDTreeToggle'<cr>
