" ------------ Actions outside of this script ---------------
" Preview quickfix results
" Put into ~/.vim/after/ftplugin/qf.vim:
"   nnoremap <buffer> o <CR><C-W>p 
"
" -----------------------------------------------------------

set nocompatible

" Use C-c for Esc.
noremap <C-c> <Esc>

" Change <Leader> to space
let mapleader = "\<Space>"

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

" Next window
noremap <Leader>w <C-w><C-w>

" Open and navigate quickfix results
noremap <Leader>c :cope<CR>
noremap <Leader>n :cn<CR>
noremap <Leader>p :cp<CR>

" Go backwards and forwards in jumplist
"noremap <C-b> <C-o>
"noremap <C-m> <C-i>

" Buffer management
"set switchbuf=usetab,newtab

" Use two semicolons for esc
":imap ;;  <Esc>
":set timeoutlen=300

" Turn line numbering on
set nu

" Turn autoindent on
set ai

" Turn syntax highlighting on
syntax on

" Configure tab behavior
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
"noremap <C-a> :set spell! spell?<CR>
"noremap <C-j> [s
"noremap <C-k> ]s
"noremap <C-x> z=

" Press comma to turn off highlighting and clear any message already displayed.
nnoremap <silent> , :nohlsearch<Bar>:echo<CR>

" Make man page appear in a vim window using :Man command
runtime! ftplugin/man.vim

" Sudo write current file
cmap W w !sudo tee >/dev/null %

" Compile current file
"noremap , :!pdflatex %<CR>

" Open pdf of current file
"noremap \ :!open %<.pdf<CR>

" Show status line at the bottom of the screen
"set ruler
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
noremap <Leader>s :source ~/.vimrc<CR>
noremap <Leader>v :e ~/.vimrc<CR>

" Grep files in quick fix
noremap <Leader>g :vimgrep /

" Make highlighting reverse the text color
hi Visual ctermbg=NONE cterm=reverse
hi Search ctermbg=NONE cterm=reverse
hi SpellBad ctermbg=NONE cterm=reverse
hi MatchParen ctermbg=black cterm=None

" Fix the omni complete menu color
"hi Pmenu ctermbg=black
"hi PmenuSel ctermbg=None cterm=reverse

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

" Make Command-T open file in a new tab by default
"let g:CommandTAcceptSelectionMap = '<CR>'
"let g:CommandTAcceptSelectionTabMap = '<C-t>'
"nnoremap <silent> <Leader>o :CommandT<CR>

" Ignore object and class files when doing file expansion.
set wildignore=*.o,*~,*.class,*.pyc

" Set up file-type dependent indent
filetype indent on


""""""""""""""""""""""""""""""""
" Following required for Vundle (required for YouCompleteMe)
""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-dispatch'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'

"Bundle 'fholgado/minibufexpl.vim'
"
filetype plugin indent on
""""""""""""""""""""""""""""""""
" End Vundle section.
""""""""""""""""""""""""""""""""

"------ YouCompleteMe flags default location for C-family completion via Clang
let g:ycm_global_ycm_extra_conf = '~/object-tracking/src/.ycm_extra_conf.py'

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 1
set completeopt-=preview

" Do not display "Pattern not found" messages during YouCompleteMe completion
" " Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
try
  set shortmess+=c
  catch /E539: Illegal character/
endtry
"------ End YouCompleteMe

"------ Begin vim-dispatch
noremap <Leader>r :Dispatch ant debug && ./install_and_run.sh<CR>
noremap <Leader>d :Dispatch 
"------ End vim-dispatch

"------ Begin QuickFix Enter
let g:qfenter_topen_map = ['<C-t>']
"------ End QuickFix Enter

"------ Begin Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1

noremap <Leader>m :MultipleCursorsFind 

" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
"------ End Multiple Cursors

"------ Begin Unite
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  nmap        <buffer> <ESC>          <Plug>(unite_exit)
  nmap        <buffer> <C-c>          <Plug>(unite_exit)
  nmap        <buffer> t              <Plug>(unite_loop_cursor_down)
  nmap        <buffer> n              <Plug>(unite_loop_cursor_up)
endfunction"}}}

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>o :<C-u>Unite -no-split -start-insert -auto-preview -auto-resize file_rec<CR>
nnoremap <leader>e :<C-u>Unite -no-split -quick-match -auto-resize buffer<CR>

let g:unite_quick_match_table =
      \ get(g:, 'unite_quick_match_table', {
      \     'a' : 0, 'o' : 1, 'e' : 2, 'u' : 3, 'i' : 4, 'd' : 5, 'h' : 6, 't' : 7, 'n' : 8, ';' : 9, '-' : 10,
      \     "'" : 11, ',' : 12, '.' : 13, 'p' : 14, 'y' : 15, 'f' : 16, 'g' : 17, 'c' : 18, 'r' : 19, 'l' : 20,
      \     '1' : 21, '2' : 22, '3' : 23, '4' : 24, '5' : 25, '6' : 26, '7' : 27, '8' : 28, '9' : 29, '0' : 30,
      \ })
"------ End Unite


"------ Epilogue scripts

" Make vp not replace paste buffer, allowing for multiple pastes
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
