-- Plugins enhancing the general text-editing ability of neovim, regarldess of file type
return {
  ---------------------------------------------------------------------------
  -- Tmux split window navigation
  { 'christoomey/vim-tmux-navigator' },
  ---------------------------------------------------------------------------
  -- Auto detect tabstop & shiftwidth based on file / directory
  { 'tpope/vim-sleuth' },
  ---------------------------------------------------------------------------
  -- Save a session by quitting with :qa and then restore on alpha homescreen
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup({
        auto_restore_enabled = false,
        auto_session_suppress_dirs = {
          '~/',
          '~/Downloads',
        },
      })
      vim.keymap.set(
        'n',
        '<leader>wr',
        '<cmd>SessionRestore<CR>',
        { desc = 'Restore session for cwd' }
      )
      vim.keymap.set(
        'n',
        '<leader>ws',
        '<cmd>SessionSave<CR>',
        { desc = 'Save session for auto session root dir' }
      )
    end,
  },
  ---------------------------------------------------------------------------
  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require('nvim-tree').setup({
        view = {
          width = 35,
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
          icons = {
            glyphs = {
              folder = {
                arrow_closed = '→',
                arrow_open = '↓',
              },
            },
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false, -- disabling window picker helps explorer work well in window splits
            },
          },
        },
        filters = {
          custom = { '.DS_Store' },
        },
        git = {
          ignore = false, -- show files ignored by git
        },
      })
      vim.keymap.set(
        'n',
        '<leader>ee',
        '<cmd>NvimTreeToggle<CR>',
        { desc = 'Toggle file explorer' }
      )
      vim.keymap.set(
        'n',
        '<leader>ef',
        '<cmd>NvimTreeFindFileToggle<CR>',
        { desc = 'Toggle file explorer on current' }
      )
      vim.keymap.set(
        'n',
        '<leader>ec',
        '<cmd>NvimTreeCollapse<CR>',
        { desc = 'Collapse file explorer' }
      )
      vim.keymap.set(
        'n',
        '<leader>er',
        '<cmd>NvimTreeRefresh<CR>',
        { desc = 'Refresh file explorer' }
      )
    end,
  },
  ---------------------------------------------------------------------------
  -- Find files and strings
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
      'folke/todo-comments.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous, -- move to prev result
              ['<C-j>'] = actions.move_selection_next, -- move to next result
              ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension('fzf')

      vim.keymap.set(
        'n',
        '<leader>ff',
        '<cmd>Telescope find_files<cr>',
        { desc = 'Fuzzy find files in cwd' }
      )
      vim.keymap.set(
        'n',
        '<leader>fr',
        '<cmd>Telescope oldfiles<cr>',
        { desc = 'Fuzzy find recent files' }
      )
      vim.keymap.set(
        'n',
        '<leader>fs',
        '<cmd>Telescope live_grep<cr>',
        { desc = 'Find string in cwd' }
      )
      vim.keymap.set(
        'n',
        '<leader>fc',
        '<cmd>Telescope grep_string<cr>',
        { desc = 'Find string under cursor in cwd' }
      )
      vim.keymap.set(
        'n',
        '<leader>ft',
        '<cmd>TodoTelescope<cr>',
        { desc = 'Find todos' }
      )
    end,
  },
  ---------------------------------------------------------------------------
  --  Highlight, list, and search todo comments in your projects with KEY + :
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-lua/plenary.nvim',
    signs = true,
    signs_priority = 8,
    keys = {
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Next todo comment',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Prev todo comment',
      },
    },
    config = function()
      require('todo-comments').setup()
    end,
  },
  ---------------------------------------------------------------------------
  -- Ultimate undo history visualizer
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<Leader>gu', '<cmd>UndotreeToggle<CR>', desc = 'Undo Tree' },
    },
  },
  ---------------------------------------------------------------------------
  -- Maximize a split window
  {
    'szw/vim-maximizer',
    keys = {
      {
        '<leader>sm',
        '<cmd>MaximizerToggle<CR>',
        desc = 'Maximize/minimize a split',
      },
    },
  },
}
