" ***************usage for ctags and cscope***************
" #: cscope usage
" #: 1. enter src dir
" #: 2. cscope -Rb
" #: 3. vi
"
" #: ctags usage
" #: 1. enter src dir
" #: 2. ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .
" #: 3. vi
" #: 4. Ctrl＋]
" #: 5. Ctrl＋T
" ***************usage for ctags and cscope***************


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
set autoread
set autoindent
set autowriteall

" highlight current line and column
set cursorline
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white

" set color scheme
" /usr/share/vim/vim74/colors
"colorscheme blue

" ***************settings for base vim***************

" ***************settings for brackets complete***************
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR> " commented for echofunc
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

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
let NERDTreeIgnore=['\.o$', '\.swp$', '\.git', '\.svn']

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
let Tlist_Show_One_File = 1
"  mapping for the <F3> key to toggle the taglist window
nnoremap <silent> <F3> :TlistToggle<CR>

" auto flush taglist
map <F4> :TlistUpdate<CR>
autocmd BufWritePost *.c,*.h,*.cpp call UpdateCtags()
autocmd FileWritePost *.c,*.h,*.cpp call UpdateCtags()

function! UpdateCtags()
     TlistUpdate
endfunction
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

" ***************settings for OmniCppComplete***************
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" build tags of your own project with Ctrl-F12
map <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" ***************settings for OmniCppComplete***************
