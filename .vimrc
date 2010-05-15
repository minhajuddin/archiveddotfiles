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
   set guifont=Consolas:h13.5
   let Tlist_Ctags_Cmd='c:\Users\minhajuddin\.vim\tools\ctags\ctags.exe' "TODO: make sure this works
   set directory=$TMP
   if !has("gui_running")
      colorscheme slate
   end
else
   set directory=/tmp
endif


set number ruler " show line numbers
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

"
" Bind NERD_Tree plugin to a <Ctrl+E,Ctrl+E>
"
noremap <C-E><C-E> :NERDTree<CR>
noremap <C-E><C-C> :NERDTreeClose<CR>
" disable warnings from NERDCommenter:
let g:NERDShutUp = 1
map <Leader>f gg=G

set lines=9999 columns=9999

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

" makes CTRL-<ENTER> leave insert mode (like Esc)
inoremap <C-space> <Esc>
" shortcut for alt-tabbing buffers
map <M-`> :b#<cr>
imap <M-`> :b#<cr>

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
