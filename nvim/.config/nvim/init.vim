" #########################
" PLUGINS
" #########################

call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mhinz/vim-startify'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()


colorscheme gruvbox


" TODO
" toggle nowrap hotkey



let mapleader = " " " map leader to Space
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>ss <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

" search commands 
nnoremap <leader>sc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>sk <cmd>lua require('telescope.builtin').keymaps()<cr>

" save file
nnoremap <leader>fs <cmd>:w<cr>
nnoremap <leader>bk <cmd>:q<cr>
" toggle previous buffer
nnoremap <leader><tab> <c-^> 

" window contols
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

" run nerdtree
nnoremap <leader>ft <cmd>:NERDTree<cr>
