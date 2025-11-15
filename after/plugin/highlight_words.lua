-- init.lua or after/plugin/highlight_words.lua
local hw = require("highlight_words")
vim.keymap.set("n", "<C-S-l>", hw.toggle_highlight, {desc = "Highlight all occurrences of word under cursor"})

