" Show line numbers
set number

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F3> key to toggle paste mode on/off.
nnoremap <F3> :set invpaste paste?<CR>
imap <F3> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F3>

" show last command entered 
set showcmd

" Displays file path
:set laststatus=2 
:set statusline+=%F

" Tab key indents 2 space characters 
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
 
" ignore case if search pattern is all lowercase, case sensitive otherwise 
set smartcase 

" don't wrap lines
" set nowrap 

" show cursor line
set cursorline

" auto complete menu
set wildmenu

" incrementally highlight when searching
set incsearch

" new splits are to the right/below 
set splitbelow
set splitright

" fold blocks based on indent i.e. collapse functions
set foldmethod=indent

" all folds initially open
set foldlevelstart=99

" save indentation when closing files
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" allow mouse stuff when in vim
set ttymouse=xterm2
set mouse=a

" make vim uses the normal clipboard by default instead of the internal vim one (need to be on vimx)
" need to fiddle with clipboard stuff on vnc too
set clipboard=unnamedplus

" fzf -'fuzzy' search
set rtp+=~/.fzf

" Git Gutter - shows lines you've edited etc
" set how quickly the diff marker updates (ms)
set updatetime=100
" Always show the sign columns - is kinda annoying when the columns appears/disappears
sign define dummy
execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
"set signcolumn=number

" plugin manager
" pathogen runs stuff in .vim/bundle
execute pathogen#infect() 
syntax on
filetype plugin indent on


" can turn off individual plugins with e.g.
" set runtimepath-=~/.vim/bundle/vim-airline

" auto load NERDtree
"autocmd vimenter * NERDTree

" Tab line settings
hi TabLineFill ctermfg=60 
hi TabLine cterm=None ctermfg=Red ctermbg=60
hi TabLineSel ctermfg=40 ctermbg=60
" Always show tabline (even if only one file is open)
set showtabline=2 


" Set colour scheme
" See here for Dracula install instructions https://draculatheme.com/vim
colorscheme dracula

" Override some colour stuff from the colour scheme (hence it comes after the
" we set the color scheme)
" See here for list of colours (https://jonasjacek.github.io/colors/)
" May see some weirdness with colour names e.g. "black" doesn't look black

" Additional syntax highlighting is enabled by adding script from https://github.com/octol/vim-cpp-enhanced-highlight
" Enhance higlighting script is in ~/.vim/after/syntax

" Indent guide settings
let g:indent_guides_enable_on_vim_startup = 0                                   
let g:indent_guides_auto_colors = 0                                             
let g:indent_guides_guide_size = 1 
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"Enable highlighting of class scope
let g:cpp_class_scope_highlight = 2

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

" Change the background foreground colours of the folded line
hi Folded ctermfg=DarkRed
hi Folded ctermbg=Black

" Change CursorLine colour and make text bold
highlight CursorLine ctermbg=237 cterm=bold    

" Set background color (see here for color list)
highlight Normal ctermbg=234 



" lightline.vim and lightline-bufferline.vim
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" Number the buffers (same as :ls)
let g:lightline#bufferline#show_number = 1

" Show unicode symbol if file is edited/read only
let g:lightline#bufferline#unicode_symbols = 1
