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
      constant    = "#1e88e5", -- "#4ec9b0",
      constant_builtin = "#D684D6",
      constant_macro = "#4ec9b0",
      variable    = "#FDFDEA",
      variable_mem = "#B2E5FF",
      func        = "#FAD900",
      type        = "#F0E17F",
      preproc     = "#FAD900",
      include     = "#56C596",
      error       = "#ff5555",
      warn        = "#ffcc00",
      info        = "#00ffff",
      hint        = "#aaaaaa",
    }

    -- Helper
    local function hl(group, opts)
      vim.api.nvim_set_hl(0, group, opts)
    end

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
    hl("@keyword.directive",            { fg = colors.include })
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
    hl("@string.escape",             { fg = colors.constant_builtin }) -- escapes: \n, \t, etc.
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
    hl("@constant.macro",            { fg = colors.preproc })

    -- Types
    hl("@type",                      { fg = colors.type })
    hl("@type.builtin",              { fg = colors.variable })
    hl("@type.definition",           { fg = colors.type })
    hl("@field",                     { fg = colors.variable })
    hl("@property",                  { fg = colors.variable_mem })

    -- Punctuation
    hl("@punctuation.delimiter",     { fg = colors.operator })
    hl("@punctuation.bracket",       { fg = colors.operator })
    hl("@punctuation.special",       { fg = colors.operator })

    -- Control flow
    hl("@exception",                 { fg = colors.keyword })

end

    
return M
