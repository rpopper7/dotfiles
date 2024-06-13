-- Portable package manager for Neovim to easily install and manage
-- LSP servers, DAP servers, linters and formatters - do :Mason
return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup({ -- ui when calling :Mason
        ui = {
          border = 'rounded',
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          'cssls',
          'emmet_ls',
          'graphql',
          'html',
          'lua_ls',
          'prismals',
          'pyright',
          'svelte',
          'tailwindcss',
          'tsserver',
        },
      })

      require('mason-tool-installer').setup({
        ensure_installed = {
          'prettier', -- prettier formatter
          'stylua', -- lua formatter
          'isort', -- python formatter
          'black', -- python formatter
          'pylint', -- python linter
          'eslint_d', -- js linter
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'antosha417/nvim-lsp-file-operations', config = true }, -- update imports when file is renamed
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      local signs =
        { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- used to enable autocompletion

      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ['lua_ls'] = function()
          lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }, -- get the language server to recognize the "vim" global
                  disable = {
                    'missing-fields', -- don't warn for missing fields in plugins
                    'incomplete-signature-doc', -- don't warn for incomplete function signature / missing documentation
                  },
                },
                completion = {
                  callSnippet = 'Replace',
                },
              },
            },
          })
        end,
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer local mappings, see `:help vim.lsp.*` for documentation of any of the below functions
          local opts = { buffer = ev.buf, silent = true }

          opts.desc = 'Show LSP references'
          vim.keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

          opts.desc = 'Go to declaration'
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

          opts.desc = 'Show LSP definitions'
          vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

          opts.desc = 'Show LSP implementations'
          vim.keymap.set(
            'n',
            'gi',
            '<cmd>Telescope lsp_implementations<CR>',
            opts
          )

          opts.desc = 'Show LSP type definitions'
          vim.keymap.set(
            'n',
            'gt',
            '<cmd>Telescope lsp_type_definitions<CR>',
            opts
          )

          opts.desc = 'See available code actions' -- in visual mode applies to selection
          vim.keymap.set(
            { 'n', 'v' },
            '<leader>ca',
            vim.lsp.buf.code_action,
            opts
          )

          opts.desc = 'Smart rename'
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

          opts.desc = 'Show buffer diagnostics'
          vim.keymap.set(
            'n',
            '<leader>D',
            '<cmd>Telescope diagnostics bufnr=0<CR>',
            opts
          )

          opts.desc = 'Show line diagnostics'
          vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

          opts.desc = 'Go to previous diagnostic'
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

          opts.desc = 'Go to next diagnostic'
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

          opts.desc = 'Show documentation for what is under cursor'
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

          opts.desc = 'Restart LSP'
          vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
        end,
      })
    end,
  },
}
