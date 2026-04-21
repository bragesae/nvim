require("inlinediff").setup({
    opts = {
        debounce_time = 200,
        ignored_buftype = { "terminal", "nofile" },
        ignored_filetype = { "TelescopePrompt", "NvimTree", "neo-tree" },
        colors = {
            -- context = dim background color; change = bright background color for changed text.
            InlineDiffAddContext = "#182400",
            InlineDiffAddChange = "#395200",
            InlineDiffDeleteContext = "#240004",
            InlineDiffDeleteChange = "#520005",
        },
    },
})
