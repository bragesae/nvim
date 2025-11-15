require("neo-tree").setup({
    filesystem = {
        filtered_items = {
        hide_dotfiles = false,  -- Show hidden files
        hide_gitignored = false,
    },
      window = {
        position = "left",
        auto_preview = true,          -- auto preview when cursor moves
        width = 50,
        mappings = {
          -- ["l"] = "open",
          -- ["h"] = "close_node",
          ["p"] = { "toggle_preview", config = { use_float = true } },
        },
        preview = {
            type = "floating",          -- floating window preview (hover style)
            position = "right",         -- or "left", "top", "bottom"
            size = {
              width = "60%",
              height = "60%",
            },
            border = "rounded",
        },
      },
          -- other filesystem opts:
        follow_current_file = true,
        use_libuv_file_watcher = true,
    },
})

-- VS Code style toggle
vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>")
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "neo-tree*",
  callback = function()
    -- Move Neo-tree to far left
    vim.cmd("wincmd H")

    local win = vim.fn.win_getid()
    if win == 0 then return end  -- no valid window

    vim.api.nvim_win_set_width(win, 40)
    -- Prevent auto-resizing
    vim.api.nvim_win_set_option(win, "winfixwidth", true)


  end,
})
