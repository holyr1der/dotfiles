if match($TERM, "screen")!=-1
  set term=xterm
endif


set backup
set backupdir=~/.backup/vim
set directory=~/.backup/vim

set t_Co=256
set antialias
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" " Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

Plugin 'flazz/vim-colorschemes'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'mileszs/ack.vim'

Plugin 'zanglg/nova.vim'

"Plugin 'dracula/vim'
"
"Plugin 'sosz/vim-darcula-theme'

Plugin 'Valloric/YouCompleteMe'

" Plugin 'sjl/Gundo.vim'

" Plugin 'Shougo/neocomplete.vim'

Plugin 'mbbill/undotree'

Plugin 'airblade/vim-gitgutter'

Plugin 'gregsexton/gitv'

Plugin 'easymotion/vim-easymotion'

Plugin 'yuttie/comfortable-motion.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'dyng/ctrlsf.vim'

Plugin 'Valloric/ListToggle'

Plugin 'tmhedberg/simpylfold'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-surround'

Plugin 'okcompute/vim-python-motions'

Plugin 'tommcdo/vim-fubitive'

Plugin 'ryanoasis/vim-devicons'

Plugin 'chrisbra/unicode.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'tell-k/vim-autopep8'

Plugin 'tpope/vim-abolish'

Plugin 'nvie/vim-flake8'

" Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

let g:comfortable_motion_friction = 50.0
let g:comfortable_motion_air_drag = 2.0

set nocompatible              " Don't be compatible with vi
set hidden
nnoremap \ ;
let mapleader=","             " change the leader to be a comma vs slash
let mapleader=";"             " change the leader to be a semicolon vs comma
"set re=1                      " Use old regex engine (new one is slow on ruby files)

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" sudo write this
cmap W! w !sudo tee % >/dev/null
cmap Wa wa

" Abbreviations
iabbrev pdb import ipdb; ipdb.set_trace()
iabbrev cnx from context import Context<CR>Context('dev', 1, 'advertiser').api.advertiser.<ESC>5b
iabbrev pp from pprint import pprint as pp; pp

" Toggle the tasklist
" map <leader>td <Plug>TaskList

" Run pep8
let g:pep8_map='<leader>8'

" run py.test's
" nmap <silent><Leader>tf <Esc>:Pytest file<CR>
" nmap <silent><Leader>tc <Esc>:Pytest class<CR>
" nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" nmap <silent><Leader>tn <Esc>:Pytest next<CR>
" nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
" nmap <silent><Leader>te <Esc>:Pytest error<CR>

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" turn on spell check
" nmap <F8> :setlocal spell spelllang=en<CR>

" ∆ = Alt-j
nnoremap ∆ :MultipleCursorsFind <C-r>/<CR>
vnoremap ∆ :MultipleCursorsFind <C-r>/<CR>

" copy whole file to system clipboard
nmap <F10> gg"+yG

" don't let cursor jump when yanking
vnoremap <expr>y "my\"" . v:register . "y`y"

" open/close the quickfix window
" let g:lt_location_list_toggle_map = '<leader>C'
let g:lt_quickfix_list_toggle_map = '<leader>c'
nmap <leader>C :pc!

"nmap <leader>c :copen<CR>
"nmap <leader>C :cclose<CR>
nmap ]q :cnext<CR>
nmap [q :cprevious<CR>
nmap ]Q :clast<CR>
nmap [Q :cfirst<CR>

" delete the current buffer without closing the split
nnoremap <leader>d :bp\|bd #<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" map jj to escape in insert mode
inoremap jj <Esc>

" use shif+arrow keys to scroll lines
" map [a <C-Y>
" map [b <C-E>

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in " command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Run Ctrl-P file search
map <leader>f :CtrlP<CR>
map <leader>F :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Git grep with fugitive
nmap <leader>a <Esc>:Ggrep <cword><CR>
"
" open the fugitive commit window
nmap <leader>C :Gcommit<CR>

" Ack searching
nmap <leader>A <Esc>:Ack!<CR>

" Load the Gundo window
nnoremap <F5> :UndotreeToggle<CR>

" Goto definition
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python to use for ycm
let g:ycm_python_binary_path = 'python'

" Jump to the definition of whatever the cursor is on
" map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
" map <leader>r :RopeRename<CR>

" Comment/Uncomment a block of lines in Python
vnoremap <silent> # :s/^/#/<CR>:noh<CR>
vnoremap <silent> -# :s/^#//<CR>:noh<CR>

" map <F9> :TagbarToggle<CR>
nmap <F9> :setlocal spell spelllang=en<CR>

let g:tagbar_left=1
let g:tagbar_autoclose=0

let g:Gitv_OpenHorizontal = 1
let g:Gitv_DoNotMapCtrlKey = 1
let g:Gitv_TruncateCommitSubjects = 1

nmap <F6> :GitGutterLineHighlightsToggle<CR>
map <F7> :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Plugins in the following list wont be loaded
filetype off

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set updatetime=2500
set ttimeoutlen=0
set clipboard=unnamed         " yank into system clipboard

" don't bell or blink
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"set noerrorbells
"set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set grepprg=ack-grep          " replace the default grep program with ack

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=10             " Keep a small completion window

" show a line at column 101
if exists("&colorcolumn")
    set colorcolumn=101
endif

""" Moving Around/Editing
set nocursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=5             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # X#

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set autoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l/%L,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set statusline +=%=%b\ (0x%04B)\ %*          "character under cursor
set noshowmode
set linespace=1

"set statusline=%<%1*===\ %5*%f%1*%(\ ===\ %4*%h%1*%)%(\ ===\ %4*%m%1*%)%(\ ===\ %4*%r%1*%)\ ===%====\ %2*%b(0x%B)%1*\ ===\ %3*%l,%c%V%1*\ ===\ %5*%P%1*\ ===%0* laststatus=2

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:\|\ ,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
let g:solarized_termcolors=16
let g:solarized_termtrans=1

" iTerm2 cursors
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if has("gui_running")
    colorscheme solarized
else
    colorscheme solarized
endif

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

hi Visual cterm=bold ctermbg=9 ctermfg=15
"
" hi EasyMotionTarget ctermbg=none ctermfg=green
" hi EasyMotionShade  ctermbg=none ctermfg=blue
"
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=lightyellow
"
" hi EasyMotionMoveHL ctermbg=green ctermfg=black
" hi EasyMotionIncSearch ctermbg=green ctermfg=black
"
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"let g:powerline_config_path="/home/zeus/.config/powerline/config_files/"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_theme = 'solarized'

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"let g:CommandTAcceptSelectionSplitMap = '<C-t>'
"let g:CommandTAcceptSelectionTabMap = '<C-s>'

"set guifont=PragmataPro\ for\ Powerline\ 10.5
"set guifont=Cousine\ for\ Powerline:h14
set guifont=Pragmata\ Pro\ Mono\ Regular\ Nerd\ Font:h16

set nocursorline

" Strip off everything from gui
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=lrbmTLce
set guioptions+=c

" Paste/Yank from/to clipboard
map <leader>p "+gP
" map Y "+y

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :keepjumps keeppatterns %s/\s\+$//e<CR>

" Put the current word in command and replace it
nnoremap <leader>s :%s/<C-r><C-w>/

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

"nnoremap <leader><leader>l <Plug>(easymotion-bd-jk)
nmap <leader>w <Plug>(easymotion-bd-w)
nmap <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>j <Plug>(easymotion-sol-j)
nmap <leader>k <Plug>(easymotion-sol-k)
nmap <leader>L <Plug>(easymotion-jumptoanywhere)

" nmap <leader>R <Plug>CtrlSF
nmap <leader>R <Plug>CtrlSFCwordPath<CR>

" Select the item in the list with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Don't allow snipmate to take over tab
autocmd VimEnter * ino <c-j> <c-r>=TriggerSnippet()<cr>
" Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
let g:acp_completeoptPreview=1

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType python setlocal indentkeys-=<:>
au FileType python setlocal indentkeys-=:
au FileType python setlocal cinkeys-=<:>
au FileType python setlocal cinkeys-=:
au FileType python map <buffer> <F8> :call Flake8()<CR>
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

au! BufWinLeave *.* mkview
au! BufWinEnter *.* silent loadview

func! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

" Treat *.tpp files as C++
au BufNewFile,BufRead *.tpp set filetype=c++

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(src, cmd)
  let fname = Chomp(system(a:src . " | /usr/bin/dmenu -i -l 20 -nb '#202020' -nf white -sb blue -sf white  -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

"map <leader>f :call DmenuOpen("git ls-files", "e")<cr>
"map <leader>F :call DmenuOpen("find . \\( ! -path '*/.*' \\) ", "e")<cr>

autocmd FileType qf wincmd J

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
command! -nargs=* Make make <args>

"" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUALENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
"
"" Load up virtualenv's vimrc if it exists
"if filereadable($VIRTUAL_ENV . '/.vimrc')
"    source $VIRTUAL_ENV/.vimrc
"endif
