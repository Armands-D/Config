return {
  "kelly-lin/ranger.nvim",
  config = function()
    require("ranger-nvim").setup({
        replace_netrw = true,
        ui = {
          border = "none",
          height = 1,
          width = 1,
          x = 0.5,
          y = 0.5,
        }
    })
  end,
}
