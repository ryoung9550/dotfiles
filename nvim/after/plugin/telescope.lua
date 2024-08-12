local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files by name' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search text in files with grep' })
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = 'Find definition' })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = 'Find implementation' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find references' })
