
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', extends = '→', precedes = '←' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.hlsearch = true
vim.opt.completeopt = 'menuone,noselect,noinsert'
vim.opt.pumheight = 10
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.lazyredraw = false
vim.opt.ttyfast = true
vim.opt.incsearch = true
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.termguicolors = true
vim.opt.colorcolumn = '100'
vim.opt.conceallevel = 2
vim.opt.concealcursor = ''
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.opt.formatoptions = 'jcroqlnt'
vim.opt.shortmess:append 'WcC'
vim.opt.spelllang = 'en_us'
vim.opt.spelloptions = 'camel'
vim.opt.virtualedit = 'block'
vim.opt.wildmode = 'longest:full,full'
vim.opt.winminwidth = 5

vim.opt.diffopt:append { 'algorithm:histogram', 'indent-heuristic' }

vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.fillchars = {
  vert = '│',
  fold = ' ',
  eob = ' ',
  diff = '╱',
  msgsep = '‾',
  foldopen = '▾',
  foldsep = '│',
  foldclose = '▸',
}

vim.g.markdown_recommended_style = 0

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
  vim.opt.grepformat = '%f:%l:%c:%m'
end

vim.opt.synmaxcol = 500
vim.opt.redrawtime = 10000
vim.opt.regexpengine = 1
vim.opt.maxmempattern = 20000

vim.opt.showmatch = true
vim.opt.matchtime = 2

vim.opt.undolevels = 10000
vim.opt.history = 10000

vim.opt.belloff = 'all'
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', [["_dP]], { desc = 'Paste without yanking' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Alternative escape' })
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable', silent = true })
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>W', '<cmd>wa<cr>', { desc = 'Save all files' })
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<cr>a', { desc = 'Save file in insert mode' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bD', '<cmd>bdelete!<cr>', { desc = 'Force delete buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>enew<cr>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Equal splits' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close split' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Next quickfix' })
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Previous quickfix' })
vim.keymap.set('n', '<leader>co', '<cmd>copen<cr>', { desc = 'Open quickfix' })
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<cr>', { desc = 'Close quickfix' })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })
vim.keymap.set('n', '*', '*zz', { desc = 'Search word and center' })
vim.keymap.set('n', '#', '#zz', { desc = 'Search word backwards and center' })
vim.keymap.set('n', 'g*', 'g*zz', { desc = 'Search partial word and center' })
vim.keymap.set('n', 'g#', 'g#zz', { desc = 'Search partial word backwards and center' })
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = 'Toggle undo tree' })
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = 'Toggle word wrap' })
vim.keymap.set('n', '<leader>tn', '<cmd>set relativenumber!<cr>', { desc = 'Toggle relative numbers' })
vim.keymap.set('n', 'Q', '@q', { desc = 'Execute macro q' })
vim.keymap.set('x', 'Q', ':norm @q<cr>', { desc = 'Execute macro q on selection' })
vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement number' })
vim.keymap.set('x', '+', 'g<C-a>', { desc = 'Increment numbers' })
vim.keymap.set('x', '-', 'g<C-x>', { desc = 'Decrement numbers' })
vim.cmd([[
  " Common typos
  iabbrev teh the
  iabbrev Teh The
  iabbrev taht that
  iabbrev Taht That
  iabbrev waht what
  iabbrev Waht What
  iabbrev tehn then
  iabbrev Tehn Then

  " Quick expansions
  iabbrev dts <C-R>=strftime("%Y-%m-%d")<CR>
  iabbrev dtl <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
]])
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace on save',
  group = vim.api.nvim_create_augroup('TrimWhitespace', { clear = true }),
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'markdown' then
      return
    end
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  desc = 'Check if file was changed outside of Neovim',
  group = vim.api.nvim_create_augroup('CheckFileChange', { clear = true }),
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits when window is resized',
  group = vim.api.nvim_create_augroup('ResizeSplits', { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. current_tab)
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Go to last location when opening a buffer',
  group = vim.api.nvim_create_augroup('LastLocation', { clear = true }),
  callback = function(event)
    local exclude = { 'gitcommit', 'commit', 'gitrebase' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_location then
      return
    end
    vim.b[buf].last_location = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Close certain filetypes with <q>',
  group = vim.api.nvim_create_augroup('CloseWithQ', { clear = true }),
  pattern = {
    'checkhealth',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'query',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'PlenaryTestPopup',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Auto create dir when saving a file',
  group = vim.api.nvim_create_augroup('AutoCreateDir', { clear = true }),
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable wrap and spell for certain filetypes',
  group = vim.api.nvim_create_augroup('WrapSpell', { clear = true }),
  pattern = { 'gitcommit', 'markdown', 'text' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Fix conceallevel for json files',
  group = vim.api.nvim_create_augroup('JsonConceal', { clear = true }),
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

