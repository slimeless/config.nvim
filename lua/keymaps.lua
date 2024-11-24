-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

vim.keymap.set('i', '<CapsLock>', '<ESC>')

vim.keymap.set('n', '<leader><leader>', ':source %<CR>', { silent = true })
vim.keymap.set('n', '<leader>x', '*``cgn', { desc = 'Replace' })
vim.keymap.set('n', '<leader>X', '#``cgN', { desc = 'Replacei backwards' })

vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>Q', ':w<CR><CMD>Oil<CR>', { desc = 'Quit and open parent directory' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save' })

vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^')
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '$')

vim.keymap.set('n', '<leader>f', ':Format<CR>', { desc = 'Format' })
vim.keymap.set('n', '<leader>F', ':FormatWrite<CR>', { desc = 'Format' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'i' }, '<C-p>', [["+p]])

vim.keymap.set({ 'n', 'i' }, '<A-n>', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set({ 'n', 'i' }, '<A-p>', ':tabprev<CR>', { desc = 'Previous tab' })

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'gr', "<CMD>lua require('telescope.builtin').lsp_references()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'gy', '<CMD>Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })

-- diagnostic
vim.keymap.set('n', 'd[', '<CMD>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'd]', '<CMD>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'i' }, '<Up>', '', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<Down>', '', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
