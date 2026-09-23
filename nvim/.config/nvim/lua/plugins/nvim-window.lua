return {
  "yorickpeterse/nvim-window",
  keys = {
    { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = true,
  chars = {
    'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g',
    'h', 'k', 'k', 'l', 'p', 'z', 'x', 'c', 'v', 'n', 'm'
  },
}
