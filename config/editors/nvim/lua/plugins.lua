-- All custom plugins in one file
return {
  -- UI Enhancements
  { 'nvim-tree/nvim-web-devicons' },
  { 'stevearc/dressing.nvim', event = 'VeryLazy', opts = {} },
  { 'rcarriga/nvim-notify', opts = { stages = 'fade', timeout = 3000, render = 'compact' } },
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        mode = 'buffers',
        separator_style = 'thin',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      lsp = { override = { ['vim.lsp.util.convert_input_to_markdown_lines'] = true, ['vim.lsp.util.stylize_markdown'] = true, ['cmp.entry.get_documentation'] = true } },
      presets = { bottom_search = true, command_palette = true, long_message_to_split = true, inc_rename = true },
    },
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
        '                                                     ',
      }
      dashboard.section.buttons.val = {
        dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
        dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
        dashboard.button('g', '  Find text', ':Telescope live_grep <CR>'),
        dashboard.button('c', '  Config', ':e ~/.config/nvim/init.lua <CR>'),
        dashboard.button('q', '  Quit', ':qa<CR>'),
      }
      alpha.setup(dashboard.config)
    end,
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', event = 'VeryLazy', opts = {} },
  { 'RRethy/vim-illuminate', event = 'VeryLazy' },
  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, cmd = 'Trouble', opts = {} },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
  { 'nvim-pack/nvim-spectre', cmd = 'Spectre', opts = {} },

  -- Coding
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter', opts = {} },
  { 'folke/flash.nvim', event = 'VeryLazy', opts = {} },
  { 'mg979/vim-visual-multi', event = 'BufReadPost' },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
  { 'tpope/vim-sleuth' },
  { 'github/copilot.vim', event = 'InsertEnter' },
  { 'kristijanhusak/vim-dadbod-ui', dependencies = { 'tpope/vim-dadbod', 'kristijanhusak/vim-dadbod-completion' }, cmd = { 'DBUI', 'DBUIToggle' } },
  { 'rest-nvim/rest.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, ft = 'http' },
  
  -- File editing as buffer
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Tmux integration
  { 'christoomey/vim-tmux-navigator', lazy = false },

  -- Tools
  { 'folke/persistence.nvim', event = 'BufReadPre', opts = {} },
  { 'akinsho/toggleterm.nvim', version = '*', cmd = 'ToggleTerm', opts = { direction = 'float', float_opts = { border = 'curved' } } },
  { 'kevinhwang91/nvim-bqf', ft = 'qf', opts = { auto_enable = true, auto_resize_height = true } },
  { 'stevearc/overseer.nvim', cmd = { 'OverseerRun', 'OverseerToggle' }, opts = {} },
  { 'folke/zen-mode.nvim', cmd = 'ZenMode', opts = {} },
  { 'folke/twilight.nvim', cmd = 'Twilight', opts = {} },
  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'kkharji/sqlite.lua' },
    config = function()
      require('telescope').load_extension('frecency')
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon'):setup()
    end,
  },
  { 'tpope/vim-fugitive', event = 'VeryLazy' },
  { 'f-person/git-blame.nvim', event = 'BufReadPre', opts = { enabled = true, date_format = '%r' } },
  { 'kdheepak/lazygit.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, cmd = { 'LazyGit', 'LazyGitConfig' } },
  { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen', 'DiffviewClose' } },

  -- LSP & Language Support
  { 'b0o/schemastore.nvim' },
  { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
  { 'simrat39/rust-tools.nvim', ft = 'rust' },
  { 'nvimtools/none-ls.nvim', event = 'BufReadPre' },
  { 'jay-babu/mason-null-ls.nvim', event = { 'BufReadPre', 'BufNewFile' }, dependencies = { 'williamboman/mason.nvim', 'nvimtools/none-ls.nvim' } },
  { 'ray-x/lsp_signature.nvim', event = 'VeryLazy', opts = {} },
  { 'smjonas/inc-rename.nvim', cmd = 'IncRename', config = true },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black', 'isort' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        go = { 'gofmt', 'goimports' },
        rust = { 'rustfmt' },
        sh = { 'shfmt' },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        python = { 'ruff' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        go = { 'golangcilint' },
        markdown = { 'markdownlint' },
      }
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Snippets
  { 'rafamadriz/friendly-snippets' },
  {
    'chrisgrieser/nvim-scissors',
    dependencies = { 'nvim-telescope/telescope.nvim', 'L3MON4D3/LuaSnip' },
    cmd = { 'ScissorsEditSnippet', 'ScissorsAddNewSnippet' },
    opts = { snippetDir = vim.fn.stdpath('config') .. '/snippets' },
  },

  -- File Explorer (from kickstart)
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  },

  -- Debug Adapter Protocol (from kickstart)
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
    keys = {
      { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
      { '<F1>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
      { '<F2>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
      { '<F3>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
      { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
      { '<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
      { '<F7>', function() require('dapui').toggle() end, desc = 'Debug: See last session result.' },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = { 'delve' },
      }

      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dap-go').setup()
    end,
  },

}