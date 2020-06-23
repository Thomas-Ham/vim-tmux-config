" Show line numbers
 set number
    
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F3> key to toggle paste mode on/off.
nnoremap <F3> :set invpaste paste?<CR>
imap <F3> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F3>

set showcmd

" Displays file path
:set laststatus=2 
:set statusline+=%F

" Tab key indents 4 space characters 
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" allow mouse stuff when in vim
set ttymouse=xterm2
set mouse=a

" make vim uses the normal clipboard by default instead of the internal vim one (need to be on vimx)
" need to fiddle with clipboard stuff on vnc too
set clipboard=unnamedplus


" plugin manager
execute pathogen#infect()
syntax on
filetype plugin indent on

" Set colour scheme
colorscheme dracula

" change some of the syntax highlighting
" Type eg double, bool, etc
highlight Type ctermfg=Cyan 
highlight cppSTLtype ctermfg=Cyan
highlight cStorageClass ctermfg=Cyan
highlight Comment ctermfg=Blue
highlight LineNr ctermfg=Blue
highlight cppSTLios ctermfg=141


" set drop down menu selector colour
highlight PmenuSel ctermbg=green

"Enable Additional highlighting 
"Enhance higlighting script is in ~/.vim/after/syntax
"https://github.com/octol/vim-cpp-enhanced-highlight

"Enable highlighting of class scope
let g:cpp_class_scope_highlight = 1

