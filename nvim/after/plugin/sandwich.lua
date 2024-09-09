-- Disable default key mappings for vim-sandwich
vim.g.sandwich_no_default_key_mappings = 1

-- Add
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(sandwich-add)', {})
vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(sandwich-add)', {})
vim.api.nvim_set_keymap('o', '<leader>a', '<Plug>(sandwich-add)', {})

-- Delete
vim.api.nvim_set_keymap('n', '<leader>d', '<Plug>(sandwich-delete)', {})
vim.api.nvim_set_keymap('x', '<leader>d', '<Plug>(sandwich-delete)', {})
vim.api.nvim_set_keymap('n', '<leader>db', '<Plug>(sandwich-delete-auto)', {})

-- Replace
vim.api.nvim_set_keymap('n', '<leader>r', '<Plug>(sandwich-replace)', {})
vim.api.nvim_set_keymap('x', '<leader>r', '<Plug>(sandwich-replace)', {})
vim.api.nvim_set_keymap('n', '<leader>rb', '<Plug>(sandwich-replace-auto)', {})
