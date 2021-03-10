syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ruler
set wildmenu
set wildmode=longest:full,full
set whichwrap+=<,>,h,l,[,]
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" Functional stuff
Plug 'tpope/vim-fugitive' "fancy git stuff
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'tell-k/vim-autopep8', { 'for': 'python' }
Plug 'jremmen/vim-ripgrep'
Plug 'hashivim/vim-terraform'

" Aesthetics
Plug 'morhetz/gruvbox' " gruvbox
Plug 'vim-airline/vim-airline' " airline
call plug#end()
let g:airline_theme='gruvbox'
set background=dark
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

""""""""""""""
" HOTKEYS 
""""""""""""""
:map // :BLines<CR>
:map cc :Commands<CR>

let mapleader = "\<Space>"
" files
nmap <leader>f :Files <CR>
" Explorer
nmap <leader>e :call ToggleNERDTree()<CR>  
" split
noremap <leader>s :vsp<CR>
nnoremap <leader>d <C-W><C-L><CR>
nnoremap <leader>a <C-W><C-H><CR>
" makme leader number switch to corresponding tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

let NERDTreeMapOpenInTab='<ENTER>'
command! WQ wq
command! Wq wq
command! W w
command! Q q

" make python do its thing
autocmd FileType python setlocal omnifunc=jedi#completions

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

" terraform stuff
let g:terraform_align=1
let g:terraform_fmt_on_save=1


" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]
