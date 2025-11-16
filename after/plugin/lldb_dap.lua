local dap = require("dap")

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = '/home/brage/codelldb/extension/adapter/codelldb',
    args = {'--port', '${port}'},
  }
}

dap.configurations.cpp = {
  {
    name = 'Launch with CodeLLDB',
    type = 'codelldb',
    request = 'launch',
    program = '${workspaceFolder}/build/test/networking_tests',
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    sourceMap = { 
      ['${workspaceFolder}'] = vim.fn.getcwd()  -- map to your current folder
    },
    runInTerminal = true,  -- IMPORTANT
    console = "integratedTerminal", -- still needed
  },
}

-- Use the same config for C
dap.configurations.c = dap.configurations.cpp

local dapui = require('dapui')
dapui.setup({
  layouts = {
    { -- This is the main source code window
      elements = { 
          {
            id = "watches",
            size = 0.10
          },
          {
            id = "breakpoints",
            size = 0.20
          },
          {
            id = "stacks",
            size = 0.20
          },
          {
            id = "scopes",
            size = 0.50
          },
        },
        position = "left",
        size = 120 
    },
    -- {
    --   elements = { 'repl' },
    --   size = 10,
    --   position = 'bottom'
    -- },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.9,
    border = 'rounded',
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
})

-- Optional: make dap-ui cleaner and more clickable
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'dapui_breakpoints', 'dapui_stacks', 'dapui_scopes' },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end
})


-- Open and close automatically
dap.listeners.after.event_initialized['dapui_config'] = function()
  vim.cmd('Neotree close')
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
  vim.cmd('Neotree reveal')
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
  vim.cmd('Neotree reveal')
end
-- require('nvim-dap-virtual-text').setup({
--     enabled = true,             -- default: true
--     commented = false,          -- show as virtual text without comment symbols
--     highlight_changed_variables = false,
--     show_stop_reason = true,
-- })



vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', { text = '➤', texthl = 'DapStopped', linehl = 'DapStoppedLine'})
vim.api.nvim_set_hl(0, 'DapStoppedLine', { link = 'Visual' })   -- or any other highlight
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#FF0000' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00FF00' })
vim.api.nvim_set_keymap('n', '<F5>', ':lua require"dap".continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', ':lua require"dap".step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>', ':lua require"dap".step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ':lua require"dap".step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', ':lua require"dap".terminate()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':lua require"dap.ui.widgets".hover()<CR>', { noremap = true, silent = true })

local float_exit_keys = { "q", "<ESC>" }
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dap-float',
  callback = function(args)
    for _, key in ipairs(float_exit_keys) do
        vim.keymap.set('n', key, function()
          vim.api.nvim_win_close(0, true)
        end, { buffer = args.buf, silent = true })
    end
  end,
})

