require("fluoride").setup({
  window = {
    title = "Fluoride",       -- string or false to hide
    border = "single",        -- any nvim_open_win border format
    winblend = 15,            -- transparency (0-100)
    footer = true,            -- show keybinding hints at bottom
    center_breakpoint = 80,   -- switch to centered layout below this width
    sidebar = {               -- right-side floating window (wide terminals)
      width = 0.3,            -- proportion of terminal width (0-1)
      height = 0.85,          -- proportion of terminal height (0-1)
      row = 2,                -- rows from top edge
      col = 2,                -- cols from right edge
    },
    centered = {              -- centered float (narrow terminals)
      width = 0.6,            -- proportion of terminal width (0-1)
      height = 0.6,           -- proportion of terminal height (0-1)
    },
  },
  keymaps = {
    close = "q",              -- close the window
    close_alt = "<C-c>",      -- alternative close (false to disable)
    jump = "<CR>",            -- jump to code point (focus moves to source)
    peek = "fp",              -- peek at code point (center + flash)
    hover = "K",              -- LSP hover on code point
    toggle_children = "<Tab>", -- toggle nested members on/off
    yank = "gy",              -- peek + copy code block to clipboard
  },
  max_depth = 1,              -- nesting depth for children (0=none, 1=direct children, 2+=deeper)
  yank_comments = true,       -- include attached comments in yank (default: true)
  confirm_delete = true,      -- prompt before deleting code points (false to skip)
  highlight = {
    peek_duration = 200,      -- ms for gd peek flash
    rename_duration = 130,    -- ms for rename flash per entry
  },
})

vim.keymap.set("n", "<leader>fp", "<cmd>Fluoride<cr>", { desc = "Fluoride" })
