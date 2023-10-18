vim.o.relativenumber = false
vim.o.tabstop = 4 -- tab = 4 spaces
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true -- always use spaces instead of tabs
vim.o.showtabline = 1  -- always show the tab line
vim.o.cursorline = true

vim.o.foldmethod = "indent"
vim.o.foldenable = true
vim.o.foldlevelstart = 99
-- vim.o.foldcolumn = '1'

vim.o.showmatch = true -- bracket matching
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.smartindent = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.title = true         -- window titles
vim.o.showtabline = 2      -- always show the tab bar
vim.o.scrolloff = 10       -- keep n lines above and below the cursor
vim.o.sidescrolloff = 10   -- keep n lines right and left of the cursor
vim.o.signcolumn = "yes:1" -- the "git gutter"
vim.o.mouse = "a"

vim.o.list = true


-- basics
-- vim.keymap.set('n', '<leader>qq', '<cmd>:q<CR>', {desc="quit vim"})
vim.keymap.set('n', '<leader>fs', '<cmd>:w<CR>', { desc = "file save" })
vim.keymap.set('n', '<leader>ff', '<cmd>:Format<CR>', { desc = "file format" })
vim.keymap.set('n', '<leader>qq', '<cmd>:conf qa<CR>', { desc = "quit all" })


-- git
vim.keymap.set('n', '<leader>gp', '<cmd>:Git push origin HEAD<CR>', { desc = "Git push head" })

-- telescope stuffs
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = "search keymaps" })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = "search buffers" })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').quickfix, { desc = "search problems" })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').current_buffer_fuzzy_find, {desc="search here (cur buf)"})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = "search help documents" })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = "search dir" })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = "search marks" })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = "search resume" })

-- toggles
vim.keymap.set('n', '<leader>Tw', '<cmd>:set wrap!<CR>', { desc = "toggle word wrap" })
vim.keymap.set('n', '<leader>Tn', '<cmd>:set number!<CR>', { desc = "toggle line numbers" })

-- tabs
vim.keymap.set('n', '<leader>tc', '<cmd>:tabnew<CR>', { desc = "create tab" })
vim.keymap.set('n', '<leader>th', '<cmd>:tabprevious<CR>', { desc = "tab left" })
vim.keymap.set('n', '<leader>tl', '<cmd>:tabnext<CR>', { desc = "tab next" })
vim.keymap.set('n', '<leader>tn', '<cmd>:tabnext<CR>', { desc = "tab next" })

-- windows
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = "window down" })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = "window up" })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = "window right" })
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = "window left" })
vim.keymap.set('n', '<leader>wM', '<cmd>:only<CR>', { desc = "window maximize" })

-- buffers
vim.keymap.set('n', '<leader>bk', '<cmd>:bd<CR>', { desc = "buffer kill" })
vim.keymap.set('n', '<leader>bn', '<cmd>:bnext<CR>', { desc = "buffer next" })
vim.keymap.set('n', '<leader>bl', '<cmd>:b#<CR>', { desc = "buffer last (toggle between)" })
vim.keymap.set('n', '<leader>bp', '<cmd>:bprev<CR>', { desc = "buffer previous" })
vim.keymap.set('n', '<leader>be', '<cmd>:enew!<CR>', { desc = "buffer empty" })
vim.keymap.set('n', '<leader>bo', '<cmd>:%bd|e#|bd#|normal `"<CR>', { desc = "buffer only (close all others)" })

-- quickfix
vim.keymap.set('n', '<leader>td', '<cmd>:TodoTelescope<CR>', { desc = "Quickfix List" })
vim.keymap.set('n', '<leader>ql', '<cmd>:copen<CR>', { desc = "Quickfix List" })
vim.keymap.set('n', '<leader>qp', '<cmd>:cprevious<CR>', { desc = "Quickfix Previous" })
vim.keymap.set('n', '<leader>qn', '<cmd>:cnext<CR>', { desc = "Quickfix Next" })
vim.keymap.set('n', '<leader>qc', '<cmd>:cexpr []<CR>', { desc = "Quickfix Clear" })

-- binds
vim.keymap.set('n', '<leader>gg', '<cmd>:Git<CR>', { desc = "git" })
vim.keymap.set('n', '<leader>gb', '<cmd>:Git blame<CR>', { desc = "git" })
vim.keymap.set('n', '<leader>ot', '<cmd>:NvimTreeFindFileToggle<CR>', { desc = "Toggle File Tree" })


-- theme
-- vim.cmd [[colorscheme blackbird]]
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme monokai-pro-classic]]
-- vim.cmd [[colorscheme onedark]]
vim.cmd [[colorscheme tokyonight-night]]

-- autocmds
-- auto trim trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- startup in telescope for files
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").oldfiles({only_cwd = true})
    end
  end,
})
