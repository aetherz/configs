" Dvorak Movement Keys. g means go by screen (not physical) line
noremap h h
noremap t gj
noremap n gk
noremap s l

" Top and bottom of window
noremap _ H
noremap - L

" Page down and page up
"noremap T <C-f>
"noremap N <C-b>

" Half page down and half page up
noremap T <C-d>
noremap N <C-u>

" C-t to scroll down a line, C-n to scroll up a line
"noremap <C-t> <C-e>
"noremap <C-n> <C-y>

" Fix j, k, n, and s displaced by movement keys
noremap l s
noremap L S
noremap j n
noremap k N

" Set ENTER to insert newline in command mode
"noremap <CR> i<CR><Esc>

" Easy access to begin and end. g means go by screen (not physical) line 
noremap H g^
noremap S g$

" CTRL-T for descend into tag, CTRL-N for ascend from tag
noremap <C-n> <C-t>
noremap <C-t> <C-]>

" Set max number of open tabs to 50
set tabpagemax=50

" Changing tabs
noremap <C-h> gT
noremap <C-s> gt

" Buffer management
set switchbuf=usetab,newtab

" Use two semicolons for esc
":imap ;;  <Esc>
":set timeoutlen=300

" Turn line numbering on
set nu

" Turn autoindent on
set ai

" Set up file-type dependent indent
filetype indent on

" Turn syntax highlighting on
syntax on

" Configure tab behavior
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Search tweaks
set incsearch
set ignorecase
set smartcase
set hlsearch

" Fix file completion
set wildmenu
set wildmode=longest:full

" Allow the mouse to move cursor
" set mouse=a


" Enable visual word wrap (no EOLs inserted into actual file)
set linebreak

" Swap ; and :  Convenient.
noremap : ;
noremap ; :

" Press F3 to toggle automatic word wrapping
"noremap <F3> :set wm=2<CR>

" Press F4 to toggle highlighting on/off, and show current value.
"noremap <F4> :set hlsearch! hlsearch?<CR>

" Map CTRL-A to toggle spell checking
noremap <C-a> :set spell! spell?<CR>
noremap <C-j> [s
noremap <C-k> ]s
noremap <C-b> z=

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Make man page appear in a vim window using :Man command
runtime! ftplugin/man.vim

" Compile current file
noremap , :!pdflatex %<CR>

" Open pdf of current file
noremap \ :!open %<.pdf<CR>

" Show status line at the bottom of the screen
set ruler
set rulerformat=%50(%=%n\:%f%m%r%w\ %l,%c%V\ %P%)

" Correct vimdiff color scheme when using dark background
if &diff
  hi DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
  hi DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
  hi DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
  hi DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
endif

" Map F1 to toggle paste mode
noremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F1>
set showmode

" Make it easy to edit and source vimrc using F2 and F3
noremap F2 :source ~/.vimrc<CR>
noremap F3 :e ~/.vimrc<CR>

" Make highlighting reverse the text color
hi Visual ctermbg=NONE cterm=reverse
hi Search ctermbg=NONE cterm=reverse
hi SpellBad ctermbg=NONE cterm=reverse
hi MatchParen ctermbg=black cterm=None

" Fix the omni complete menu color
hi Pmenu ctermbg=black
hi PmenuSel ctermbg=None cterm=reverse

" Show the command that you're currently typing
" set showcmd

" Set title
set title

" Remap keys in NerdTree
let g:NERDTreeMapOpenInTab='e'
let g:NERDTreeMapOpenInTabSilent='E'
let g:NERDTreeMapOpenExpl='~'

let g:NERDTreeDirArrows=0
let g:NERDTreeMinimalUI=1
