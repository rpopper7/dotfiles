-- BASIC BEHAVIORS 
vim.o.mouse = 'a' -- allows mouse to be used
vim.o.clipboard = 'unnamedplus' -- allows nvim to access the system / OS clipboard
vim.o.backup = false -- don't create backup files
vim.o.swapfile = false -- don't create a swap file
vim.o.undofile = true -- undo is not lost on exit
vim.o.updatetime = 250 -- wait less time to trigger certain events, snappier
vim.o.timeoutlen = 400 -- time to wait for a keymap before timing out
vim.o.showmatch = true -- highlight matching parenthesis
vim.o.winborder = "rounded" -- borders on floating windows and popups

-- CURSOR UI
vim.o.scrolloff = 15 -- min num of lines to keep above and below cursor
vim.o.sidescrolloff = 15 -- min num of cols to keep left and right of cursor
vim.o.cursorline = true -- highlight line cursor is on

-- COLUMNS
vim.o.number = true -- add numbers on left
vim.o.numberwidth = 2 -- set num col width to 2 (default is 4)
vim.o.signcolumn = 'yes' -- always show sign col, otherwise it will shift text

-- TABS & INDENTATION
vim.o.tabstop = 4 -- tab is N spaces long
vim.o.shiftwidth = 4 -- number of spaces in auto-indent
vim.o.expandtab = true -- convert tabs to spaces
vim.o.smartindent = true -- language-aware smart indentation
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.o.breakindent = true -- wrap line and put indent to show where it wraps

-- SEARCH & REPLACE
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- don't ignore case if search includes capitals
vim.o.hlsearch = true -- set highlight on search

-- GUI
vim.termguicolors = true -- render the full range of theme colors instead of estimating


