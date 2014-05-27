"
":
" How to use git
"
" //clone
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" //add new file
" cd ~/Hello-World
" git init
" git add README 
" git commit -m 'first commit' 
" git remote add origin https://github.com/username/Hello-World.git
" # Creates a remote named "origin" pointing at your GitHub repository
" git push origin master"
"
" //check in changed files
" git status
" git add <filename>
" git commit -m "xxx"
" git push
"
" // update
" git fetch
" git merge
"
"
" You should first install perl ack, refer beyondgrep.com
"
"
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/taglist.vim'
Plugin 'mbbill/code_complete'
Plugin 'vimplugin/project.vim'
"Plugin 'dkprice/vim-easygrep'
Plugin 'mileszs/ack.vim'
Plugin 'tyok/nerdtree-ack'
"

" Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scripts from http://vim-scripts.org/vim/scripts.html
" Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'genutils'
Plugin 'vimprj'
Plugin 'Dfrankutil'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" scripts not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"
"
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Put your stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My own config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nu
set nocp
set ruler
set nowrap
set tabstop=4
set hlsearch
set shiftwidth=4 
set incsearch
set ignorecase
set autoindent
set fdm=syntax
set nofoldenable


" Maps Alt-[h,j,k,l] to resizing a window split
map <C-h> <C-w><
map <C-j> <C-W>+
map <C-k> <C-W>-
map <C-l> <C-w>>

" Switch buffer
map <S-Tab> :bnext<CR>

"return command mode
imap ,c <ESC>

"save file
imap ,w <ESC>:w<CR>
map ,w  :w<CR>
map ,q  :qall<CR>

" Add tab, then goto command mode
map ,t  i<Tab><ESC>

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
map ,<CR> i<CR><ESC> 

"add blank(space) before and after a word
map ,b i<SPACE><ESC>ea<SPACE><ESC>

"set tags+=tags;/
filetype plugin on
set backspace=2

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "c")
    find %:t:r.h
  else
    find %:t:r.c
  endif
endfunction

nmap ,a :call SwitchSourceHeader()<CR>




function! GetPathDirs()
	let dirs = {}                                                                                     
	let dirlist = []

	let g:pathdirs = split(&path, ",")                                                                
	for path in g:pathdirs

		if path =="\." || path == "\.\." || path == " " || path == ""
			continue
		endif

		let deldir = " "
		let delpath = " " 
		for dir in dirlist
			if match(path, dir) > -1 
				let delpath=path
			endif

			if match(dir, path) > -1
				let deldir=dir
			endif
		endfor

		if deldir !~ " "
			call remove(dirlist, deldir)
			call add(dirlist, path)
		endif

		if delpath =~ " "
			call add(dirlist, path)
		endif

	endfor
	let g:pathlist= join(dirlist, ' ')  
	return g:pathlist 
endfunction



let g:Pattern = ['h', 'c', 'cpp', 'cxx', 'hpp', 'hxx']

" Find file in current directory and edit it.
function! DoFindInPath(...)
    let g:pathlist=&path
	let g:pathlist=substitute(g:pathlist, ",", " ", "g")
	let g:pathlist = GetPathDirs()

    let g:query="\"*".a:1."*\.[".join(g:Pattern,'|')."]\""

	let options = " -type f -iname "

    let g:args="find -H ".g:pathlist.options.g:query

    let g:list=system(g:args)

    let l:num=strlen(substitute(g:list, "[^\n]", "", "g"))

    if l:num < 1
        echo "'".g:query."' not found"
        return
    endif

    "if l:num == 1
    "    exe "open " . substitute(g:list, "\n", "", "g")
    "else
        let tmpfile = tempname()
        exe "redir! > " . tmpfile
        silent echon g:list
        redir END
        let old_efm = &efm
        set efm=%f

        if exists(":cgetfile")
            execute "silent! cgetfile " . tmpfile
        else
            execute "silent! cfile " . tmpfile
        endif

        let &efm = old_efm

        " Open the quickfix window below the current window
        botright copen

        call delete(tmpfile)
   " endif
endfunction

command! -nargs=* FindInPath :call DoFindInPath(<f-args>)
map ,f  :FindInPath <C-R><C-W> <CR>


function! <sid>DoGrepInPath(pattern)
	let g:filesToGrep = GetPathDirs()
	execute "Ack! --ignore-dir=xt --nofollow --nomatlab --cc --make --cpp ".a:pattern." ".g:filesToGrep
endfunction


command! -bang -nargs=* -complete=file GrepInPath  call <sid>DoGrepInPath(<q-args>)
map ,v  :GrepInPath <C-R><C-W> <CR>






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" 
"
" configure super tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = ""



" 
"
" configure colors-solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
"set background=light
colorscheme solarized
let g:solarized_termcolors=256




" 
"
" configure taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Sort_Type = "name"




"
"
"
" Configure indexer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indexer_useSedWhenAppend = 1
let g:indexer_tagsDirname = "/tmp/marsma/indexer"





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

" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)






" 
"
" 
"
" control to toggle full screen mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=im')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=im





