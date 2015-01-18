" ***************settings for base vim***************
set ruler
set number
set history=2000
set tabstop=4
set shiftwidth=4
set cmdheight=2
set list listchars=tab:>-
set cmdheight=2
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set showcmd
set autowrite
set encoding=utf8
set ffs=unix,dos,mac
set laststatus=2
set autoindent
set autowriteall
" ***************settings for base vim***************

" ***************settings for brackets complete***************
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i

function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endfunction 
" ***************settings for brackets complete***************


" ***************settings for pathogen***************
execute pathogen#infect()
filetype plugin indent on
" ***************settings for pathogen***************


" ***************settings for NERDTree***************
" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

" show hidden files and dirs
let NERDTreeShowHidden=1

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map a specific key or shortcut to open NERDTree
map <F2> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ***************settings for NERDTree***************


" ***************settings for taglist***************
filetype on
" open the window on the right hand side
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow = 1
"  mapping for the <F3> key to toggle the taglist window
nnoremap <silent> <F3> :TlistToggle<CR>
" ***************settings for taglist***************


" ***************settings for cscope***************
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
" ***************settings for cscope***************
