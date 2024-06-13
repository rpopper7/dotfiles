-- Plugins that enhance the visual appearance of neovim

return {
  ---------------------------------------------------------------------------
  -- Lua fork of vim-devicons
  { 'nvim-tree/nvim-web-devicons', lazy = false },

  ---------------------------------------------------------------------------
  -- fast and fully programmable greeter dashboard
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
      }

      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', '<cmd>ene<CR>'),
        dashboard.button(
          'SPC ff',
          '  Find file',
          '<cmd>Telescope find_files<CR>'
        ),
        dashboard.button(
          'SPC ee',
          '  Toggle file explorer',
          '<cmd>NvimTreeToggle<CR>'
        ),
        dashboard.button(
          'SPC fs',
          '󰱼  Find word',
          '<cmd>Telescope live_grep<CR>'
        ),
        dashboard.button(
          'SPC wr',
          '󰁯  Restore Session For Current Directory',
          '<cmd>SessionRestore<CR>'
        ),
        dashboard.button('q', '  Quit NVIM', '<cmd>qa<CR>'),
      }

      local time = os.date('%H:%M')
      local date = os.date('%a %d %b')
      local ver = vim.version()
      local version = ' v'
        .. ver.major
        .. '.'
        .. ver.minor
        .. '.'
        .. ver.patch

      function CenterText(text, width)
        local totalPadding = width - #text
        local leftPadding = math.floor(totalPadding / 2)
        local rightPadding = totalPadding - leftPadding
        return string.rep(' ', leftPadding)
          .. text
          .. string.rep(' ', rightPadding)
      end

      dashboard.section.footer.val = {
        CenterText('if you can dream it, you can code it', 50),
        ' ',
        CenterText(date, 50),
        CenterText(time, 50),
        CenterText(version, 50),
      }

      require('alpha').setup(dashboard.opts)

      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]]) -- disable folding on alpha buffer
    end,
  },
  ---------------------------------------------------------------------------
  -- Snazzy tabs (aka bufferline)
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '*',
    opts = {
      options = {
        mode = 'tabs',
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
      },
    },
  },
  ---------------------------------------------------------------------------
  -- Improves the default vim-ui interfaces
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  ---------------------------------------------------------------------------
  -- Visually display indent levels
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = { char = '│' },
      scope = { enabled = false },
    },
  },
  ---------------------------------------------------------------------------
  -- Statusline with many customizations
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local lazy_status = require('lazy.status')
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
        },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#ff9e64' },
            },
            { 'encoding' },
            { 'fileformat' },
            { 'filetype' },
          },
        },
      })
    end,
  },
  ---------------------------------------------------------------------------
  -- Visualize and operate on indent scope
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function(_, opts)
      opts.symbol = '│'
      opts.options = { try_as_border = true }
      opts.draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'alpha',
          'dashboard',
          'help',
          'lazy',
          'lazyterm',
          'man',
          'mason',
          'neo-tree',
          'notify',
          'Outline',
          'toggleterm',
          'Trouble',
        },
        callback = function()
          vim.b['miniindentscope_disable'] = true
        end,
      })
    end,
  },
  ---------------------------------------------------------------------------
  -- Create key bindings that stick and display by pressing
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },
}
