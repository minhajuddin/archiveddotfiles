"necessary for lots of cool vim things
set nocompatible

"mapleader this is what is used for the special <leader>
let mapleader=","

"Settings specific to Windows and Linux
if has("win32") || has("win64")
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
  set grepprg=grep\ -nH\ $*
endif

" appearance options
set bg=dark
let g:zenburn_high_Contrast = 1
let g:molokai_original = 0
set t_Co=256
colorscheme molokai

"settings specific to gvim
if has("gui_running")
  " maximizes the gvim window
  set lines=99999 columns=9999
  " No menus and no toolbar
  set guioptions-=m
  set guioptions-=T
  let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
  let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

" This shows what you are typing as a command. I love this!
set showcmd

" Folding Stuffs ==> TODO:Need to set it to a more meaningful value
set foldmethod=marker

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

set modeline
set wildchar=9 " tab as completion character

set virtualedit=block
set clipboard=unnamed  " Yanks go on clipboard instead.
set showmatch " Show matching braces.

set number ruler " show line numbers
" ignores case while searching
set ignorecase
" ignores case while using lower case chars, searches in a case sensitive
" fashion when an upper case char is used
set smartcase
set cursorline
set selectmode=key
" default to UTF-8 encoding
set encoding=utf8
set fileencoding=utf8

" Make sure taglist doesn't change the window size
let g:Tlist_Inc_Winwidth = 0

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
au BufNewFile,BufRead *.spark setf html

" Needed for Syntax Highlighting and stuff
syntax on " syntax hilight on
syntax sync fromstart 
filetype plugin indent on

"xmlpretty
runtime xmlpretty.vim
command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)
" disable warnings from NERDCommenter:
let g:NERDShutUp = 1


vmap <Leader>em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>private " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
endfunction

" ==================
" Custom mappings
" ==================

" shortcut for alt-tabbing buffers
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>

" NERDTree stuff
map <leader>nt :execute 'NERDTreeToggle'<cr>
map <leader>nc :execute 'NERDTreeClose'<cr>

"FuzzyFinder stuff
map <leader>ff :execute 'FufFile'<cr>
map <leader>fd :execute 'FufDir'<cr>
map <leader>fb :execute 'FufBuf'<cr>

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
nmap <Leader>tn :tabnew<cr>

" miscellaneous
" rewrite this command when you know how to get the current line info => map <leader>rl :execute '!ruby -e \'\''<cr>
"execute ruby code in the current buffer
map <leader>rc :execute '!ruby %'<cr> 
map <C-K><C-F> :Xmlpretty<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

" reformat the file
map <leader>rf gg=G<cr> 

" remove search highlight
map <leader>rh :nohls<cr>

" change current directory to the directory of the current buffer
nmap <silent> <leader>cd :lcd %:h<CR>
" ===================================================================== 
" end of custom mappings
" ===================================================================== 

" TODO ============== Get this working in the right way ==========
" set any autocmds (make sure they are only set once)
"if !exists("autocommands_loaded")
"let autocommands_loaded = 1

" setup C# building
"autocmd BufNewFile,BufRead *.cs compiler devenv

" setup folding
"autocmd BufNewFile,BufRead *.cs set foldmethod=syntax
"endif
" setup integrated help
"function! OnlineDoc()
"let s:wordUnderCursor = expand("<cword>")

"if &ft =~ "cs"
"let s:url = "http://social.msdn.microsoft.com/Search/en-US/?Refinement=26&Query=" . s:wordUnderCursor
"else
"execute "help " . s:wordUnderCursor
"return
"endif

"let s:browser = "\"C:\Users\kberridge\AppData\Local\Google\Chrome\Application\chrome.exe\""
"let s:cmd = "silent !start " . s:browser . " " . s:url

"execute s:cmd
"endfunction

"map <silent> <F1> :call OnlineDoc()<CR>
"imap <silent> <F1> <ESC>:call OnlineDoc()<CR>

" TODO ============== Get this working in the right way ==========
