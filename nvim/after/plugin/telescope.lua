-- Telescope setup with theme layout configuration
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { prompt_position = 'top' }
      -- other layout configuration here
    },
    sorting_strategy = 'ascending'
    -- other defaults configuration here
  },
  -- other configuration values here
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('v', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
