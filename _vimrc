" First, clone vundle
" git clone https://github.com//VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
" or
" git clone https://github.com/VundleVim/Vundle.vim.git bundle
"
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
filetype off                  " required

" linux
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" windows
set rtp+=$HOME/.vim/bundle/Vundle.vim/
set rtp+=$HOME/.vim/
set rtp+=$HOME/.vim/bundle/
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" -----------------------------------------
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'vim-scripts/taglist.vim'
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
"Note that some extensions may appear in multiple types.  For example,
".pod files are both Perl and Parrot.
"
"    --[no]actionscript .as .mxml
"    --[no]ada          .ada .adb .ads
"    --[no]asm          .asm .s
"    --[no]asp          .asp
"    --[no]aspx         .master .ascx .asmx .aspx .svc
"    --[no]batch        .bat .cmd
"    --[no]cc           .c .h .xs
"    --[no]cfmx         .cfc .cfm .cfml
"    --[no]clojure      .clj
"    --[no]cmake        CMakeLists.txt; .cmake
"    --[no]coffeescript .coffee
"    --[no]cpp          .cpp .cc .cxx .m .hpp .hh .h .hxx
"    --[no]csharp       .cs
"    --[no]css          .css
"    --[no]dart         .dart
"    --[no]delphi       .pas .int .dfm .nfm .dof .dpk .dproj .groupproj .bdsgroup .bdsproj
"    --[no]elisp        .el
"    --[no]elixir       .ex .exs
"    --[no]erlang       .erl .hrl
"    --[no]fortran      .f .f77 .f90 .f95 .f03 .for .ftn .fpp
"    --[no]go           .go
"    --[no]groovy       .groovy .gtmpl .gpp .grunit .gradle
"    --[no]haskell      .hs .lhs
"    --[no]hh           .h
"    --[no]html         .htm .html
"    --[no]java         .java .properties
"    --[no]js           .js
"    --[no]json         .json
"    --[no]jsp          .jsp .jspx .jhtm .jhtml
"    --[no]less         .less
"    --[no]lisp         .lisp .lsp
"    --[no]lua          .lua; first line matches /^#!.*\blua(jit)?/
"    --[no]make         .mk; .mak; makefile; Makefile; GNUmakefile
"    --[no]matlab       .m
"    --[no]md           .mkd; .md
"    --[no]objc         .m .h
"    --[no]objcpp       .mm .h
"    --[no]ocaml        .ml .mli
"    --[no]parrot       .pir .pasm .pmc .ops .pod .pg .tg
"    --[no]perl         .pl .pm .pod .t .psgi; first line matches /^#!.*\bperl/
"    --[no]perltest     .t
"    --[no]php          .php .phpt .php3 .php4 .php5 .phtml; first line matches /^#!.*\bphp/
"    --[no]plone        .pt .cpt .metadata .cpy .py
"    --[no]pmc          .pmc
"    --[no]python       .py; first line matches /^#!.*\bpython/
"    --[no]rake         Rakefile
"    --[no]rr           .R
"    --[no]ruby         .rb .rhtml .rjs .rxml .erb .rake .spec; Rakefile; first line matches /^#!.*\bruby/
"    --[no]rust         .rs
"    --[no]sass         .sass .scss
"    --[no]scala        .scala
"    --[no]scheme       .scm .ss
"    --[no]shell        .sh .bash .csh .tcsh .ksh .zsh .fish; first line matches /^#!.*\b(?:ba|t?c|k|z|fi)?sh\b/
"    --[no]smalltalk    .st
"    --[no]sql          .sql .ctl
"    --[no]tcl          .tcl .itcl .itk
"    --[no]tex          .tex .cls .sty
"    --[no]textile      .textile
"    --[no]tt           .tt .tt2 .ttml
"    --[no]vb           .bas .cls .frm .ctl .vb .resx
"    --[no]verilog      .v .vh .sv
"    --[no]vhdl         .vhd .vhdl
"    --[no]vim          .vim
"    --[no]xml          .xml .dtd .xsl .xslt .ent; first line matches /<[?]xml/
"    --[no]yaml         .yaml .yml

Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-bufferline'
Plugin 'klen/python-mode'

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

"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.
Plugin 'kien/ctrlp.vim'



":NeoCompleteEnable				*:NeoCompleteEnable*
"		Validate neocomplete and initialize it.
"		Warning: Existing cache disappears.
"
":NeoCompleteDisable				*:NeoCompleteDisable*
"		Invalidate neocomplete and clean it up.
"
":NeoCompleteToggle				*:NeoCompleteToggle*
"		Change the lock/unlock state of neocomplete.
"		While neocomplete is in locking, you cannot use automatic
"		completions.
"		Note: This command also enables neocomplete if it is disabled.
"
Plugin 'Shougo/neocomplete.vim'
Plugin 'bling/vim-airline'

"## How to Use nerdtree-ack
"
"1. Open NERDtree
"2. Point to a directory
"3. Press `ms`
"4. Enter search term (e.g. `control\ panel -i`)
"5. Profit!
"
"## Features
"
"1. Doesn't change current open buffers! This feature is what necessitate the use of latest ack.vim
"2. Uses ack.vim syntax:
"    - Use `\ ` to write a space (e.g. `control\ panel`)
"    - Or enclose the term in quotes (e.g. `"control panel"`)
"    - The default behavior is case sensitive. Use `-i` params for case insensitive (e.g. `"control panel" -i`)
"3. Uses ack.vim buffer behavior
"
Plugin 'tyok/nerdtree-ack'
"

" Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


call vundle#end()

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
set hlsearch
set shiftwidth=4 
set incsearch
set ignorecase
set autoindent
set fdm=syntax
set nofoldenable
set tabstop=4

"set guifont=Monaco:h14

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
" configure ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_extensions = ['tag', 'dir']
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_match_window = 'results:100'

" 
"
" configure airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:airline#extensions#default#layout = [
"      \ [ 'a', 'b', 'c' ],
"      \ [ 'x', 'y', 'z', 'warning' ]
"      \ ]
let g:airline#extensions#whitespace#checks = [ ]
let g:airline#extensions#bufferline#enabled = 0


" 
"
" configure vim bufferline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:bufferline_echo = 0
"autocmd VimEnter *
"   \ let &statusline='%{bufferline#refresh_status()}'
"   \ .bufferline#get_status_string()



" 
"
" configure python_mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_lint_checkers = ['pyflakes', 'mccabe'] 



" 
"
" configure syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["py"] }

let g:syntastic_quiet_messages = { "regex" : 'file not found' }
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
let g:indexer_debugLogLevel = 3





" 
"
" configure taglist and nerktree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :TlistToggle<CR>:NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"




" 
"
" configure neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: This option must set it in .vimrc(_vimrc).
" NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3


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
"function! ToggleGUICruft()
"  if &guioptions=='i'
"    exec('set guioptions=imTrL')
"  else
"    exec('set guioptions=im')
"  endif
"endfunction
"
"map <F11> <Esc>:call ToggleGUICruft()<cr>
"
"" by default, hide gui menus
set guioptions=im






