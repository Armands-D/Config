return {
  "smithbm2316/centerpad.nvim",
  opts={

  },
  config = function ()
    -- using the command
    vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>Centerpad<cr>', { silent = true, noremap = true })
    -- or using the lua function
    vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'centerpad'.toggle{ leftpad = 50, rightpad = 50 }<cr>", { silent = true, noremap = true })
  end
}
