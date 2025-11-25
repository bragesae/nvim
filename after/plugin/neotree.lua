local window_width = 75
require("neo-tree").setup({
    filesystem = {
        filtered_items = {
        hide_dotfiles = false,  -- Show hidden files
        hide_gitignored = false,
    },
      window = {
        position = "left",
        auto_preview = true,          -- auto preview when cursor moves
        width = window_width,
        auto_resize = false, 
        number = true,
        mappings = {
          -- ["l"] = "open",
          -- ["h"] = "close_node",
          ["P"] = { "toggle_preview", config = { use_float = true } },
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

vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>")
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "neo-tree*",
  callback = function()
    -- Move Neo-tree to far left
    vim.cmd("wincmd H")

    local win = vim.fn.win_getid()
    if win == 0 then return end  -- no valid window

    vim.api.nvim_win_set_width(win, window_width)
    -- Prevent auto-resizing
    vim.api.nvim_win_set_option(win, "winfixwidth", true)


  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.opt_local.relativenumber = true
    vim.opt_local.number = true
  end,
})

-- vim.api.nvim_set_hl(0, "NeoTreeBufferNumber  ", { fg = "#" })     -- The buffer number shown in the buffers source.
-- vim.api.nvim_set_hl(0, "NeoTreeCursorLine    ", { fg = "#" })     -- |hl-CursorLine| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeDimText       ", { fg = "#" })     -- Greyed out text used in various places.
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#539ED6" })     -- Directory icon.
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#539ED6" })     -- Directory name.
-- vim.api.nvim_set_hl(0, "NeoTreeDotfile       ", { fg = "#" })     -- Used for icons and names when dotfiles are filtered.
-- vim.api.nvim_set_hl(0, "NeoTreeFileIcon      ", { fg = "#" })     -- File icon, when not overridden by devicons.
-- vim.api.nvim_set_hl(0, "NeoTreeFileName      ", { fg = "#" })     -- File name, when not overwritten by another status.
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#FFFFFF" })     -- File name when the file is open. Not used yet.
-- vim.api.nvim_set_hl(0, "NeoTreeFilterTerm    ", { fg = "#" })     -- The filter term, as displayed in the root node.
-- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder   ", { fg = "#" })     -- The border for pop-up windows.
-- vim.api.nvim_set_hl(0, "NeoTreeFloatTitle    ", { fg = "#" })     -- Used for the title text of pop-ups when the border-style
--                                               , { fg = "#" })     -- is set to another style than "NC". This is derived
--                                               , { fg = "#" })     -- from NeoTreeFloatBorder.
-- vim.api.nvim_set_hl(0, "NeoTreeTitleBar      ", { fg = "#" })     -- Used for the title bar of pop-ups, when the border-style
--                                               , { fg = "#" })     -- is set to "NC". This is derived from NeoTreeFloatBorder.
vim.api.nvim_set_hl(0, "NeoTreeGitAdded",       { fg = "#fdd835" })     -- File name when the git status is added.
vim.api.nvim_set_hl(0, "NeoTreeGitConflict",    { fg = "#6a1b9a" })     -- File name when the git status is conflict.
-- vim.api.nvim_set_hl(0, "NeoTreeGitDeleted    ", { fg = "#" })     -- File name when the git status is deleted.
-- vim.api.nvim_set_hl(0, "NeoTreeGitIgnored    ", { fg = "#" })     -- File name when the git status is ignored.
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#fdd835" })     -- File name when the git status is modified.
-- vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged   ", { fg = "#" })     -- Used for git unstaged symbol.
-- vim.api.nvim_set_hl(0, "NeoTreeGitUntracked  ", { fg = "#" })     -- File name when the git status is untracked.
-- vim.api.nvim_set_hl(0, "NeoTreeGitStaged     ", { fg = "#" })     -- Used for git staged symbol.
-- vim.api.nvim_set_hl(0, "NeoTreeHiddenByName  ", { fg = "#" })     -- Used for icons and names when `hide_by_name` is used.
-- vim.api.nvim_set_hl(0, "NeoTreeIgnored       ", { fg = "#" })     -- File name when the file is ignored by a
--                                               , { fg = "#" })     -- `.neotreeignore` or similar
-- vim.api.nvim_set_hl(0, "NeoTreeIndentMarker  ", { fg = "#" })     -- The style of indentation markers (guides). By default,
--                                               , { fg = "#" })     -- the "Normal" highlight is used.
-- vim.api.nvim_set_hl(0, "NeoTreeExpander      ", { fg = "#" })     -- Used for collapsed/expanded icons.
-- vim.api.nvim_set_hl(0, "NeoTreeNormal        ", { fg = "#" })     -- |hl-Normal| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC      ", { fg = "#" })     -- |hl-NormalNC| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeSignColumn    ", { fg = "#" })     -- |hl-SignColumn| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeStats         ", { fg = "#" })     -- Used for "stat" columns like size, last modified, etc.
-- vim.api.nvim_set_hl(0, "NeoTreeStatsHeader   ", { fg = "#" })     -- Used for the header (top line) of the above columns.
-- vim.api.nvim_set_hl(0, "NeoTreeStatusLine    ", { fg = "#" })     -- |hl-StatusLine| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeStatusLineNC  ", { fg = "#" })     -- |hl-StatusLineNC| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeVertSplit     ", { fg = "#" })     -- |hl-VertSplit| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeWinSeparator  ", { fg = "#" })     -- |hl-WinSeparator| override in Neo-tree window.
-- vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer   ", { fg = "#" })     -- |hl-EndOfBuffer| override in Neo-tree window.
vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#0d47a1" })     -- The name of the root node.
-- vim.api.nvim_set_hl(0, "NeoTreeSymbolicLinkTarget", { fg = "#" }) -- Symbolic link target.
-- vim.api.nvim_set_hl(0, "NeoTreeTitleBar      ", { fg = "#" })     -- Used for the title bar of pop-ups, when the border-style
--                                               , { fg = "#" })     -- is set to "NC". This is derived from NeoTreeFloatBorder.
-- vim.api.nvim_set_hl(0, "NeoTreeWindowsHidden ", { fg = "#" })     -- Used for icons and names that are hidden on Windows.
