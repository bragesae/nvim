local M = {}

-- Highlight matches in current buffer
local function highlight_matches(bufnr, pattern)
    local ns = vim.api.nvim_create_namespace("TSReplace")
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for i, line in ipairs(lines) do
        local start_col, end_col = line:find(pattern)
        if start_col then
            vim.api.nvim_buf_add_highlight(bufnr, ns, "Search", i - 1, start_col - 1, end_col)
        end
    end
end

-- Interactive TS-aware replace
function M.ts_replace(pattern, replacement)
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    -- Find all matches
    local matches = {}
    for lnum, line in ipairs(lines) do
        local start_col, _ = line:find(pattern)
        if start_col then
            table.insert(matches, {lnum = lnum, col = start_col})
        end
    end

    if #matches == 0 then
        print("No matches found for:", pattern)
        return
    end

    local idx = 1

    local function jump_to_match()
        local m = matches[idx]
        vim.api.nvim_win_set_cursor(0, {m.lnum, m.col - 1})
        highlight_matches(bufnr, pattern)
    end

    jump_to_match()

    -- Map Enter to replace current match
    vim.keymap.set("n", "<CR>", function()
        local cur_line = vim.api.nvim_get_current_line()
        cur_line = cur_line:gsub(pattern, replacement, 1) -- replace only once
        local row = vim.api.nvim_win_get_cursor(0)[1] - 1
        vim.api.nvim_buf_set_lines(bufnr, row, row + 1, false, {cur_line})

        -- Move to next match
        idx = idx + 1
        if idx > #matches then
            print("All matches processed")
            vim.keymap.del("n", "<CR>")
            vim.keymap.del("n", "j")
            vim.keymap.del("n", "k")
            return
        end
        jump_to_match()
    end, {buffer = bufnr})

    -- Map j/k to navigate matches without replacing
    vim.keymap.set("n", "j", function()
        idx = math.min(idx + 1, #matches)
        jump_to_match()
    end, {buffer = bufnr})

    vim.keymap.set("n", "k", function()
        idx = math.max(idx - 1, 1)
        jump_to_match()
    end, {buffer = bufnr})

    vim.keymap.set("n", "<Esc>", function()
    print("Exited Tree-sitter replace mode")
    vim.keymap.del("n", "<CR>", {buffer = bufnr})
    vim.keymap.del("n", "j", {buffer = bufnr})
    vim.keymap.del("n", "k", {buffer = bufnr})
    vim.keymap.del("n", "<Esc>", {buffer = bufnr})

    -- Clear the highlights
    local ns = vim.api.nvim_create_namespace("TSReplace")
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1) 

    end, {buffer = bufnr})
end

return M

