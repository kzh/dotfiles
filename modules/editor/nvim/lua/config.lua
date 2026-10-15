-- Comfortable defaults for opening and editing individual files.
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.background = 'light'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 5
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.wildmode = 'longest:full,full'

-- Keep native recovery and undo storage outside the edited project.
vim.opt.undofile = true
vim.opt.swapfile = true
vim.opt.writebackup = true
vim.opt.backup = false
vim.opt.autoread = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlighting' })
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>write<cr>', { desc = 'Save file' })

local group = vim.api.nvim_create_augroup('DotfilesEditing', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function()
    local highlight = vim.hl.hl_op or vim.hl.on_yank
    highlight({ higroup = 'IncSearch', timeout = 200 })
  end,
})
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  group = group,
  callback = function()
    if vim.bo.buftype == '' then vim.cmd('checktime') end
  end,
})
