-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- More space for displaying messages
-- vim.opt.cmdheight = 2

-- Show current line number
vim.opt.number = true

-- Search ignoring case
vim.opt.ignorecase = true

-- Show relative line numbers
vim.opt.relativenumber = false

-- Auto indenting
vim.opt.cindent = true

-- Show row and column ruler information
-- vim.opt.rulerformat = [[%15(%c%V\ %p%%%)]]
-- vim.opt.ruler = true

-- Automatically :write before running commands
vim.opt.autowrite = true

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Break lines at word
vim.opt.linebreak = true

-- Wrap-broken line prefix (soft wrap)
vim.opt.showbreak = "   "

-- Line Wrap (number of cols)
vim.opt.textwidth = 0

-- Highlight matching brace
vim.opt.showmatch = true

-- Highlight all search results
vim.opt.hlsearch = true

-- Enable smart-case search
vim.opt.smartcase = true

-- Searches for strings incrementally
vim.opt.incsearch = true

-- Auto-indent new lines
vim.opt.autoindent = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Number of auto-indent spaces
-- vim.opt.shiftwidth = 2

-- Shift to the next round tab stop.
vim.opt.shiftround = true

-- Enable smart-indent
vim.opt.smartindent = true

-- Enable smart-tabs
-- vim.opt.smarttab = true

-- Tab stuff
-- vim.opt.softtabstop = 2 -- Number of spaces per Tab
-- vim.opt.ts = 4 -- Insert 4 spaces for a tab by default

-- Number of undo levels
vim.opt.undolevels = 5000

-- Allow backspacing over everything in insert mode
vim.opt.backspace = "indent,eol,start"

-- Enable syntax highlighting
-- vim.opt.syntax = "on"

-- Disable yankind/deleting going to the clipboard
vim.opt.clipboard = ""

-- Enable mouse support
vim.opt.mouse = "a"

-- Decrease update time
vim.opt.timeoutlen = 250

-- Save undo history
vim.opt.undofile = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Avoid vim hiding chars for decluttering
-- vim.opt.conceallevel = 0

-- Disable all animations (from Lazy 14 a bunch of shit entered with Snacks, so I'm disabling everything)
vim.g.snacks_animate = false
