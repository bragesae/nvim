local function filetree_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<leader>ft', api.tree.focus())
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- require("nvim-tree").setup()
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 60,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
--    on_attach = filetree_attach,
})
