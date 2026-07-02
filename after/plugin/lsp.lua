-- Diagnostics
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 2,
        severity = { min = vim.diagnostic.severity.HINT },
        max_width = 50,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- LSP attach handler
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local opts = { buffer = bufnr }

        -- Auto-format on save
        if client and client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        async = false,
                    })
                end,
            })
        end

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

        vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>gb", vim.diagnostic.goto_prev, opts)

        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end,
})

-- clangd configuration
local cwd = vim.fn.getcwd()
local compile_commands_dir = string.format("--compile-commands-dir=%s/build", cwd)
local config = string.format("--config=%s/.clangd", cwd)
local style = string.format("--fallback-style=file:%s/.clang-format", cwd)

vim.lsp.config("clangd", {
        cmd = {
       "/usr/bin/clangd-22",
        "--background-index",
        -- "--compile-commands-dir=/ros_ws/build",
        -- "--config=/ros_ws/.clangd",
        -- "--fallback-style=file:/usr/local/lib/python3.10/dist-packages/zb_lint/config/.clang-format",
        compile_commands_dir,
        -- config, 
        -- style,
    },

    -- root_dir = function()
    --     return "/ros_ws"
    -- end,
})

vim.lsp.enable("clangd")
