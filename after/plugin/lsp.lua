require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = { "clangd" },
})

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    automatic_installation = true,
	'clangd',
})

lsp.configure('clangd', {
    cmd = { 
        "/usr/bin/clangd-20", 
        "--background-index",
        "--compile-commands-dir=/ros_ws/build",
        "--config=/ros_ws/.clangd",
        "--fallback-style=file:/usr/local/lib/python3.10/dist-packages/zb_lint/config/.clang-format",
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	-- ['<S-b>'] = cmp.mapping.select_prev_item(cmp_select),
	-- ['<S-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	-- ["<S-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})
-- Diagnostics configuration
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

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
    
   if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                -- Pass the buffer explicitly to avoid nil buf errors
                vim.lsp.buf.format({ buffer = bufnr, async = false })
            end,
        })
    end 
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gd", "gdzz")
	vim.keymap.set("n", "gr", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<C-k>", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>gn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>gb", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
