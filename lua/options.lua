vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.showtabline = 0

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'
vim.g.zig_fmt_parse_errors = 0
-- vim: ts=2 sts=2 sw=2 et
