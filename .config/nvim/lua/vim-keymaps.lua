-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
keymap.set("n", "<leader>w", "<cmd>w<CR>") -- save file
keymap.set("n", "<leader>q", "<cmd>q<CR>") -- quit file
keymap.set("n", "<leader>x", "<cmd>x<CR>") -- save and quit file

-- use it to move selected code up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected code down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected code up" })

-- mantain terms in the middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste without loosing the buffer
keymap.set("x", "<leader>p", '"_dP')
