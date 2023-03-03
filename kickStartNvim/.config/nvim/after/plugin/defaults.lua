vim.opt.relativenumber = false
vim.opt.tabstop = 4 -- tab = 4 spaces
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- always use spaces instead of tabs
vim.opt.showtabline = 2 -- always show the tab line
vim.opt.cursorline = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- basics
-- vim.keymap.set('n', '<leader>qq', '<cmd>:q<CR>', {desc="quit vim"})
vim.keymap.set('n', '<leader>fs', '<cmd>:w<CR>', { desc = "file save" })

-- telescope stuffs
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = "search keymaps" })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = "search buffers" })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').quickfix, { desc = "search problems" })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').current_buffer_fuzzy_find, {desc="search here (cur buf)"})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = "search help documents" })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = "search dir" })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = "search marks" })
vim.keymap.set('n', '<leader>st', '<cmd>:tabs<CR>', { desc = "search tabs" })

-- toggles
vim.keymap.set('n', '<leader>Tw', '<cmd>:set wrap!<CR>', { desc = "toggle word wrap" })
vim.keymap.set('n', '<leader>Tn', '<cmd>:set number!<CR>', { desc = "toggle line numbers" })

-- tabs
vim.keymap.set('n', '<leader>tc', '<cmd>:tabnew<CR>', { desc = "create tab" })
vim.keymap.set('n', '<leader>td', '<cmd>:tabclose<CR>', { desc = "close tab" })
vim.keymap.set('n', '<leader>tm', '<cmd>:tabprevious<CR>', { desc = "tab left" })
vim.keymap.set('n', '<leader>ti', '<cmd>:tabnext<CR>', { desc = "tab next" })

-- windows
vim.keymap.set('n', '<leader>wn', '<C-w>j', { desc = "window down" })
vim.keymap.set('n', '<leader>we', '<C-w>k', { desc = "window up" })
vim.keymap.set('n', '<leader>wi', '<C-w>l', { desc = "window right" })
vim.keymap.set('n', '<leader>wm', '<C-w>h', { desc = "window left" })
vim.keymap.set('n', '<leader>wM', '<cmd>:only<CR>', { desc = "window maximize" })

-- buffers
vim.keymap.set('n', '<leader>bk', '<cmd>:q<CR>', { desc = "buffer kill" })
vim.keymap.set('n', '<leader>bn', '<cmd>:bnext<CR>', { desc = "buffer next" })
vim.keymap.set('n', '<leader>bl', '<cmd>:bprev<CR>', { desc = "buffer last" })

-- binds
vim.keymap.set('n', '<leader>gg', '<cmd>:Git<CR>', { desc = "git" })
vim.keymap.set('n', '<leader>ot', '<cmd>:NvimTreeToggle<CR>', { desc = "Toggle File Tree" })
