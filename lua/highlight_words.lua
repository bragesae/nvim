-- ~/.config/nvim/lua/highlight_words.lua
-- ~/.config/nvim/lua/highlight_words.lua
local M = {}

M.ns = vim.api.nvim_create_namespace("HighlightWords")
M.active = false

-- Get visual selection, returns nil if no selection
local function get_visual_selection()
    local mode = vim.fn.mode()
    if mode ~= "v" and mode ~= "V" and mode ~= "\22" then
        return nil
    end

    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local start_row, start_col = start_pos[2], start_pos[3]
    local end_row, end_col = end_pos[2], end_pos[3]

    local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
    if #lines == 0 then return nil end

    lines[#lines] = string.sub(lines[#lines], 1, end_col)
    lines[1] = string.sub(lines[1], start_col)

    return table.concat(lines, "\n")
end

-- Highlight all occurrences of a word/selection
function M.toggle_highlight()
    local bufnr = vim.api.nvim_get_current_buf()

    -- Toggle off if already active
    if M.active then
        vim.api.nvim_buf_clear_namespace(bufnr, M.ns, 0, -1)
        M.active = false
        return
    end

    M.active = true

    -- Get visual selection or fallback to word under cursor
    local word = get_visual_selection() or vim.fn.expand("<cword>")
    if not word or word == "" then return end

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    for lnum, line in ipairs(lines) do
        local start = 1
        while true do
            local s, e = line:find(word, start, true)
            if not s then break end
            vim.api.nvim_buf_add_highlight(bufnr, M.ns, "Search", lnum - 1, s - 1, e)
            start = e + 1
        end
    end
end

return M

