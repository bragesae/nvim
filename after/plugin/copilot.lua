vim.g.copilot_enabled = true
vim.g.copilot_tab_fuzzy = false

-- Key mappings
-- vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, script = true })
-- vim.keymap.set('i', '<C-p>', 'copilot#Previous()', { silent = true, script = true })
-- vim.keymap.set('i', '<C-n>', 'copilot#Next()', { silent = true, script = true })
-- vim.keymap.set('i', '<C-x>', 'copilot#Dismiss()', { silent = true, script = true })

-- Disable Copilot in certain filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'gitrebase', 'kivy', 'tex', 'vim', 'help' },
    callback = function()
        vim.b.copilot_enabled = false
          end,
          })

