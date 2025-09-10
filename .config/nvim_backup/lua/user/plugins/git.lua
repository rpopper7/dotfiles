return {
  ---------------------------------------------------------------------------
  -- Git blame visualizer
  {
    'FabijanZulj/blame.nvim',
    cmd = 'ToggleBlame',
    keys = {
      { '<leader>gb', '<cmd>BlameToggle virtual<CR>', desc = 'Git blame' },
      {
        '<leader>gB',
        '<cmd>BlameToggle window<CR>',
        desc = 'Git blame (window)',
      },
    },
    opts = {
      date_format = '%Y-%m-%d %H:%M',
      merge_consecutive = false,
      max_summary_width = 30,
      mappings = {
        commit_info = 'K',
        stack_push = '>',
        stack_pop = '<',
        show_commit = '<CR>',
        close = { '<Esc>', 'q' },
      },
    },
  },
  ---------------------------------------------------------------------------
  -- Reveal the commit messages under the cursor
  {
    'rhysd/git-messenger.vim',
    cmd = 'GitMessenger',
    keys = {
      {
        '<Leader>gm',
        '<Plug>(git-messenger)',
        desc = 'Reveal commit under cursor',
      },
    },
    init = function()
      vim.g.git_messenger_include_diff = 'current'
      vim.g.git_messenger_no_default_mappings = true
      vim.g.git_messenger_floating_win_opts = { border = 'rounded' }
    end,
  },
  ---------------------------------------------------------------------------
  -- Git signs written in left col
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
