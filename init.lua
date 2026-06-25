require("settings.plugins")
require("settings.remap")
require("settings.set")
-- require("themes.vim_dark_hard").setup()
vim.o.termguicolors = true
vim.o.background = "dark"
vim.opt.mouse = "a"     -- enable mouse in all modes
vim.opt.mousemodel = "extend"
vim.opt.clipboard = "unnamedplus"
require("themes.vim_dark_hard").setup()
