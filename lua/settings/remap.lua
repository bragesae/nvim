vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", function() vim.cmd.Ex() end)
vim.keymap.set("n", "<C-b>", "<C-w>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set('n', '<S-Tab>', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>')
vim.keymap.set('n', '<C-v>', '<C-v>', { noremap = true })
vim.keymap.set('n', '<C-v>', '<C-q>')
-- Map Shift+I in visual mode to do insert on all lines
vim.keymap.set('x', 'S-i', '<Esc>gI', { noremap = true, desc = "Insert on all selected lines" })

