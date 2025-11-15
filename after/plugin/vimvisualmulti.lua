-- Remap VS Code style keys for multi-cursor
vim.g.VM_maps = {
  -- Add cursors vertically
  ['Select Cursor Down'] = '<S-V>', -- Shift+V adds cursor below
  ['Select Cursor Up']   = '<S-K>', -- Shift+K adds cursor above
  -- Default find under cursor
  ['Find Under']         = '<C-n>',
  ['Find Subword Under'] = '<C-n>',
}

-- Optional: make visual-multi work better in Neo-tree/floating windows
vim.g.VM_mouse_mappings = 1

