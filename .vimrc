" First, clone vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" --- requirements:
"
" sudo dnf install cmake gcc-c++ make python3-devel
" https://vimawesome.com/plugin/youcompleteme
" sudo yum install ncurses-devel
" install global
"     https://www.gnu.org/software/global/download.html
"
" Note in windows, CTRL-V is paste, use CTRL-Q instead.
"
"
"
"
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set nu
set ruler
set nowrap
set hlsearch
set shiftwidth=4 
set incsearch
set ignorecase
set autoindent
set fdm=syntax
set nofoldenable
set tabstop=4
set encoding=utf-8
set hidden
set wildignore=*\/obj\/*.o
"filetype off                  " required
set t_Co=256



" linux
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" windows
"set rtp+=$HOME/.vim/bundle/Vundle.vim/
"call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" -----------------------------------------
" scripts on GitHub repos

"core plugin, easy motion
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'python-mode/python-mode'

"0 or s: Find this symbol
"1 or g: Find this definition
"2 or d: Find functions called by this function
"3 or c: Find functions calling this function
"4 or t: Find this text string
"6 or e: Find this egrep pattern
"7 or f: Find this file
"8 or i: Find files #including this file
"9 or a: Find places where this symbol is assigned a value
"<leader>cs	Find symbol (reference) under cursor
"<leader>cg	Find symbol definition under cursor
"<leader>cd	Functions called by this function
"<leader>cc	Functions calling this function
"<leader>ct	Find text string under cursor
"<leader>ce	Find egrep pattern under cursor
"<leader>cf	Find file name under cursor
"<leader>ci	Find files #including the file name under cursor
"<leader>ca	Find places where current symbol is assigned
Plugin 'skywind3000/gutentags_plus'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'ycm-core/YouCompleteMe'

"Comment stuff out. Use gcc to comment out a line (takes a count), 
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment.
" You can also use it as a command, either with a range like :7,17Commentary,
" or as part of a :global invocation like with :g/TODO/Commentary. That's it."
Plugin 'tpope/vim-commentary'




Plugin 'NLKNguyen/papercolor-theme'
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-one'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'NLKNguyen/c-syntax.vim'
"






Plugin 'amix/open_file_under_cursor.vim'
nnoremap gf :call GotoFile("")<CR>
nnoremap <C-W>f :call GotoFile("new")<CR>
nnoremap <C-W><C-F> :call GotoFile("new")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My own config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set hidden
" Maps Alt-[h,j,k,l] to resizing a window split
map <C-h> <C-w><
map <C-j> <C-W>+
map <C-k> <C-W>-
map <C-l> <C-w>>

" Switch buffer
map <S-Tab> :bnext<CR>

"return command mode
map ,c <ESC>

"save file
imap ,w <ESC>:w<CR>
map ,w  :w<CR>

" Add tab, then goto command mode
map ,t  i<Tab><ESC>

" Add hex edit shortcut
map ,x  :%!xxd<CR>
map ,xr :%!xxd -r<CR>

" Copy and past
map ,y  "yyiw
map ,p  diw"yP

" Global yank and paste
map ,gy  "+y
map ,gx  "+x
map ,gp  "+gP

" Shift in {}
map ,{  <i{
map ,}  >i{

 

" subsititue
map ,s  yiw:%s/\<<C-R>0\>/
map ,<SPACE> i<SPACE><ESC> 


"add blank(space) before and after a word
map ,b i<SPACE><ESC>ea<SPACE><ESC>

" tag control
" open in preview window
map <C-[> <C-W>g}
" close preview window
map ,q  <C-W>z




map ,ar :FSSplitRight<CR>
map ,al :FSSplitLeft<CR>
map ,aa :FSSplitAbove<CR>
map ,ab :FSSplitBelow<CR>

"function! SwitchSourceHeader()
"  "update!
"  if (expand("%:e") == "c")
"    tag <C-R>=expand("%:t:r") . ".h" <CR> <CR>
"  else
"    tag <C-R>=expand("%:t:r") . ".c" <CR> <CR>
"  endif
"endfunction
"
"map ,a :call SwitchSourceHeader()<CR>
"map ,c :tag <C-R>=expand("%:t:r") . ".c" <CR> <CR>
"map ,h :tag <C-R>=expand("%:t:r") . ".h" <CR> <CR>







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 
"
" configure airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline_theme = 'light'
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', ]
    \ ]

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1

" 
"
" configure taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = "name"



"enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

"let g:gutentags_file_list_command = 'find . -path "*/src/*" -o -path "*/include/*" -o -path "*/inc/*" -o -path "*/Samanea/*"'

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_generate_on_write = 1
set statusline+=%{gutentags#statusline()}


" 
"
" configure taglist and nerktree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>:NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"



let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_scope_highlight = 1




" 
"
" configure easy montion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<SPACE>'
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
let g:mapleader = ','



syntax enable
syntax on
set background=dark
" colorscheme gruvbox
" colorscheme PaperColor
" colorscheme iceberg
"colorscheme nord
colorscheme one 
