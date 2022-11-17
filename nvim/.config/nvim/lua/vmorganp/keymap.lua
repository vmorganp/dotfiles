local builtin = require('telescope.builtin')

-- super basics
vim.keymap.set('n', '<leader>qq', '<cmd>:q<CR>', {desc="quit vim"})
vim.keymap.set('n', '<leader>fs', '<cmd>:w<CR>', {desc="file save"})
vim.keymap.set('n', '<leader>cs', '<cmd>:source %<CR>', {desc="source the current file"})


-- buffers
vim.keymap.set('n', '<leader>bk', '<cmd>:q<CR>', {desc="buffer kill"})
vim.keymap.set('n', '<leader>bn', '<cmd>:bnext<CR>', {desc="buffer next"})
vim.keymap.set('n', '<leader>bl', '<cmd>:bprev<CR>', {desc="buffer last"})


-- telescope stuffs
vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc="search files"})
vim.keymap.set('n', '<leader>sc', builtin.commands, {desc="search commands"})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, {desc="search keymaps"})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {desc="search buffers"})
vim.keymap.set('n', '<leader>sp', builtin.quickfix, {desc="search problems"})
vim.keymap.set('n', '<leader>sh', builtin.current_buffer_fuzzy_find, {desc="search here (cur buf)"})
vim.keymap.set('n', '<leader>sd', builtin.help_tags, {desc="search help documents"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc="search dir"})
vim.keymap.set('n', '<leader>sm', builtin.marks, {desc="search marks"})
vim.keymap.set('n', '<leader>st', '<cmd>:tabs<CR>', {desc="search tabs"})

-- window management
vim.keymap.set('n', '<leader>wj', '<C-w>j', {desc="window down"})
vim.keymap.set('n', '<leader>wk', '<C-w>k', {desc="window up"})
vim.keymap.set('n', '<leader>wl', '<C-w>l', {desc="window right"})
vim.keymap.set('n', '<leader>wh', '<C-w>h', {desc="window left"})
vim.keymap.set('n', '<leader>wm', '<cmd>:only<CR>', {desc="window maximize"})


-- various plugins
--    fugitive
vim.keymap.set('n', '<leader>gg', '<cmd>:Git<CR>', {desc="git"})
--    nerdtree
vim.keymap.set('n', '<leader>ot', '<cmd>:NvimTreeToggle<CR>', {desc="file tree"})


-- toggles
vim.keymap.set('n', '<leader>Tw', '<cmd>:set number!<CR>', {desc="toggle word wrap"})
vim.keymap.set('n', '<leader>Tn', '<cmd>:set wrap!<CR>', {desc="toggle line numbers"})


-- tabs
vim.keymap.set('n', '<leader>tc', '<cmd>:tabnew<CR>', {desc="create tab"})
vim.keymap.set('n', '<leader>td', '<cmd>:tabclose<CR>', {desc="close tab"})
vim.keymap.set('n', '<leader>tl', '<cmd>:tabprevious<CR>', {desc="tab last"})
vim.keymap.set('n', '<leader>tn', '<cmd>:tabnext<CR>', {desc="tab next"})
