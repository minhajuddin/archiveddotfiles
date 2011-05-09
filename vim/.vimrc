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
colorscheme vividchalk

"settings specific to gvim
if has("gui_running")
  " maximizes the gvim window
  set lines=999 columns=999
  " No menus and no toolbar
  set guioptions-=m
  set guioptions-=T
  let g:obviousModeInsertHi = "guibg=Black guifg=White"
else
  let g:obviousModeInsertHi = "ctermfg=253 ctermbg=16"
endif

" This shows what you are typing as a command. I love this!
set showcmd

" vimdiff stuff
set diffopt+=iwhite

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
au BufNewFile,BufRead *.ru  setf ruby
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
au BufNewFile,BufRead *.rb colorscheme vividchalk
au BufNewFile,BufRead *.erb colorscheme vividchalk
" Needed for Syntax Highlighting and stuff
syntax on " syntax hilight on
syntax sync fromstart 

" pathogen stuff
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" coffee script
let coffee_compile_on_save = 1

"xmlpretty
runtime xmlpretty.vim
command! -range=% Xmlpretty :call XmlPretty(<line1>, <line2>)
" disable warnings from NERDCommenter:
let g:NERDShutUp = 1


vmap <leader>em :call ExtractMethod()<CR>
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

" NERDTree stuff
map <leader>nt :execute 'NERDTreeToggle'<cr>
map <leader>nc :execute 'NERDTreeClose'<cr>
map <leader>nn :execute 'NERDTree'<cr>

" js beautify
nnoremap <silent> <leader>rj :call g:Jsbeautify()<cr>

"FuzzyFinder stuff
map <leader>ff :execute 'FufFile'<cr>
map <leader>fd :execute 'FufDir'<cr>
map <leader>fb :execute 'FufBuf'<cr>

" tab navigation like firefox
nmap <C-S-tab> :bprevious<cr>
nmap <C-tab> :bnext<cr>
map <C-S-tab> :bprevious<cr>
map <C-tab> :bnext<cr>
imap <C-S-tab> <ESC>:bprevious<cr>i
imap <C-tab> <ESC>:bnext<cr>i
nmap <C-n> :tabnew<cr>

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
" ===================================================================== 
" end of custom mappings
" ===================================================================== 



" change current directory to the directory of the current buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>

" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
let loaded_matchparen = 1

" XPTemplate config stuff
let g:xptemplate_vars="author=Khaja Minhajuddin&email=minhajuddin.k@gmail.com"
let g:xptemplate_brace_complete = ''
let g:xptemplate_key = '<Tab>'
let g:xptemplate_key_pum_only = '<S-Tab>'

"supertab config
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" from another vimrc
" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2
" Make command line two lines high
set ch=2
" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=aci

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
      \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
      \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
      \ . ">"<CR>

" set text wrapping toggles
nmap <silent> <leader>wt :set invwrap<CR>:set wrap?<CR>

" Run the command that was just yanked
nmap <silent> <leader>ry :@"<cr>

"Window wrangling
noremap <silent> <leader>ml <C-W>l
noremap <silent> <leader>mk <C-W>k
noremap <silent> <leader>mh <C-W>h
noremap <silent> <leader>mj <C-W>j
noremap <silent> <leader>mL <C-W>L
noremap <silent> <leader>mK <C-W>K
noremap <silent> <leader>mH <C-W>H
noremap <silent> <leader>mJ <C-W>J
noremap <silent> <leader>cw :close<CR>

" Command T settings
map <leader>t :CommandT<cr>
map <leader>cf :CommandTFlush<cr>

" Buffer commands
noremap <silent> <leader>bd :bd<CR>

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
"


