-- keybinds

-- # Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fm', builtin.treesitter, { desc = 'Telescope treesitter functions' })

-- # Harpoon
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
vim.keymap.set('n', '<leader>b', harpoon_ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>m', harpoon_mark.add_file)
vim.keymap.set('n', '<leader>M', harpoon_mark.rm_file)
-- vim.keymap.set('n', 'j', harpoon_ui.nav_next)
-- vim.keymap.set('n', 'k', harpoon_ui.nav_prev)
