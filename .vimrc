" First, clone vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" install global
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
filetype off                  " required

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

"I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper of all time. Check out these features:
"View any blob, tree, commit, or tag in the repository with :Gedit (and :Gsplit, :Gvsplit, :Gtabedit, ...). 
"Edit a file in the index and write to it to stage the changes. Use :Gdiff to bring up the staged version of 
"the file side by side with the working tree version and use Vim's diff handling capabilities to stage a subset of the file's changes.
"Bring up the output of git status with :Gstatus. Press - to add/reset a file's changes, or p to add/reset --patch. And guess what :Gcommit does!
":Gblame brings up an interactive vertical split with git blame output. Press enter on a line to edit the commit where the line changed, 
"or o to open it in a split. When you're done, use :Gedit in the historic buffer to go back to the work tree version.
":Gmove does a git mv on a file and simultaneously renames the buffer. :Gdelete does a git rm on a file and simultaneously deletes the buffer.
"Use :Ggrep to search the work tree (or any arbitrary commit) with git grep, skipping over that which is not tracked in the repository. 
":Glog loads all previous revisions of a file into the quickfix list so you can iterate over them and watch the file evolve!
":Gread is a variant of git checkout -- filename that operates on the buffer rather than the filename. This means you can use u 
"to undo it and you never get any warnings about the file changing outside Vim. :Gwrite writes to both the work tree and index 
"versions of a file, making it like git add when called from a work tree file and like git checkout when called from the index or a blob in history.
"Use :Gbrowse to open the current file on the web front-end of your favorite hosting provider, with optional line range 
"(try it in visual mode!). Built-in support is provided for git instaweb, and plugins are available for popular providers such as GitHub, GitLab, and Bitbucket.
"Add %{fugitive#statusline()} to 'statusline' to get an indicator with the current branch in (surprise!) your statusline.
"Last but not least, there's :Git for running any arbitrary command, and Git! to open the output of a command in a temp file.
Plugin 'tpope/vim-fugitive'

"core plugin, easy motion
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'altercation/vim-colors-solarized.git'
"core plugin, for show directory
Plugin 'scrooloose/nerdtree'
"core plugin, for generate tags
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'Valloric/YouCompleteMe'

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
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-scripts/taglist.vim'
Plugin 'morhetz/gruvbox'
"Plugin 'joshdick/onedark.vim'
"
"

"| Key | Action                                                |
"| --- | ----------------------------------------------------- |
"| `h`   | Toggle Buffer List (aka `H`ome List)                    |
"| `H`   | Jump to Buffer List (aka `H`ome List) with Search Mode  |
"| `o`   | Toggle File List (aka `O`pen List)                      |
"| `O`   | Jump to File List (aka `O`pen List) with Search Mode    |
"| `l`   | Toggle Tab List (aka `L`ists List)                      |
"| `L`   | Jump to Tab List (aka `L`ists List) with Search Mode    |
"| `w`   | Toggle `W`orkspace List                                 |
"| `W`   | Jump to `W`orkspace List with Search Mode               |
"| `b`   | Toggle `B`ookmark List                                  |
"| `B`   | Jump to `B`ookmark List with Search Mode                |
Plugin 'vim-ctrlspace/vim-ctrlspace'

Plugin 'python-mode/python-mode'

"Comment stuff out. Use gcc to comment out a line (takes a count), 
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment.
" You can also use it as a command, either with a range like :7,17Commentary,
" or as part of a :global invocation like with :g/TODO/Commentary. That's it."
Plugin 'tpope/vim-commentary'

" nnoremap gf :call GotoFile("")<CR>
" nnoremap <C-W>f :call GotoFile("new")<CR>
" nnoremap <C-W><C-F> :call GotoFile("new")<CR>
Plugin 'amix/open_file_under_cursor.vim'

":NR      - Open the selected region in a new narrowed window
":NW      - Open the current visual window in a new narrowed window
":WidenRegion - (In the narrowed window) write the changes back to the original buffer.
":NRV     - Open the narrowed window for the region that was last visually selected.
":NUD     - (In a unified diff) open the selected diff in 2 Narrowed windows
":NRP     - Mark a region for a Multi narrowed window
":NRM     - Create a new Multi narrowed window (after :NRP)
":NRS     - Enable Syncing the buffer content back (default on)
":NRN     - Disable Syncing the buffer content back
":NRL     - Reselect the last selected region and open it again in a narrowed window
Plugin 'chrisbra/NrrwRgn'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
map  ,c <ESC>

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

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" forbid gutentags adding gtags databases
let g:gutentags_auto_add_gtags_cscope = 1


" 
"
" configure taglist and nerktree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>:NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"






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
"
set background=dark
colorscheme gruvbox
"colorscheme solarized
"set guifont=Monaco:h14
"colorscheme onedark

