local utils = require("neotest-gtest.utils")
local lib = require("neotest.lib")

require("neotest").setup({
  adapters = {
    require("neotest-gtest").setup({
      -- root = test_root,        
      debug_adapter = "codelldb",
      is_test_file = function(file)
    -- by default, returns true if the file stem starts with test_ or ends with _test
    -- the extension must be cpp/cppm/cc/cxx/c++
        local lower = string.lower(file)
            -- check that it contains "test" or "tests"
        if not lower:match("tests?") then
          return false
        end

        -- check that it ends with ".cpp"
        if not lower:match("%.cpp$") then
          return false
        end

        return true
      end,
      discovery = {
        concurrent = 2,
        enabled = true,           -- default is true
      },
    })
  }
})

vim.api.nvim_set_keymap('n', '<Leader>t', ':lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rt', ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dt", function()
  require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })
