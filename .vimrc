" ***************usage for ctags and cscope***************
" #: cscope usage
" #: 1. enter src dir
" #: 2. cscope -Rb
" #: 3. vi
" #: 4. cs help
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

    set csto=0
    set cscopetag
    set cscopequickfix=s-,c-,d-,i-,t-,e-

    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
   
    set cscopeverbose
    
    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help
   
    """"""""""""" My cscope/vim key mappings
    "
    " cscope commands:
    " add  : Add a new database             (Usage: add file|dir [pre-path] [flags])
    " find : Query for a pattern            (Usage: find c|d|e|f|g|i|s|t name)
    "     c: Find functions calling this function
    "     d: Find functions called by this function
    "     e: Find this egrep pattern
    "     f: Find this file
    "     g: Find this definition
    "     i: Find files #including this file
    "     s: Find this C symbol
    "     t: Find this text string
    "     help : Show this message              (Usage: help)
    "     kill : Kill a connection              (Usage: kill #)
    "     reset: Reinit all connections         (Usage: reset)
    "     show : Show connections               (Usage: show)
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    
    map <F4> :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
    map <F12>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR>
    map <F12>g :cs find g <C-R>=expand("<cword>")<CR><CR>:cw<CR>
    map <F12>c :cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR>
    map <F12>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR>
    map <F12>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR>
    map <F12>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:cw<CR>
    map <F12>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:cw<CR>
    map <F12>d :cs find d <C-R>=expand("<cword>")<CR><CR>:cw<CR>
   
    map <F6> :cclose<CR>
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
" build tags of your own project with F5
map <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . && cscope -Rb<CR>
" generate local usr include
set tags+=~/.vim/ctags-list/usr-include
" ***************settings for OmniCppComplete***************
