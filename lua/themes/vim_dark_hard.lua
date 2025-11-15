-- ~/.config/nvim/lua/themes/vim_dark_hard.lua
local M = {}

M.setup = function()
  vim.o.termguicolors = true
  vim.o.background = "dark"

  -- Example palette (you'll replace with actual hexes)
  local palette = {
    bg       = "#1e1e1e",
    fg       = "#d4d4d4",
    comment  = "#6a9955",
    keyword  = "#ff5555",
    namespace = "#dcdc6a",
    string   = "#ce9178",
    type     = "#4ec9b0",
    func     = "#dcdcaa",
    number   = "#b5cea8",
    constant = "#9cdcfe",
    preprocessor   = "#569cd6",
    -- ... add more as needed
  }

  -- Set highlights
  vim.api.nvim_set_hl(0, "Normal",       { fg = palette.fg, bg = palette.bg })
  vim.api.nvim_set_hl(0, "Comment",      { fg = palette.comment, italic = true })
  vim.api.nvim_set_hl(0, "Keyword",      { fg = palette.keyword })
  vim.api.nvim_set_hl(0, "Namespace", { fg = palette.namespace })
  vim.api.nvim_set_hl(0, "String",       { fg = palette.string })
  vim.api.nvim_set_hl(0, "Type",         { fg = palette.type })
  vim.api.nvim_set_hl(0, "Function",     { fg = palette.func })
  vim.api.nvim_set_hl(0, "Number",       { fg = palette.number })
  vim.api.nvim_set_hl(0, "Constant",     { fg = palette.constant })
  vim.api.nvim_set_hl(0, "PreProc", { fg = palette.preprocessor })
  vim.cmd([[
	  syntax match PreProc "^#\w\+"
  ]])
  -- Add more groups: Identifier, Operator, Title, Statement, etc.

  -- Link Tree‑sitter and LSP groups (example)
  vim.api.nvim_set_hl(0, "@comment",          { link = "Comment" })
  vim.api.nvim_set_hl(0, "@keyword",          { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@namespace_name",   { link = "Namespace" })
  vim.api.nvim_set_hl(0, "@string",           { link = "String" })
  vim.api.nvim_set_hl(0, "@type",             { link = "Type" })
  vim.api.nvim_set_hl(0, "@preproc",          { link = "PreProc" })
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError",   { fg = "#f44747" })
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#ff8800" })
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultInformation", { fg = "#4fc1ff" })
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultHint",     { fg = "#10b981" })
end

return M


