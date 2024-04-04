local opt = vim.opt -- for conciseness
--
-- conceal level for editing markdown
opt.conceallevel = 2

-- 4 spaces for tabs (prettier default)
opt.tabstop = 4
-- 4 spaces for indent width
opt.shiftwidth = 4
-- expand tab to spaces
opt.expandtab = true
-- copy indent from current line when starting new one
opt.autoindent = true

-- shows absolute line number on cursor line (when relative number is on)
opt.number = true
-- show relative line numbers
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = "a"

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- line wrapping
opt.wrap = true -- disable line wrapping

-- ignore case when searching
opt.ignorecase = true
-- if you include mixed case in your search, assumes you want case-sensitive
opt.smartcase = true

-- Save undo history
opt.undofile = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true

-- Sync clipboard between OS and Neovim.
opt.clipboard = "unnamedplus"

-- split vertical window to the right
opt.splitright = true
-- split horizontal window to the bottom
opt.splitbelow = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
