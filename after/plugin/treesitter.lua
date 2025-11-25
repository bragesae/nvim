
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc", "query" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	highlight = {
        enable = true,
		additional_vim_regex_highlighting = false,
    },
    mappings = {
         i = {
             -- On enter, always open window to the right of neotree if it is open, 
             -- if neotree is not open, open all the way to the left
             ["<CR>"] = function(prompt_buffer)
                local actions = require("telescope.actions")
                local state = require("telescope.actions.state")
                
                actions.close(prompt_buffer)

                local selection = state.get_selected_entry()
                local filepath = selection.path or selection.filename

                local neotree_win = nil
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  local buf = vim.api.nvim_win_get_buf(win)
                  " Check if this buffer is a Neo-tree buffer"
                  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                  if ft == "neo-tree" then
                    neotree_win = win
                    break
                  end
                end
                
                if (neotree_win) then
                    vim.api.nvim_set_current_win(neotree_win)
                    vim.cmd("wincmd l")  -- move to the right window
                else
                    vim.cmd("wincmd H")  -- move to far left
                end

                vim.cmd("edit " .. vim.fn.fnamespace(filepath))
             end
         },
    },

}
