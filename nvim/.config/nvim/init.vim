" #########################
" PLUGINS
" #########################
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'mhinz/vim-startify'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/neovim/nvim-lspconfig'


Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'liuchengxu/vim-which-key'

" lsp goodness
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

" Plug 'valloric/youcompleteme'

call plug#end()
lua<<EOF
require("nvim-lsp-installer").setup({automatic_installation = true})
require'lspconfig'.pyright.setup{}
local lspconfig = require('lspconfig')
EOF

colorscheme gruvbox

nnoremap dd "_dd
let mapleader = " " " map leader to Space

" save file
nnoremap <leader>fs <cmd>:w<cr>
" toggle previous buffer
nnoremap <leader><tab> <c-^>
nnoremap <leader>gg <cmd>Git<cr>

" nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore=[".DS_Store", ".git$"]

" Which key stuff
let g:which_key_map =  {}

" buffers
let g:which_key_map.b = {
      \ 'name' : '+buffers' ,
      \ '1' : ['b1'        , 'buffer 1']         ,
      \ 'd' : ['bd'        , 'delete-buffer']    ,
      \ 'k' : ['bd'        , 'delete-buffer']    ,
      \ 'f' : ['bfirst'    , 'first-buffer']     ,
      \ 'h' : ['Startify'  , 'home-buffer']      ,
      \ 'l' : ['blast'     , 'last-buffer']      ,
      \ 'n' : ['bnext'     , 'next-buffer']      ,
      \ 'N' : [':new'     , 'new buffer']      ,
      \ 'p' : ['bprevious' , 'previous-buffer']  ,
      \ 's' : [':Telescope buffers', 'find buffers'],
      \ }

" searching
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'f' : [':Telescope find_files',                'find files'],
      \ 'g' : [':Telescope live_grep',                 'search current dir'],
      \ 'b' : [':Telescope buffers',                   'find buffers'],
      \ 'h' : [':Telescope help_tags',                 'find help tags'],
      \ 's' : [':Telescope current_buffer_fuzzy_find', 'search current buffer'],
      \ 'k' : [':Telescope keymaps',                   'search keymaps'],
      \ 'c' : [':Telescope commands',                  'search commands'],
      \ }

" Toggles
let g:which_key_map.T = {
      \ 'name' : '+toggles' ,
      \ 'l' : [':set number!', 'line numbers'],
      \ 'w' : [':set wrap!',   'word wrap'],
      \ }


" tabs
let g:which_key_map.t = {
      \ 'name' : '+tabs' ,
      \ 'n' : [':tabnew',      'new tab'],
      \ 'd' : [':tabclose',    'close tab'],
      \ 'h' : [':tabprevious', 'left tab'],
      \ 'l' : [':tabnext',     'right tab'],
      \ }


" open
let g:which_key_map.o = {
      \ 'name' : '+open' ,
      \ 't' : [':NERDTreeToggle'        , 'Nerdtree']         ,
      \ 'w' : [':set wrap!'        , 'Toggle Word Wrap']         ,
      \ }

" windows
" new split hjkl
" close window wd
let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ 'h' : ['<C-w>h'        , 'window left'],
      \ 'j' : ['<C-w>j'        , 'window down'],
      \ 'k' : ['<C-w>k'        , 'window up'],
      \ 'l' : ['<C-w>l'        , 'window right'],
      \ 'm' : ['<C-w>_<C-w>|'  , 'maximize window'],
      \ 'd' : ['<C-w>_<C-w>|'  , 'delete window'],
      \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

" TODO
" lsp

