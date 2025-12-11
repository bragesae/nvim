local actions = require("telescope.actions")

require('telescope').setup({
    defaults = {
        sorting_strategy = "ascending",
        -- Default configuration for telescope goes here:
        -- config_key = value,
        -- ..
    },
    pickers = {
      buffers = {
        mappings = {
          n = {
            ["<leader>bd"] = actions.delete_buffer,   -- normal mode
          },
        },
      },
    },
})


local builtin = require('telescope.builtin')

local function get_subdirs_excluding(excluded)
  local cwd = vim.fn.getcwd()
  local handle = vim.loop.fs_scandir(cwd)
  local dirs = {}

  -- Turn exclusion list into set for fast lookup
  local exclude_set = {}
  for _, name in ipairs(excluded or {}) do
    exclude_set[name] = true
  end

  if handle then
    while true do
      local name, typ = vim.loop.fs_scandir_next(handle)
      if not name then break end

      -- Check if it's a directory and not excluded
      if typ == "directory" and not exclude_set[name] then
        table.insert(dirs, cwd .. "/" .. name)
      end
    end
  end

  return dirs
end
search_dirs = get_subdirs_excluding({"build", "install", "log", "~", ".git", "vdr", ".cache"})

vim.keymap.set('n', '<leader>ff', function()
    local cwd = vim.fn.getcwd()
    builtin.find_files({search_dirs = search_dirs})
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<S-Tab>', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>')

local cwd = vim.fn.getcwd()
vim.keymap.set('n', '<leader>fw', function()
	builtin.grep_string({ 
        search = vim.fn.input("Grep > "),
        search_dirs = search_dirs 
    })
end)
