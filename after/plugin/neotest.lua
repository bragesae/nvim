local utils = require("neotest-gtest.utils")
local lib = require("neotest.lib")
local gtest = require("neotest-gtest")

require("neotest").setup({
  adapters = {
   require("neotest-gtest").setup({
      args = {". install/setup.bash && "},  -- prepends these tokens
      -- root = test_root,        
      debug_adapter = "codelldb",
      is_test_file = function(file)
    -- by default, returns true if the file stem starts with test_ or ends with _test
    -- the extension must be cpp/cppm/cc/cxx/c++
        local lower = string.lower(file)
            -- check that it contains "test" or "tests"
        if not string.find(file, "/src/") then
            return false
        end

        if string.find(file, "/build/") then
            return false
        end

        if not lower:match("tests?") then
          return false
        end

        -- check that it ends with ".cpp"
        if not lower:match("%.cpp$") then
          return false
        end
            
        -- Try to open the file
        local opened_file = io.open(file, "r")
        if not opened_file then
          return false
        end
            -- Scan line-by-line
        for line in opened_file:lines() do
          if line:match("TEST_F%(") or line:match("TEST%(") then
            opened_file:close()
            return true
          end
        end

        return false 
      end,
      discovery = {
        concurrent = 2,
        enabled = true,           -- default is true
      },
    })
  }
})

vim.api.nvim_set_keymap('n', '<Leader>ts', ':lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rt', ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dt", function()
  require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })
