local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

local ts_replace = require('ts_search_and_replace')
vim.keymap.set("n", "<leader>fr", function()
   local search = vim.fn.input("Search > ")
   if search == "" then return end
   local replace = vim.fn.input("Replace > ")
   ts_replace.ts_replace(search, replace)
 end)

