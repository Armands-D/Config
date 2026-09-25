return {
  {
    "vague-theme/vague.nvim",
    opts={
    },
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
      --vim.cmd("colorscheme vague")
    end
  },
  {
    "rezniqov/soviet.nvim",
    lazy = false,
    priority = 1000,
    opts = {}, -- Add your soviet.nvim settings here.
    config = function(_, opts)
      require("soviet").setup(opts)
      --vim.cmd.colorscheme("soviet-dark")
      -- vim.cmd.colorscheme("soviet-light")
    end,
  },
  {
      "srcery-colors/srcery-vim",
      lazy = false,
      priority = 1000,
  },
  {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
  },
  {
    "HoNamDuong/hybrid.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
