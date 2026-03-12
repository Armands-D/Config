--return {
--    'ThePrimeagen/harpoon', version = '*',
--    dependencies = {
--        'nvim-lua/plenary.nvim',
--    },
--    config = function ()
--    end
--}

return {
  'cbochs/grapple.nvim', version='*',
  dependencies = {
  },
  config = function ()
  end,
  opts = {
      scope = "git", -- also try out "git_branch"
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
      { "<leader>M", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>m", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
      { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
      { "<leader>S", "<cmd>Grapple open_scopes<cr>", desc = "Grapple toggle loaded scope" },
      { "<leader>s", "<cmd>Grapple open_loaded<cr>", desc = "Grapple open loaded scope" },
  },
}
