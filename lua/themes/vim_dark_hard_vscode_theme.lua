local M = {}

M.setup = function()   

  
    local colors = {
      bg          = "#0b0b0b",
      fg          = "#ffffff",

      cursor      = "#e1e4e8",
      line        = "#2b2b2b",

      comment     = "#5c5c5c",
      keyword     = "#FF0000",
      operator    = "#dcdcaa",
      string      = "#23B26B",
      number      = "#b5cea8",
      constant    = "#4ec9b0",
      constant_builtin = "#D684D6",
      constant_macro = "#4ec9b0",
      variable    = "#FDFDEA",
      variable_mem = "#B2E5FF",
      func        = "#FAD900",
      type        = "#F0E17F",
      preproc     = "#FAD900",
      include     = "#66CCFF",
      error       = "#ff5555",
      warn        = "#ffcc00",
      info        = "#00ffff",
      hint        = "#aaaaaa",
    }

    -- Helper
    local function hl(group, opts)
      vim.api.nvim_set_hl(0, group, opts)
    end

    -- UI
    -- hl("Normal",       { fg = colors.fg, bg = colors.bg })
    -- hl("Cursor",       { fg = colors.bg, bg = colors.cursor })
    -- hl("CursorLine",   { bg = colors.line })
    -- hl("CursorColumn", { bg = colors.line })
    -- hl("LineNr",       { fg = "#555555" })
    -- hl("CursorLineNr", { fg = "#aaaaaa" })
    -- hl("Visual",       { bg = "#404040" })

    -- hl("Pmenu",        { bg = "#1e1e1e", fg = colors.fg })
    -- hl("PmenuSel",     { bg = "#333333", fg = colors.fg })
    -- hl("PmenuSbar",    { bg = "#262626" })
    -- hl("PmenuThumb",   { bg = "#444444" })

    -- hl("StatusLine",   { bg = "#1e1e1e", fg = colors.fg })
    -- hl("StatusLineNC", { bg = "#151515", fg = "#888888" })

    -- hl("VertSplit",    { fg = "#1e1e1e" })
    -- hl("SignColumn",   { bg = colors.bg })

    -- -- Core syntax
    -- hl("Comment",       { fg = colors.comment, italic = true })
    -- hl("Keyword",       { fg = colors.keyword })
    -- hl("Operator",      { fg = colors.operator })
    -- hl("Identifier",    { fg = colors.variable })
    -- hl("Function",      { fg = colors.func })
    -- hl("Constant",      { fg = colors.constant })
    -- hl("String",        { fg = colors.string })
    -- hl("Number",        { fg = colors.number })
    -- hl("Type",          { fg = colors.type })
    -- hl("Boolean",       { fg = colors.number })
    -- hl("Character",     { fg = colors.string })
    -- hl("PreProc",       { fg = colors.preproc })

    -- Diagnostics
    hl("Error",         { fg = colors.error, bold = true })
    hl("ErrorMsg",      { fg = colors.error, bold = true })
    hl("WarningMsg",    { fg = colors.warn })
    hl("MoreMsg",       { fg = colors.info })
    hl("Question",      { fg = colors.hint })
    hl("DiagnosticError", { fg = colors.error, bold = true })
    hl("DiagnosticWarn", { fg = colors.warn })
    hl("DiagnosticInfo", { fg = colors.info })
    hl("DiagnosticHint", { fg = colors.hint })
    hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
    hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warn })
    hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })
    hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
    -- Search / Highlights
    -- hl("Search",        { bg = "#613214", fg = colors.fg })
    -- hl("IncSearch",     { bg = "#754110", fg = colors.fg })
    -- hl("MatchParen",    { bg = "#333333", bold = true })

    -- -- Diff
    -- hl("DiffAdd",       { bg = "#003300" })
    -- hl("DiffChange",    { bg = "#333300" })
    -- hl("DiffDelete",    { bg = "#330000" })
    -- hl("DiffText",      { bg = "#005500" })

    -- -- Folds
    -- hl("Folded",        { fg = "#888888", bg = "#1a1a1a" })
    -- hl("FoldColumn",    { fg = "#888888", bg = colors.bg })

    -- -- Misc
    -- hl("NonText",       { fg = "#3c3c3c" })
    -- hl("SpecialKey",    { fg = "#444444" })
    -- hl("Title",         { fg = colors.keyword, bold = true })
    -- hl("Directory",     { fg = colors.keyword })
    -- hl("Delimiter",     { fg = colors.operator })
    -- hl("Statement",     { fg = colors.keyword })

    -- Comments
    hl("@comment", { fg = colors.comment })

    hl("@variable",                  { fg = colors.variable })
    hl("@variable.member",           { fg = colors.variable_mem })
    -- Keywords
    hl("@keyword",                   { fg = colors.keyword })
    hl("@keyword.function",          { fg = colors.keyword })
    hl("@keyword.return",            { fg = colors.keyword })
    hl("@keyword.operator",          { fg = colors.operator })
    hl("@keyword.import",            { fg = colors.include })
    hl("@conditional",               { fg = colors.keyword })
    hl("@repeat",                    { fg = colors.keyword })
    hl("@label",                     { fg = colors.keyword })
    hl("@module",                    { fg = colors.preproc })
    hl("@boolean",                   { fg = colors.constant_builtin })

    -- Operators
    hl("@operator",                  { fg = colors.operator })
    hl("@operator.assignment",       { fg = colors.operator })
    hl("@operator.logical",          { fg = colors.operator })
    hl("@operator.comparison",       { fg = colors.operator })
    hl("@operator.arithmetic",       { fg = colors.operator })

    -- Strings & chars
    hl("@string",                    { fg = colors.string })
    hl("@string.escape",             { fg = "#d16969" }) -- escapes: \n, \t, etc.
    hl("@string.special",            { fg = colors.string })

    -- Numbers
    hl("@number",                    { fg = colors.number })
    hl("@float",                     { fg = colors.number })

    -- Functions
    hl("@function",                  { fg = colors.func })
    hl("@function.call",             { fg = colors.func })
    hl("@function.builtin",          { fg = colors.func })
    hl("@method",                    { fg = colors.func })

    -- Variables
    hl("@variable",                  { fg = colors.variable })
    hl("@variable.builtin",          { fg = "#c586c0" }) -- like `this`, `self`

    -- Constants
    hl("@constant",                  { fg = colors.constant })
    hl("@constant.builtin",          { fg = colors.constant_builtin })
    hl("@constant.macro",            { fg = colors.constant_macro })

    -- Types
    hl("@type",                      { fg = colors.type })
    hl("@type.builtin",              { fg = colors.variable })
    hl("@type.definition",           { fg = colors.type })
    hl("@field",                     { fg = colors.variable })
    hl("@property",                  { fg = colors.variable })

    -- Punctuation
    hl("@punctuation.delimiter",     { fg = colors.operator })
    hl("@punctuation.bracket",       { fg = colors.operator })
    hl("@punctuation.special",       { fg = colors.operator })

    -- Control flow
    hl("@exception",                 { fg = colors.keyword })

end

    
return M
