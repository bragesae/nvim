local dap = require("dap")

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = "/home/brage/codelldb/extension/adapter/codelldb",
    args = {"--port", "${port}"},
  }
}

dap.configurations.cpp = {
  {
    name = "Launch with CodeLLDB",
    type = "codelldb",
    request = "launch",
    program = "${workspaceFolder}/build/test/networking_tests",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    sourceMap = { 
      ["${workspaceFolder}"] = vim.fn.getcwd()  -- map to your current folder
    },
  },
}

local dapui = require("dapui")
dapui.setup({
  layouts = {
    {
      -- This is the main source code window
      elements = { "breakpoints", "stacks", "scopes" }, --, "watches" },
      size = 85,       -- width in columns (chars) for vertical layout
      position = "left" -- can be "left", "right", "bottom", "top"
    },
    {
      elements = { "repl" },
      size = 10,
      position = "bottom"
    }
  },
  floating = {
    max_height = 0.9,
    max_width = 0.9,
    border = "rounded",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})


-- Open and close automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.cmd("Neotree close")
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.cmd("Neotree reveal")
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.cmd("Neotree reveal")
end

-- Use the same config for C
dap.configurations.c = dap.configurations.cpp

-- require("nvim-dap-virtual-text").setup({
--     enabled = true,             -- default: true
--     commented = false,          -- show as virtual text without comment symbols
--     highlight_changed_variables = false,
--     show_stop_reason = true,
-- })


vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.api.nvim_set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', ":lua require'dap'.step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>', ":lua require'dap'.step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ":lua require'dap'.step_out()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', ":lua require'dap'.terminate()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dh",  -- example: dh = dap hover
  ":lua require'dap.ui.widgets'.hover()<CR>",
  { noremap = true, silent = true }
)

