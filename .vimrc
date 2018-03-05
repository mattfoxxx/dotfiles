

"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"   You are about to experience a potent dosage of Vim. Watch your steps.
"
"                ╔══════════════════════════════════════════╗
"                ║           ⎋ HERE BE VIMPIRES ⎋           ║
"                ╚══════════════════════════════════════════╝
set shell=/bin/zsh "Sets the shell  
set nocompatible "Use the vim settings, not vi
filetype off " required by vundle
if ! executable( 'git' )
    echohl ErrorMsg | echomsg 'Git is not available.' | echohl None
else
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " Initial setup for vundle
    " $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'Yggdroot/indentLine.git'
    Plugin 'scrooloose/nerdtree.git'
    Plugin 'vim-airline/vim-airline.git'
    Plugin 'vim-airline/vim-airline-themes.git'
    Plugin 'bling/vim-bufferline.git'
    Plugin 'ryanoasis/vim-devicons.git'
    Plugin 'tpope/vim-fugitive.git'
    Plugin 'tpope/vim-markdown.git'
    Plugin 'airblade/vim-gitgutter.git'
    Plugin 'severin-lemaignan/vim-minimap.git'
    Plugin 'powerline/fonts.git'
    Plugin 'shime/vim-livedown.git'
    Plugin 'saltstack/salt-vim.git'
	Plugin 'micha/vim-colors-solarized'
    Plugin 'sickill/vim-monokai'
    Plugin 'ctrlpvim/ctrlp.vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
endif

filetype plugin on "Enables the recognition files 
filetype indent on
set magic "Enable regular expressions

"Formating
set autoindent          " automatically indent lines
"set copyindent          " copy indent from previous line
set expandtab           " use spaces to indent
set shiftwidth=4        " number of spaces for indent
set smarttab            " backspace over tabs
set softtabstop=4       " tab = softtabstop * spaces
set tabstop=4           " tab stop distance
set shiftround          " be clever with tabs

"Visual
set background=dark     " we're using a dark bg
" :silent! colorscheme monokai    " colorscheme from plugin
syntax on   "  Syntax highlighting
let g:solarized_termcolors=256
:silent! colorscheme solarized    " colorscheme from plugin
set laststatus=2        " always show statusline
set ruler   "Ruler breaks
set wrap    "It allows navigation within a long line with j and k
set showcmd " Show me what I'm typing
set hlsearch " Highlight found searches
set lazyredraw
set splitbelow " Split horizontal windows below to the current windows
set splitright " Split vertical windows right to the current windows
set fileformat=unix " Prefer Unix format
set t_Co=256 " Enable 256 colors
set nolinebreak
set number  "Show line numbers
set relativenumber
set updatetime=250 
set cursorline
set showmode  " Show current mode.
set whichwrap=b,s,<,>,[,]
set title " Show title 
set showtabline=2
set fillchars+=stl:\ ,stlnc:\
set cmdheight=2 "Height command bar
hi TabLineFill ctermfg=White ctermbg=Yellow
hi TabLine ctermfg=Blue ctermbg=Yellow

"Visual Gui
" set guifont=DroidSansMonoPLNerd:h12 
" set guioptions-=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

"Encoding
" Set default encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"File handling
set autoread " Automatically reread changed files without asking me anything
set history=50 
set noswapfile " Don't use swapfile

" Use modeline overrides
set modeline
set modelines=10

"Handling
set backspace=indent,eol,start "Makes backspace key more powerful.
set clipboard=unnamedplus "Clipboard system
set foldignore=" "
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker
set ignorecase " Search case insensitive...
set smartcase
set incsearch " Shows the match while typing
set nobackup " Don't create annoying backup files
set nowritebackup
set startofline "It allows you to change the column when moving through the line
set sm "Every time you close a parenthesis, bracket or brace, Vi shows where it was opened. If there is no  pair.

"Spell pt_BR 
"set spell spelllang=pt 

"hi SpellCap ctermfg=Gray ctermbg=Blue
"hi SpellBad ctermfg=Gray ctermbg=DarkRed 

let mapleader = ","  
let g:mapleader = "," 

"Shortcuts
nmap <C-t> :tabnew<CR> 
nmap <C-PageUp> :tabnext<CR>   
nmap <C-PageDown> :tabprevious<CR> 
nmap <C-x> :tabclose<CR> 
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  
nmap <silent> <C-C> :silent noh<CR> 
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
"inoremap <C-d> <esc>:wq!<cr>               " save and exit
"nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>

"Completion
 set wildmode=list:longest
 set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
 set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
 set wildignore+=*vim/backups*
 set wildignore+=*sass-cache*
 set wildignore+=*DS_Store*
 set wildignore+=vendor/rails/**
 set wildignore+=vendor/cache/**
 set wildignore+=*.gem
 set wildignore+=log/**
 set wildignore+=tmp/**
 set wildignore+=*.png,*.jpg,*.gif
 
"Scrolling 
"Start scrolling when we're 8 lines away from  margins
 set scrolloff=8         
 set sidescrolloff=15
 set sidescroll=1

" Plugins

" Pathogen
runtime! autoload/pathogen.vim
if exists("*pathogen#infect")
    call pathogen#infect()
endif

" NerdTree {
          if isdirectory(expand("~/.vim/bundle/nerdtree"))
              map <C-e> :NERDTreeToggle<CR>
              map <leader>e :NERDTreeFind<CR>
              nmap <leader>nt :NERDTreeFind<CR>


              let NERDTreeShowBookmarks=1
              let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$','^\.svn$', '\.bzr$']
              let NERDTreeChDirMode=0
              let NERDTreeQuitOnOpen=1
              let NERDTreeMouseMode=2
              let NERDTreeShowHidden=1
              let NERDTreeKeepTreeInNewTab=1
              let g:nerdtree_tabs_open_on_gui_startup=0
          endif
      " }

                                    
"Vim-airline
let g:airline_theme = 'minimalist'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"Vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
endif


" Settings for jedi-vim
 let g:jedi#usages_command = "<leader>z"
 let g:jedi#popup_on_dot = 0
 let g:jedi#popup_select_first = 0
 map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
 set completeopt=longest,menuone
 function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
 endfunction

 inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
 inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Settings for python-mode
 map <Leader>g :call RopeGotoDefinition()<CR>
 let ropevim_enable_shortcuts = 1
 let g:pymode_rope_goto_def_newwin = "vnew"
 let g:pymode_rope_extended_complete = 1
 let g:pymode_breakpoint = 0
 let g:pymode_syntax = 1
 let g:pymode_syntax_builtin_objs = 0
 let g:pymode_syntax_builtin_funcs = 0
 map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Minimap 
let g:minimap_highlight='Visual'
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'

" Vim-gitgutter
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=237
" let g:gitgutter_sign_column_always = 1
set signcolumn=yes
let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

" vim-livedown
nmap gm :LivedownToggle<CR>

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 11337

" the system command to launch a browser (ex. on linux)
let g:livedown_browser = "firefox"
"let g:livedown_browser = "open /Applications/Firefox.app"

" nnoremap [1;5D B
" nnoremap [1;5C W
" set t_Co=256
" set term=xterm-256color
