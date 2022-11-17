-- whitespace handling
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- make tab use n spaces
vim.opt.smartindent = true
vim.opt.wrap = false

-- no attempt to organize anything below here
vim.opt.hlsearch = false -- only highlight current instance when searching
vim.opt.showmatch = true -- bracket matching
vim.opt.wildmenu = true 
vim.opt.wildmode = "longest:full,full"
vim.opt.swapfile = false

vim.opt.hidden = true
-- vim.opt.listchars = {eol = '↵'}
vim.opt.list = true
-- vim.opt.listchars = { trail = '*', tab = '▸'}
vim.opt.listchars:append({ extends = "*" })

vim.opt.termguicolors = true
vim.opt.nu = true -- line numbers
vim.opt.title = true -- window titles
vim.opt.showtabline = 2 -- always show the tab bar
vim.opt.scrolloff = 10 -- keep n lines above and below the cursor
vim.opt.sidescrolloff = 10 -- keep n lines right and left of the cursor
vim.opt.signcolumn = "yes:1" -- the "git gutter"
-- vim.opt.colorcolumn = 100 -- show the line cutoff column

vim.g.mapleader = " "

vim.o.background = "dark" -- or "light" for light mode

-- let me use the mouse like a dirty pleb
vim.opt.mouse = "a"
