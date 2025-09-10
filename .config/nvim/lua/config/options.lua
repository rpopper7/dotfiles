-- BASIC BEHAVIORS 
vim.opt.mouse = 'a' -- allows mouse to be used
vim.opt.clipboard = 'unnamedplus' -- allows nvim to access the system / OS clipboard
vim.opt.backup = false -- don't create backup files
vim.opt.swapfile = false -- don't create a swap file
vim.opt.undofile = true -- undo is not lost on exit
vim.opt.updatetime = 250 -- wait less time to trigger certain events, snappier
vim.opt.timeoutlen = 400 -- time to wait for a keymap before timing out
vim.opt.pumheight = 10 -- limit popup menus to 10 so it doesn't get too tall
vim.opt.showmatch = true -- highlight matching parenthesis

-- CURSOR UI
vim.opt.scrolloff = 15 -- min num of lines to keep above and below cursor
vim.opt.sidescrolloff = 15 -- min num of cols to keep left and right of cursor
vim.opt.cursorline = true -- highlight line cursor is on

-- COLUMNS
vim.opt.number = true -- add numbers on left
vim.opt.numberwidth = 2 -- set num col width to 2 (default is 4)
vim.opt.signcolumn = 'yes' -- always show sign col, otherwise it will shift text

-- TABS & INDENTATION
vim.opt.tabstop = 4 -- tab is N spaces long
vim.opt.shiftwidth = 4 -- number of spaces in auto-indent
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- language-aware smart indentation
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.breakindent = true -- wrap line and put indent to show where it wraps

-- SEARCH & REPLACE
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- don't ignore case if search includes capitals
vim.opt.hlsearch = true -- set highlight on search

-- GUI
vim.termguicolors = true -- render the full range of theme colors instead of estimating


