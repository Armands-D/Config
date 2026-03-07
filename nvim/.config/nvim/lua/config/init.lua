-- START Lazy
vim.g.mapleader = " " -- Set leader key before Lazy
require("config.lazy_init")
-- END Lazy

-- START set
require("config.set")
-- END set

-- START remap
require("config.remap")
-- END remap

-- START TreeSitter
local treesitter = require('nvim-treesitter')
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
-- END TreeSitter