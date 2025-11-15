-- ~/.config/nvim/lua/themes/vim_dark_hard.lua
local M = {}

M.setup = function()
  vim.o.termguicolors = true
  vim.o.background = "dark"

  -- Example palette (you'll replace with actual hexes)
  local palette = {
    bg            = "#1e1e1e",
    fg            = "#d4d4d4",
    comment       = "#6a9955",
    keyword       = "#ff5555",
    string        = "#ce9178",
    type          = "#CDAD00",
    identifier    = "#009ACD",
    include       = "#66CD00",
    func          = "#CDAD00",
    number        = "#b5cea8",
    constant      = "#9cdcfe",
    preprocessor  = "#66CDAA",
    todo          = "#FFFF00",
    error         = "#ff5555",
    warn          = "#ffcc00",
    info          = "#00ffff",
    hint          = "#aaaaaa",
    -- ... add more as needed
  }

  -- Set highlights
  vim.api.nvim_set_hl(0, "Normal",       { fg = palette.fg, bg = palette.bg })
  vim.api.nvim_set_hl(0, "Comment",      { fg = palette.comment })
  vim.api.nvim_set_hl(0, "Keyword",      { fg = palette.keyword })
  vim.api.nvim_set_hl(0, "Identifier",   { fg = palette.identifier})
  vim.api.nvim_set_hl(0, "Include",      { fg = palette.include})
  vim.api.nvim_set_hl(0, "String",       { fg = palette.string })
  vim.api.nvim_set_hl(0, "Type",         { fg = palette.type })
  vim.api.nvim_set_hl(0, "Function",     { fg = palette.func })
  vim.api.nvim_set_hl(0, "Number",       { fg = palette.number })
  vim.api.nvim_set_hl(0, "Constant",     { fg = palette.constant })
  vim.api.nvim_set_hl(0, "Todo",         { fg = palette.todo})
  vim.api.nvim_set_hl(0, "PreProc",      { fg = palette.preprocessor})
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = palette.error, bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = palette.warn })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = palette.info })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = palette.hint })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = palette.error })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = palette.warn })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = palette.hint })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = palette.info })


  -- vim.api.nvim_set_hl(0, "PreProc", { fg = palette.preprocessor })
  -- vim.cmd([[
  --     syntax match PreProc "^#\w\+"
  -- ]])
  -- Add more groups: Identifier, Operator, Title, Statement, etc.

  -- Link Tree‑sitter and LSP groups (example)
  -- vim.api.nvim_set_hl(0, "@comment",          { link = "Comment" })
  -- vim.api.nvim_set_hl(0, "@keyword",          { link = "Keyword" })
  -- vim.api.nvim_set_hl(0, "@namespace_name",   { link = "Namespace" })
  -- vim.api.nvim_set_hl(0, "@string",           { link = "String" })
  -- vim.api.nvim_set_hl(0, "@type",             { link = "Type" })
  -- vim.api.nvim_set_hl(0, "@preproc",          { link = "PreProc" })
  -- vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError",   { fg = "#CD2626" })
  -- vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#ff8800" })
  -- vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultInformation", { fg = "#4fc1ff" })
  -- vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultHint",     { fg = "#10b981" })
end

return M


