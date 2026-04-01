-- keybinds

-- # Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fs', builtin.treesitter, { desc = 'Telescope treesitter functions' }) -- find symbol
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- nvim-telescope/telescope-file-browser.nvim
vim.keymap.set("n", "<space>ef", ":Telescope file_browser<CR>")


-- # TreeSitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-- # Arhcive

-- # Harpoon
-- local harpoon_ui = require('harpoon.ui')
-- local harpoon_mark = require('harpoon.mark')
-- vim.keymap.set('n', '<leader>b', harpoon_ui.toggle_quick_menu)
-- vim.keymap.set('n', '<leader>m', harpoon_mark.add_file)
-- vim.keymap.set('n', '<leader>M', harpoon_mark.rm_file)

-- # Ranger
--vim.api.nvim_set_keymap("n", "<leader>ef", "", {
--  noremap = true,
--  callback = function()
--    require("ranger-nvim").open(true)
--  end,
--})
