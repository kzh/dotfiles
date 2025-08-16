return {
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
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = false,
        },
        signature = { enabled = false },
      },
      presets = { bottom_search = true, command_palette = true, long_message_to_split = true, inc_rename = true },
    },
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
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter', opts = {} },
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = { check_ts = true } },
  { 'folke/flash.nvim', event = 'VeryLazy', opts = {} },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
  { 'tpope/vim-sleuth' },
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },
  { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', opts = {} },
  {
    'zbirenbaum/copilot.lua',
    event = 'VimEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = false,
          accept_word = '<C-Right>',
          accept_line = '<C-Down>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false },
      -- Auto-detect Node.js path; fallback to 'node' if not found
      copilot_node_command = (vim.fn.exepath('node') ~= '' and vim.fn.exepath('node')) or 'node',
    },
  },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has('nvim-0.10.0') == 1,
  },

  { 'christoomey/vim-tmux-navigator', lazy = false },

  { 'folke/persistence.nvim', event = 'BufReadPre', opts = {} },
  { 'akinsho/toggleterm.nvim', version = '*', cmd = 'ToggleTerm', opts = { direction = 'float', float_opts = { border = 'curved' } } },
  { 'kevinhwang91/nvim-bqf', ft = 'qf', opts = { auto_enable = true, auto_resize_height = true } },
  { 'folke/zen-mode.nvim', cmd = 'ZenMode', opts = {} },
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

  { 'b0o/schemastore.nvim' },
  { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
  { 'ray-x/lsp_signature.nvim', event = 'InsertEnter', opts = {} },
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

  { 'rafamadriz/friendly-snippets' },
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
