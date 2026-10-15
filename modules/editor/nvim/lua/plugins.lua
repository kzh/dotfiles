return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup({ variant = 'dawn' })
      vim.cmd.colorscheme('rose-pine')
    end,
  },
  { 'tpope/vim-sleuth' },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  { 'kylechui/nvim-surround', event = 'VeryLazy', opts = {} },
}
