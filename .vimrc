" First, clone vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
"On an Ubuntu or Debian machine, this is as simple as installing the utility
"from the default repositories. The package is called ack-grep:
"
"sudo apt-get update
"sudo apt-get install ack-grep
"
" You should first install perl ack, refer beyondgrep.com
" to install choco, do this in power shell: Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
" then "choco install ack", to install ack
"
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
syntax enable
"set background=dark
"colorscheme solarized
set hidden
"set guifont=Monaco:h14
filetype off                  " required

" linux
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" windows
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

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
Plugin 'vim-scripts/taglist.vim'

Plugin 'morhetz/gruvbox'

"
"
"Usage: ack [OPTION]... PATTERN [FILES OR DIRECTORIES]
"
"Search for PATTERN in each source file in the tree from the current
"directory on down.  If any files or directories are specified, then
"only those files and directories are checked.  ack may also search
"STDIN, but only if no file or directory arguments are specified,
"or if one of them is "-".
"
"Default switches may be specified in ACK_OPTIONS environment variable or
"an .ackrc file. If you want no dependency on the environment, turn it
"off with --noenv.
"
"Example: ack -i select
"
"Searching:
"  -i, --ignore-case             Ignore case distinctions in PATTERN
"  --[no]smart-case              Ignore case distinctions in PATTERN,
"                                only if PATTERN contains no upper case.
"                                Ignored if -i is specified
"  -v, --invert-match            Invert match: select non-matching lines
"  -w, --word-regexp             Force PATTERN to match only whole words
"  -Q, --literal                 Quote all metacharacters; PATTERN is literal
"
"Search output:
"  --lines=NUM                   Only print line(s) NUM of each file
"  -l, --files-with-matches      Only print filenames containing matches
"  -L, --files-without-matches   Only print filenames with no matches
"  --output=expr                 Output the evaluation of expr for each line
"                                (turns off text highlighting)
"  -o                            Show only the part of a line matching PATTERN
"                                Same as --output='$&'
"  --passthru                    Print all lines, whether matching or not
"  --match PATTERN               Specify PATTERN explicitly.
"  -m, --max-count=NUM           Stop searching in each file after NUM matches
"  -1                            Stop searching after one match of any kind
"  -H, --with-filename           Print the filename for each match (default:
"                                on unless explicitly searching a single file)
"  -h, --no-filename             Suppress the prefixing filename on output
"  -c, --count                   Show number of lines matching per file
"  --[no]column                  Show the column number of the first match
"
"  -A NUM, --after-context=NUM   Print NUM lines of trailing context after
"                                matching lines.
"  -B NUM, --before-context=NUM  Print NUM lines of leading context before
"                                matching lines.
"  -C [NUM], --context[=NUM]     Print NUM lines (default 2) of output context.
"
"  --print0                      Print null byte as separator between filenames,
"                                only works with -f, -g, -l, -L or -c.
"
"  -s                            Suppress error messages about nonexistent or
"                                unreadable files.
"
"
"File presentation:
"  --pager=COMMAND               Pipes all ack output through COMMAND.  For
"                                example, --pager="less -R".  Ignored if output
"                                is redirected.
"  --nopager                     Do not send output through a pager.  Cancels
"                                any setting in ~/.ackrc, ACK_PAGER or
"                                ACK_PAGER_COLOR.
"  --[no]heading                 Print a filename heading above each file's
"                                results.  (default: on when used interactively)
"  --[no]break                   Print a break between results from different
"                                files.  (default: on when used interactively)
"  --group                       Same as --heading --break
"  --nogroup                     Same as --noheading --nobreak
"  --[no]color                   Highlight the matching text (default: on unless
"                                output is redirected, or on Windows)
"  --[no]colour                  Same as --[no]color
"  --color-filename=COLOR
"  --color-match=COLOR
"  --color-lineno=COLOR          Set the color for filenames, matches, and line
"                                numbers.
"  --flush                       Flush output immediately, even when ack is used
"                                non-interactively (when output goes to a pipe or
"                                file).
"
"
"File finding:
"  -f                            Only print the files selected, without
"                                searching.  The PATTERN must not be specified.
"  -g                            Same as -f, but only select files matching
"                                PATTERN.
"  --sort-files                  Sort the found files lexically.
"  --show-types                  Show which types each file has.
"  --files-from=FILE             Read the list of files to search from FILE.
"  -x                            Read the list of files to search from STDIN.
"
"File inclusion/exclusion:
"  --[no]ignore-dir=name         Add/remove directory from list of ignored dirs
"  --[no]ignore-directory=name   Synonym for ignore-dir
"  --ignore-file=filter          Add filter for ignoring files
"  -r, -R, --recurse             Recurse into subdirectories (default: on)
"  -n, --no-recurse              No descending into subdirectories
"  --[no]follow                  Follow symlinks.  Default is off.
"  -k, --known-types             Include only files of types that ack recognizes.
"
"  --type=X                      Include only X files, where X is a recognized
"                                filetype.
"  --type=noX                    Exclude X files.
"                                See "ack --help-types" for supported filetypes.
"
"File type specification:
"  --type-set TYPE:FILTER:FILTERARGS
"                                Files with the given FILTERARGS applied to the
"                                given FILTER are recognized as being of type
"                                TYPE. This replaces an existing definition for
"                                type TYPE.
"  --type-add TYPE:FILTER:FILTERARGS
"                                Files with the given FILTERARGS applied to the
"                                given FILTER are recognized as being type TYPE.
"  --type-del TYPE               Removes all filters associated with TYPE.
"
"
"Miscellaneous:
"  --[no]env                     Ignore environment variables and global ackrc
"                                files.  --env is legal but redundant.
"  --ackrc=filename              Specify an ackrc file to use
"  --ignore-ack-defaults         Ignore default definitions included with ack.
"  --create-ackrc                Outputs a default ackrc for your customization
"                                to standard output.
"  --help, -?                    This help
"  --help-types                  Display all known types
"  --dump                        Dump information on which options are loaded
"                                from which RC files
"  --[no]filter                  Force ack to treat standard input as a pipe
"                                (--filter) or tty (--nofilter)
"  --man                         Man page
"  --version                     Display version & copyright
"  --thpppt                      Bill the Cat
"  --bar                         The warning admiral
"  --cathy                       Chocolate! Chocolate! Chocolate!
"
"Exit status is 0 if match, 1 if no match.
"
"This is version 2.12 of ack.
"ack's file types (ack --help-types)
"
" Usage: ack [OPTION]... PATTERN [FILES OR DIRECTORIES]
"
"The following is the list of filetypes supported by ack.  You can
"specify a file type with the --type=TYPE format, or the --TYPE
"format.  For example, both --type=perl and --perl work.
"
Plugin 'mileszs/ack.vim'


Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'klen/python-mode'

Plugin 'ctrlpvim/ctrlp.vim'

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
imap ,c <ESC>
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
map ,c :tag <C-R>=expand("%:t:r") . ".c" <CR> <CR>
map ,h :tag <C-R>=expand("%:t:r") . ".h" <CR> <CR>







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



let g:gutentags_project_root = [".prjbase"]
let g:ctrlp_root_markers = [".prjbase"]




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



colorscheme gruvbox

