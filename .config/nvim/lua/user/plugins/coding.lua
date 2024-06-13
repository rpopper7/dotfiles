-- autopair () [] {} ""
return {
  ---------------------------------------------------------------------------
  -- Powerful auto-pair plugin with multiple character support
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
          java = false,
        },
        enable_check_bracket_line = true, -- check bracket in same line
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  ---------------------------------------------------------------------------
  -- Comment large amounts of code with line and block-wise commenting
  {
    'numToStr/comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('Comment').setup({
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      })
    end,
  },
  ---------------------------------------------------------------------------
  -- Conform formatter
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          svelte = { 'prettier' },
          css = { 'prettier' },
          html = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
          graphql = { 'prettier' },
          liquid = { 'prettier' },
          lua = { 'stylua' },
          python = { 'isort', 'black' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
        require('conform').format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = 'Format file or range (in visual mode)' })
    end,
  },
  ---------------------------------------------------------------------------
  -- CMP - show autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer', -- source for text in buffer
      'hrsh7th/cmp-path', -- source for path
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp',
      },
      'saadparwaiz1/cmp_luasnip', -- for autocompletion
      'rafamadriz/friendly-snippets', -- useful snippets
      'onsails/lspkind.nvim', -- vs-code like pictograms
    },
    config = function()
      local cmp = require('cmp')

      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        completion = {
          completeopt = 'menu,menuone,preview,noselect',
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
          ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
          ['<C-e>'] = cmp.mapping.abort(), -- close completion window
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- snippets
          { name = 'buffer' }, -- text within current buffer
          { name = 'path' }, -- file system paths
        }),

        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = require('lspkind').cmp_format({
            maxwidth = 50,
            ellipsis_char = '...',
          }),
        },
      })
    end,
  },
  ---------------------------------------------------------------------------
  -- Trailing whitespace highlight and remove
  {
    'echasnovski/mini.trailspace',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      {
        '<Leader>cw',
        '<cmd>lua MiniTrailspace.trim()<CR>',
        desc = 'Erase whitespace',
      },
    },
    opts = {},
  },
  ---------------------------------------------------------------------------
  -- Asynchronous linter plugin
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        svelte = { 'eslint_d' },
        python = { 'pylint' },
      }

      vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost' }, {
        callback = function()
          local lint_status, lint = pcall(require, 'lint')
          if lint_status then
            lint.try_lint()
          end
        end,
      })

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
  ---------------------------------------------------------------------------
  -- Syntax highlighting
  -- NOTE: jsx return statement highlighting is still being developed / has known issues
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' }, -- lazyload on these events
    build = ':TSUpdate', -- update all language parsers when this plugin updates
    dependencies = 'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'c',
          'css',
          'dockerfile',
          'gitignore',
          'graphql',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'markdown_inline',
          'prisma',
          'query',
          'svelte',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      })
      require('nvim-ts-autotag').setup()
    end,
  },
}
