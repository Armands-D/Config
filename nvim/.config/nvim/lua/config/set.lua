vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank

vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true

-- line offset Cursor (centre cursor)
vim.opt.so=999

-- Not sure why but vim.opt don't work for below values
-- set notimeout nottimeout
