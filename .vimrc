"
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
"
"
"
"
"
"
"
"
"
"
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
Plugin 'vim-scripts/supertab.git'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/taglist.vim'
" Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'genutils'
Plugin 'FSwitch'
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

set tags+=tags;/
filetype plugin on



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" configure super tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = ""


" configure colors-solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
"set background=light
colorscheme solarized


" configure taglist and nerktree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>:NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"


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



